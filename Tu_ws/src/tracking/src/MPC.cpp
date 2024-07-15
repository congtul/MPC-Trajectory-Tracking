#include "MPC.h"
#include <ros/ros.h>
MPC::MPC()
{

}
MPC::~MPC()
{

}
void MPC::create_path()
{
    TrajectoryPath path;
    path.setInputPointsXY(Waypoint_x, Waypoint_y, numWaypoint);
    path.setParameters((TrajectoryType)path_type);
    ref_path = path.generateTrajectoryPath();
    // for(int i = 0; i < ref_path.size_cols(); i++)
    // {
    //     ROS_INFO("%f", ref_path(2,i)*180/3.14);
    // }
}
void MPC::get_linearized_model(double X,double Y,double yaw,double v,double L)
{
    double A[4*4] = {
                1, 0, -v*sin(yaw)*0.1,       0,
                0, 1,  v*cos(yaw)*0.1,       0,
                0, 0,               1, v/L*0.1,
                0, 0,               0,       1,
    };
    Ae = Matrix(A,4U,4U);
    double B[4*1] = {
                0,
                0,
                v/L*0.1,
                1
    };
    Be = Matrix(B,4U,1U);
    double C[3*4] = {
                1, 0, 0, 0,
                0, 1, 0, 0,
                0, 0, 1, 0,
    };
    Ce = Matrix(C,3U,4U);
}
int MPC::find_nearest_point(double X, double Y, int index_cur)
{
    int max_index = ref_path.size_cols();
    int offset = 20;
    int index = 0;
    if (index_cur <= offset)
    {
        double dmin = std::sqrt((X - ref_path.get_value(0,0))*(X - ref_path.get_value(0,0)) 
                + (Y - ref_path.get_value(1,0))*(Y - ref_path.get_value(1,0)));
        for(int i = 1; i < index_cur + offset; i++)
        {
            double d = std::sqrt((X - ref_path.get_value(0,i))*(X - ref_path.get_value(0,i)) 
            + (Y - ref_path.get_value(1,i))*(Y - ref_path.get_value(1,i)));
            if (dmin > d)
            {
                dmin = d;
                index = i;
            }
        }
    }

    if (offset < index_cur && index_cur < max_index - offset)
    {
        double dmin = std::sqrt((X - ref_path.get_value(0,index_cur - offset))*(X - ref_path.get_value(0,index_cur - offset)) 
                + (Y - ref_path.get_value(1,index_cur - offset))*(Y - ref_path.get_value(1,index_cur - offset)));
        for(int i = index_cur - offset + 1; i < index_cur + offset; i++)
        {
            double d = std::sqrt((X - ref_path.get_value(0,i))*(X - ref_path.get_value(0,i)) 
            + (Y - ref_path.get_value(1,i))*(Y - ref_path.get_value(1,i)));
            if (dmin > d)
            {
                dmin = d;
                index = i;
            }
        }
    }

    if (index_cur >= max_index - offset)
    {
        double dmin = std::sqrt((X - ref_path.get_value(0,index_cur - offset))*(X - ref_path.get_value(0,index_cur - offset)) 
                + (Y - ref_path.get_value(1,index_cur - offset))*(Y - ref_path.get_value(1,index_cur - offset)));
        for(int i = index_cur - offset + 1; i < max_index; i++)
        {
            double d = std::sqrt((X - ref_path.get_value(0,i))*(X - ref_path.get_value(0,i)) 
            + (Y - ref_path.get_value(1,i))*(Y - ref_path.get_value(1,i)));
            if (dmin > d)
            {
                dmin = d;
                index = i;
            }
        }
    }
    return index;
}
void MPC::create_trajectory(double X, double Y, double yaw, int8_t Np, double v)
{
    int index = find_nearest_point(X,Y, index_cur);
    index_cur = index;
    int mpc_start = index;
    int mpc_end = mpc_start;
    double distance = v*Np*0.1;
    // ROS_INFO("distance = %f", distance);
    double R[3*Np], traj[3*Np];
    double dis_ref = 0;
    while ((dis_ref < distance) && (mpc_end < ref_path.size_cols() -1))
    {
        mpc_end = mpc_end + 1;
        double temp = std::sqrt((ref_path.get_value(0,mpc_end)-ref_path.get_value(0,mpc_end-1))*(ref_path.get_value(0,mpc_end)-ref_path.get_value(0,mpc_end-1))
                                 +(ref_path.get_value(1,mpc_end)-ref_path.get_value(1,mpc_end-1))*(ref_path.get_value(1,mpc_end)-ref_path.get_value(1,mpc_end-1)));
        dis_ref = dis_ref + temp;
    }
    for(int i = 0; i < Np; i++)
    {
        int index_ref = mpc_start + round((mpc_end - mpc_start)/Np*(i+1));
        R[3*i] = ref_path.get_value(0,index_ref) - (X + (i+1)*v*cos(yaw)*0.1);
        R[3*i+1] = ref_path.get_value(1,index_ref) - (Y + (i+1)*v*sin(yaw)*0.1);
        R[3*i+2] = ref_path.get_value(2,index_ref) - yaw;
        traj[3*i] = ref_path(0,index_ref);
        traj[3*i+1] = ref_path(1,index_ref);
        traj[3*i+2] = ref_path(2,index_ref);
    }
    ref_trajectory = Matrix(traj,3*Np,1U);
    Rs = Matrix(R,3*Np,1U);
}
double MPC::QP_solver()
{
    Matrix h(3*Np,Ae.size_cols());
    Matrix F(3*Np,Ae.size_cols());
    // for(int i = 0; i < 4; i++)
    // {
    //     for(int j = 0; j < 4; j++)
    //     {
    //         ROS_INFO("A(%d,%d): %f", i,j,Ae(i,j));
    //     }
    // }
    // for(int i = 0; i < 4; i++)
    // {
    //     ROS_INFO("B(%d,0): %f", i, Be(i,0));
    // }
    Matrix F_temp = Ce*Ae;
    Matrix h_temp = Ce;
    for(int i=0;i < 3;i++)
    {
        for(int j = 0; j < Ae.size_cols(); j++)
        {
            h(i,j) = h_temp(i,j);
            F(i,j) = F_temp(i,j);
        }
    }
    for(int i=1; i<Np; i++)
    {
        F_temp = F_temp*Ae;
        h_temp = h_temp*Ae;
        for(int j=0;j < 3; j++)
        {
            for(int k = 0; k < Ae.size_cols(); k++)
            {
                h(3*i+j,k) = h_temp(j,k);
                F(3*i+j,k) = F_temp(j,k);
            }
        }
    }
    // for(int i = 0; i < 21; i++)
    // {
    //     for (int j = 0; j < 4; j++)
    //     {
    //         ROS_INFO("F(%d,%d): %f", i, j, F(i,j));
    //     }
    // }
    // for(int i = 0; i < 21; i++)
    // {
    //     for (int j = 0; j < 4; j++)
    //     {
    //         ROS_INFO("h(%d,%d): %f", i, j, h(i,j));
    //     }
    // }
    Matrix v = h*Be;
    Matrix G(3*Np,Nc);
    for(int i = 0; i < Nc; i++)
    {
        for(int j = 3*i; j < 3*Np; j++)
        {
            G(j,i) = v(j-3*i,0);
        }
    }
    // for(int i = 0; i < 21; i++)
    // {
    //     for (int j = 0; j < 7; j++)
    //     {
    //         ROS_INFO("G(%d,%d): %f", i, j, G(i,j));
    //     }
    // }
    Matrix H = G.transpose()*Qy*G + R;
    // for(int i = 0; i < 7;i++)
    // {
    //     for(int j = 0; j < 7; j++)
    //     {
    //         ROS_INFO("H(%d,%d): %f", i,j,H(i,j));
    //     }
    // }
    H = (H + H.transpose());
    H = H*1/2;
    // ROS_INFO("-------------------------------------------------");
    // for(int i = 0; i < 7;i++)
    // {
    //     for(int j = 0; j < 7; j++)
    //     {
    //         ROS_INFO("H(%d,%d): %f", i,j,H(i,j));
    //     }
    // }
    Matrix f = G.transpose()*Qy*(F*Xe-Rs);
    Matrix delta_U = (H.inverse()*f);
    delta_U = delta_U*-1;
    //DEBUG  
    // return delta_U(0,0);
    //DEBUG
    // check if violate constraints or not
    int temp = 0;
    Matrix Check = M*delta_U - N;
    for(int i = 0; i<2*Nc;i++)
    {
        if(Check(i,0) > 0) temp++;        
    }
    if(temp == 0) return delta_U(0,0);
    // //-------------------Hildreth-----------------//
    Matrix P = M*(H.inverse())*(M.transpose());
    Matrix d = (N + M*(H.inverse()*f));
    int n = d.size_rows();
    int m = d.size_cols();
    Matrix x_ini(n,m);
    Matrix lambda = x_ini;
    Matrix lambda_p = x_ini;
    double al = 1;
    int kmax = 500;
    double epsilon = 1e-8;
    int k = 0;
    while(al > epsilon && k < kmax)
    {
        lambda_p = lambda;
        for(int i = 0; i < n; i++)
        {
            Matrix P_row(P.get_pointer_row(i), 1, P.size_cols());
            double w = (P_row*lambda)(0,0) - P(i,i)*lambda(i,0);
            w = w + d(i,0);
            double la = -w/P(i,i);
            lambda(i,0) = std::max(0.0,la);
        }
        Matrix diff = lambda - lambda_p;
        al = (diff.transpose() * diff)(0,0);
        k++;
    }
    // ROS_INFO("k = %d", k);
    if(k >= kmax)
    {
        ROS_INFO("MAX ITERATION!");
    }
    delta_U = delta_U - H.inverse()*M.transpose()*lambda;
    return delta_U(0,0);
}