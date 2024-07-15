#include "LQR.h"
LQR::LQR()
{
    double e_input[3] = {0, 0, 0};
    e = Matrix(e_input,3,1);
}
LQR::~LQR()
{

}
void LQR::create_path()
{
    TrajectoryPath path;
    path.setInputPointsXY(Waypoint_x, Waypoint_y, numWaypoint);
    path.setParameters((TrajectoryType)path_type);
    ref_path = path.generateTrajectoryPath();
}
void LQR::get_linearized_model(double X,double Y,double yaw,double v,double L)
{
    double A[6*6] = {
                1,      0,   -v*sin(yaw)*0.1,       0,      0,       0,
                0,      1,    v*cos(yaw)*0.1,       0,      0,       0,
                0,      0,                 1,       0,      0,       0,
             -0.1,      0,                 0,       1,      0,       0,
                0,   -0.1,                 0,       0,      1,       0,
                0,      0,              -0.1,       0,      0,       1,
    };
    Ae = Matrix(A,6U,6U);
    double B[6*1] = {
                0,
                0,
                v/L*0.1,
                0,
                0,
                0,
    };
    Be = Matrix(B,6U,1U);
}
int LQR::find_nearest_point(double X, double Y, int index_cur)
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
Matrix LQR::LQR_solver()
{
    // for(int i = 0; i < 6; i++)
    // {
    //     for(int j  = 0; j < 6; j++)
    //     {
    //         ROS_INFO("A(%d,%d): %f", i,j, Ae(i,j));
    //     }
    // }
    // for(int i  = 0; i < 6; i++)
    // {
    //     ROS_INFO("B(%d,0): %f", i, Be(i,0));
    // }

    Matrix P = Q;
    // for(int i = 0; i < 6; i++)
    // {
    //     for(int j  = 0; j < 6; j++)
    //     {
    //         ROS_INFO("P(%d,%d): %f", i,j, P(i,j));
    //     }
    // }
    int max_inter = 200;
    double eps = 100;
    Matrix Pn;
    double max;
    for(int i = 0; i < max_inter; i++)
    {
        Matrix Temp = R + Be.transpose()*P*Be; 
        Pn = Ae.transpose()*P*Ae - Ae.transpose()*P*Be*Temp.inverse()*Be.transpose()*P*Ae + Q;
        max = fabs(Pn(0,0) - P(0,0));
        for(int j = 0; j < P.size_rows(); j++)
        {
            for(int k = 0; k < P.size_cols(); k++)
            {
                double m = fabs(Pn(j,k) - P(j,k));
                if(m > max)
                {
                    max = m;
                }
            }
        }
        if(max < eps) break;
        P = Pn;
    }
    // for(int i = 0; i < 6; i++)
    // {
    //     for(int j  = 0; j < 6; j++)
    //     {
    //         ROS_INFO("P(%d,%d): %f", i,j, P(i,j));
    //     }
    // }
    // ROS_INFO("Max = %f", max);
    Matrix Temp = Be.transpose()*Pn*Be + R;
    return Temp.inverse()*Be.transpose()*Pn*Ae;
}
double LQR::Pure_pursuit_controller(double X, double Y, double yaw)
{
    int index = find_nearest_point(X, Y, index_cur);
    point_ahead = index;
    double distance = set_speed*Np*0.1;
    double dist_ref = 0;
    while((dist_ref < distance) && (point_ahead < ref_path.size_cols()))
    {
        point_ahead = point_ahead + 1;
        dist_ref = dist_ref + std::sqrt((ref_path.get_value(0,point_ahead)-ref_path.get_value(0,point_ahead-1))*(ref_path.get_value(0,point_ahead)-ref_path.get_value(0,point_ahead-1))
                                 +(ref_path.get_value(1,point_ahead)-ref_path.get_value(1,point_ahead-1))*(ref_path.get_value(1,point_ahead)-ref_path.get_value(1,point_ahead-1)));
    }
    // ROS_INFO("Index: %d, point ahead: %d", index, point_ahead);
    double alpha = atan2(ref_path(1,point_ahead)-Y, ref_path(0,point_ahead)-X) - yaw;
    double ld = std::sqrt((ref_path(0,point_ahead)-X)*(ref_path(0,point_ahead)-X) + (ref_path(1,point_ahead)-Y)*(ref_path(1,point_ahead)-Y));
    return atan2(2*L_wheel*sin(alpha), ld);
}
