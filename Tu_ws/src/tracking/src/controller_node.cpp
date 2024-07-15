// 1 timer serial with STM
// 1 timer for controller
// 1 timer for UI
#include <ros/ros.h>
#include <iostream>
#include <boost/algorithm/string.hpp>

#include "std_msgs/String.h" //Ros defined String data type
#include "sensor_msgs/NavSatFix.h"
#include <serial/serial.h>
#include "std_msgs/Float64.h"
#include "ugv_msgs/GPS.h"
#include "ugv_msgs/IMU.h"
#include "ugv_msgs/toUGV.h"
#include "ugv_msgs/toGUI.h"
#include "MPC.h"
#include "LQR.h"
#include "matrix.h"

#define PI_M 3.14159265

MPC MPC_obj;
LQR LQR_obj;
serial::Serial sp;
std::string data;
std::vector<std::string> subdata;
double yaw;
ugv_msgs::toGUI msg1;
ros::Publisher pub1;
uint8_t mode = 0;
uint8_t start_mode = 0;
uint8_t send_parameters = 0;
double set_speed = 0;
double set_angle = 0; //deg from GUI
double heading = 0;
double lat = 0;
double lng = 0;
double lat_base = 10.772724558212408;
double lng_base = 106.659784922910148;
double X_cur = 0;
double Y_cur = 0;

// Callback receive from GUI, IMU, GPS and feedback from STM
void Callback_GUI_config(const ugv_msgs::toUGV::ConstPtr& msg);
void Callback_IMU(const ugv_msgs::IMU::ConstPtr& msg);
void Callback_GPS(const ugv_msgs::GPS::ConstPtr& msg);
void Callback_serial_STM(const ros::TimerEvent&);
// Callback for sending data to STM, GUI
void Callback_controller(const ros::TimerEvent&);
void Callback_UI(const ros::TimerEvent&);
//
void send_data_to_MCU(double speed, double angle);
int main(int argc, char **argv)
{
	ros::init(argc, argv, "Controller_node");
	ros::NodeHandle n;
	ROS_INFO("[Main] Start Init Controller Node!!!");
    // Set up multi-threaded spinner with 4 threads
    ros::MultiThreadedSpinner spinner(4);
    std::string port("/dev/ttyUSB0"); //achieve name of port	
    serial::Timeout to = serial::Timeout::simpleTimeout(20);
    // Set the name of the serial port to be opened
	sp.setPort(port);
		// Set the baud rate of serial communication
	sp.setBaudrate(115200);
		// Serial port set timeout
	sp.setTimeout(to);
    sp.open();
    if(sp.isOpen())
    	std::cout << " Yes." << std::endl;
  	else
   	 	std::cout << " No." << std::endl;
	ros::Duration(1).sleep(); // waiting for serial is ready
    // Publish to GUI
    pub1 = n.advertise<ugv_msgs::toGUI>("measures", 100000);
    // Callback receive from GUI, IMU and GPS
    ros::Subscriber sub_IMU = n.subscribe("IMU_node", 1000, Callback_IMU);
    ros::Subscriber sub_GPS = n.subscribe("GPS_node", 1000, Callback_GPS);
    ros::Subscriber sub_GUI = n.subscribe("settings", 1000, Callback_GUI_config);
    ros::Timer timer2 = n.createTimer(ros::Duration((double)0.015), Callback_serial_STM); // Read UART from MCU every 15ms
    // sending data to STM, GUI
    ros::Timer timer1 = n.createTimer(ros::Duration((double)0.1), Callback_controller); // 100ms for 1 controll cycle
    ros::Timer timer3 = n.createTimer(ros::Duration((double)0.015), Callback_UI); // publish data to topic for GUI every 15ms
    spinner.spin();
    while(ros::ok())
    {

    }
    std::cout<<"............Ending............"<<std::endl;  
    return 0;
}
void Callback_GUI_config(const ugv_msgs::toUGV::ConstPtr& msg)
{
    mode = msg->mode;
    start_mode = msg->start_mode;
    send_parameters = msg->send_parameters;
    // ROS_INFO("HELLO");
    // ROS_INFO("Mode %d", mode);
    switch(mode)
    {
        case 0: //Updata PID
        {
            //Implement in fure
            break;
        }
        case 1: //Manual
        {
            set_angle = msg->set_angle;
            set_speed = msg->set_speed;
            break;
        }
        case 2: //MPC
        {
            // ROS_INFO("HELLO");
            // ROS_INFO("Send %d", send_parameters);
            if(send_parameters == 0) break;
            //Update parameters of MPC
            MPC_obj.set_speed = msg->set_speed;
            MPC_obj.Np = msg->mpc_Np;
            MPC_obj.Nc = msg->mpc_Nc;
            MPC_obj.L_wheel = msg->mpc_L_wheel;

            // Matrix Qy
            // Allocate memory for the rows
            double** Qy = new double*[3 * MPC_obj.Np];
            for (int i = 0; i < 3 * MPC_obj.Np; ++i) {
                Qy[i] = new double[3 * MPC_obj.Np](); // Initializing with zeros using ()
            }
            for(int i = 0; i < MPC_obj.Np - 1; i++)
            {
                Qy[3*i][3*i] = msg->mpc_Q[0];
                Qy[3*i+1][3*i+1] = msg->mpc_Q[1];
                Qy[3*i+2][3*i+2] = msg->mpc_Q[2];
            }
            Qy[3*(MPC_obj.Np-1)][3*(MPC_obj.Np-1)] = msg->mpc_Qp[0];
            Qy[3*(MPC_obj.Np-1)+1][3*(MPC_obj.Np-1)+1] = msg->mpc_Qp[1];
            Qy[3*(MPC_obj.Np-1)+2][3*(MPC_obj.Np-1)+2] = msg->mpc_Qp[2];
            MPC_obj.Qy = Matrix(Qy,(int)(3*MPC_obj.Np),(int)(3*MPC_obj.Np));
            // Don't forget to free the allocated memory
            for (int i = 0; i < 3 * MPC_obj.Np; ++i) {
                delete[] Qy[i];
            }
            delete[] Qy;
            // Matrix R
            double** R_input = new double*[MPC_obj.Nc];
            for (int i = 0; i < MPC_obj.Nc; ++i) {
                R_input[i] = new double[MPC_obj.Nc](); // Initializing with zeros using ()
            }
            for(int i = 0; i < MPC_obj.Nc; i++)
            {
                R_input[i][i] = msg->mpc_R;
            }
            MPC_obj.R = Matrix(R_input,MPC_obj.Nc,MPC_obj.Nc);
            // Don't forget to free the allocated memory
            for (int i = 0; i < MPC_obj.Nc; ++i) {
                delete[] R_input[i];
            }
            delete[] R_input;
            // Constraint of input
            MPC_obj.umax = msg->mpc_umax*PI_M/180;
            MPC_obj.umin = msg->mpc_umin*PI_M/180;
            // Matrix M
            double** M_input = new double*[2*MPC_obj.Nc];
            for (int i = 0; i < 2*MPC_obj.Nc; ++i) {
                M_input[i] = new double[MPC_obj.Nc](); // Initializing with zeros using ()
            }
            for(int i = 0; i< MPC_obj.Nc;i++)
            {
                for(int j = 0; j <= i; j++)
                {
                    M_input[i][j] = 1;
                    M_input[i+MPC_obj.Nc][j] = -1;
                }
            }
            MPC_obj.M = Matrix(M_input,2*MPC_obj.Nc,MPC_obj.Nc);
            for (int i = 0; i < 2*MPC_obj.Nc; ++i) {
                delete[] M_input[i];
            }
            delete[] M_input;
            // Create path
            for (int i = 0; i<10;i++)
            {
                MPC_obj.Waypoint_x[i] = msg->X_point[i];
                MPC_obj.Waypoint_y[i] = msg->Y_point[i];
            }
            MPC_obj.numWaypoint = msg->numWaypoint;
            MPC_obj.path_type = msg->TrajectoryType;
            MPC_obj.create_path();
            // for(int i = 0; i < 5; i++)
            // {
            //     ROS_INFO("Ref_path(0,%d): %f", i, MPC_obj.ref_path(0,i));
            //     ROS_INFO("Ref_path(1,%d): %f", i, MPC_obj.ref_path(1,i));
            // }
            lat_base = msg->lat_base;
            lng_base = msg->lng_base;
            ROS_INFO("Init MPC parameters successfully");
            break;
        }
        case 3: //LQR
        {
            if(send_parameters == 0) break;
            // Update LQR parameters
            double R_input[1] = {msg->lqr_R};
            LQR_obj.R = Matrix(R_input,1,1);
            LQR_obj.set_speed = msg->set_speed;
            LQR_obj.Np = msg->lqr_Np;
            LQR_obj.umax = msg->lqr_umax*PI_M/180;
            LQR_obj.umin = msg->lqr_umin*PI_M/180;
            LQR_obj.L_wheel = msg->lqr_L_wheel;

            //Matrix Q
            double Q_input[6*6] = {0};
            for(int i = 0; i < 3; i++)
            {
                Q_input[7*i] = msg->lqr_Q[i];
            }
            for(int i = 3; i < 6; i++)
            {
                Q_input[7*i] = msg->lqr_K[i-3];
            }
            LQR_obj.Q = Matrix(Q_input,6,6);
            // Create path
            for (int i = 0; i<10;i++)
            {
                LQR_obj.Waypoint_x[i] = msg->X_point[i];
                LQR_obj.Waypoint_y[i] = msg->Y_point[i];
            }
            LQR_obj.numWaypoint = msg->numWaypoint;
            LQR_obj.path_type = msg->TrajectoryType;
            LQR_obj.create_path();
            lat_base = msg->lat_base;
            lng_base = msg->lng_base;
            ROS_INFO("Init LQR parameters successfully");
            break;
        }
    }
}
void Callback_IMU(const ugv_msgs::IMU::ConstPtr& msg)
{
	heading = msg->yaw; //deg
}
void Callback_GPS(const ugv_msgs::GPS::ConstPtr& msg)
{
	lat = msg->lat;
	lng = msg->lng;
    // ROS_INFO("Hello");
    TrajectoryPath path;
    path.ConverttoXY(lat,lng,lat_base,lng_base,X_cur,Y_cur);
}
void Callback_serial_STM(const ros::TimerEvent&)
{
    if(sp.isOpen())
    {
    try
       {
        std::string data;
        std::vector<std::string> subdata;
        data = sp.readline(105, "\r\n");
        // #TODO
        // ROS_INFO("data_size %d", data.size());
        if (data.size() != 15) return;
        // #TODO
        // ROS_INFO("data = %s",data);
        std::string speed_str = data.substr(0,5);
        // ROS_INFO("speed = %c",speed_str);
        subdata.push_back(speed_str); 
        std::string steer_str = data.substr(7,12);
        // ROS_INFO("steer = %c",steer_str);
        subdata.push_back(steer_str);
        float speed, steer;
        speed = (std::strtod(subdata[0].c_str(),0));
        steer = (std::strtod(subdata[1].c_str(),0));
        // ROS_INFO("Speed = %f", speed);
        // ROS_INFO("Steer = %f", steer);
        msg1.steering = steer/100;
        msg1.speed_left = speed/10;
        msg1.speed_right = speed/10;
       }
    catch(boost::exception const& err)
    {
        std::cout<<"Cannot navigate..." << std::endl;
    }

    }
}
void Callback_controller(const ros::TimerEvent&)
{
 
    static int stop_done = 0;
    if(start_mode != 1)
    {
        if(stop_done == 0)
        {
        ROS_INFO("Stop mode successfully");
        send_data_to_MCU(0, 0);
        set_speed = 0;
        set_angle = 0;
        stop_done = 1;
        MPC_obj.set_angle = 0;
        LQR_obj.set_angle = 0;
        MPC_obj.set_speed = 0;
        LQR_obj.set_speed = 0;
        LQR_obj.e = LQR_obj.e*0;
        msg1.set_speed = 0;
        msg1.set_steering = 0;
        MPC_obj.index_cur = 0;
        LQR_obj.index_cur = 0;
        }
        return;
    }
    stop_done = 0;
    // ROS_INFO("Start controller");
    switch(mode)
    {
        case 0: //Mode update PID
        {
            //Implement in future
            break;
        }
        case 1: //Manual
        {
            if(start_mode == 1)
            {
                static double send_speed = 0;
                send_speed = send_speed * 0.7 + set_speed * 0.3;
                send_data_to_MCU(send_speed, set_angle);
                msg1.set_speed = send_speed;
                msg1.set_steering = set_angle;
            }
            break;
        }
        case 2: //MPC
        {
            if(start_mode == 1)
            {
                MPC_obj.get_linearized_model(X_cur,Y_cur,heading*PI_M/180,MPC_obj.set_speed,MPC_obj.L_wheel);
                MPC_obj.create_trajectory(X_cur,Y_cur,heading*PI_M/180,MPC_obj.Np,MPC_obj.set_speed);
                msg1.num_mpc_refpath = (int) (MPC_obj.Rs.size_rows()/3);
                for (int i = 0; i < msg1.num_mpc_refpath; i++)
                {
                    msg1.x_mpc_repath[i] = MPC_obj.ref_trajectory.get_value(3*i,0);
                    msg1.y_mpc_repath[i] = MPC_obj.ref_trajectory.get_value(3*i+1,0);
                    msg1.yaw_mpc_repath[i] = MPC_obj.ref_trajectory.get_value(3*i+2,0);  
                    // ROS_INFO("x(%d): %f", i, msg1.x_mpc_repath[i]);
                    // ROS_INFO("y(%d): %f", i, msg1.y_mpc_repath[i]);               
                }
                // create matrix N
                double N_input[2*MPC_obj.Nc] = {0};
                for(int i = 0; i < MPC_obj.Nc; i++)
                {
                    N_input[i] = MPC_obj.umax - MPC_obj.set_angle;
                    N_input[i+MPC_obj.Nc] = -MPC_obj.umin + MPC_obj.set_angle;
                }
                MPC_obj.N = Matrix(N_input,2*MPC_obj.Nc,1);
                // create matrix Xe
                double Xe[4] = {0, 0, 0, MPC_obj.set_angle};
                MPC_obj.Xe = Matrix(Xe,4U,1U);
                // QP solver
                double delta_U = MPC_obj.QP_solver();
                ROS_INFO("delta U = %f", delta_U);
                MPC_obj.set_angle += delta_U; //rad
                ROS_INFO("U = %f", MPC_obj.set_angle);
                send_data_to_MCU(MPC_obj.set_speed, MPC_obj.set_angle*180/PI_M);
                msg1.set_speed = MPC_obj.set_speed;
                msg1.set_steering = MPC_obj.set_angle*180/PI_M;
                break;
            }
        }
        case 3: //LQR
        {
            if(start_mode == 1)
            {
                double p = 0.2;
                int index = LQR_obj.find_nearest_point(X_cur, Y_cur,LQR_obj.index_cur);
                LQR_obj.index_cur = index;
                LQR_obj.get_linearized_model(LQR_obj.ref_path(0,index),LQR_obj.ref_path(1,index),LQR_obj.ref_path(2,index),LQR_obj.set_speed,LQR_obj.L_wheel);
                // Matrix Xe
                double Xe_input[3] = { X_cur-LQR_obj.ref_path(0,index), Y_cur-LQR_obj.ref_path(1,index), heading*PI_M/180-LQR_obj.ref_path(2,index)};
                Matrix Xe(Xe_input,3,1);
                // Matrix e
                LQR_obj.e = LQR_obj.e + Xe*0.1;       
                Matrix Klqr = LQR_obj.LQR_solver();
                for(int i  = 0; i < 6; i++)
                {
                    ROS_INFO("Klqr(%d,0): %f", i, Klqr(0,i));
                }
                //Matrix Kx
                double Kx_input[3] = {Klqr(0,0), Klqr(0,1), Klqr(0,2)};
                Matrix Kx = Matrix(Kx_input,1,3);
                //Matrix Ki
                double Ki_input[3] = {Klqr(0,3), Klqr(0,4), Klqr(0,5)};
                Matrix Ki = Matrix(Ki_input,1,3);
                // steering angle 
                Matrix u_lqr = (Kx*Xe)*-1 + Ki*LQR_obj.e;
                // Matrix u_lqr = (Kx*Xe)*-1;
                double u_pure = LQR_obj.Pure_pursuit_controller(X_cur, Y_cur, heading*PI_M/180);
                // Send ref points to GUI
                msg1.x_mpc_repath[0] = LQR_obj.ref_path(0,index);
                msg1.y_mpc_repath[0] = LQR_obj.ref_path(1,index);
                msg1.yaw_mpc_repath[0] = LQR_obj.ref_path(2,index);
                msg1.x_mpc_repath[1] = LQR_obj.ref_path(0,LQR_obj.point_ahead);
                msg1.y_mpc_repath[1] = LQR_obj.ref_path(1,LQR_obj.point_ahead);
                msg1.yaw_mpc_repath[1] = LQR_obj.ref_path(2,LQR_obj.point_ahead);
                LQR_obj.set_angle = p*u_lqr(0,0) + (1-p)*u_pure;
                // Constraint of input
                if(LQR_obj.set_angle > LQR_obj.umax)
                {
                    LQR_obj.set_angle = LQR_obj.umax;
                }
                if(LQR_obj.set_angle < LQR_obj.umin)
                {
                    LQR_obj.set_angle = LQR_obj.umin;
                }
                // ROS_INFO("angle: %f", LQR_obj.set_angle*180/PI_M);
                // Send data
                send_data_to_MCU(LQR_obj.set_speed, LQR_obj.set_angle*180/PI_M);
                msg1.set_speed = LQR_obj.set_speed;
                msg1.set_steering = LQR_obj.set_angle*180/PI_M;
                break;
            }
        }
    }
    // ROS_INFO("Finish controller");
}
void Callback_UI(const ros::TimerEvent&)
{
	//Send data to GUI
	msg1.lat_postion = lat;
	msg1.lng_postion = lng;
	msg1.yaw = heading; //deg
    msg1.x = X_cur;
    msg1.y = Y_cur;
    // ROS_INFO("lat %f", lat);
    pub1.publish(msg1);
}

void send_data_to_MCU(double speed, double angle)
{
    int speed_send, angle_send;
    uint8_t data[15];
    speed_send = (int) (speed*100);
    angle_send = (int) (angle*100);
    if (speed_send < 0)
    {
        data[0] = '-';
        speed_send = speed_send * -1;
    }
    else data[0] = '+';
    if (angle_send < 0)
    {
        data[7] = '-';
        angle_send = angle_send * -1;
    }
    else data[7] = '+';
    data[6] = ',';
    for(int i = 0; i < 5; i++)
    {
        data[i+1] = '0';
        data[i+8] = '0';
    }
    int cnt = 0;
    while(speed_send !=0 & cnt < 5)
    {
        data[5-cnt] = (int) (speed_send % 10) + 0x30;
        speed_send = (int) (speed_send/10);
        cnt++;
    }
    cnt = 0;
    while(angle_send !=0 & cnt < 5)
    {
        data[12-cnt] = (int) (angle_send % 10) + 0x30;
        angle_send = (int) (angle_send/10);
        cnt++;
    }
    data[13] = '\r';
    data[14] = '\n';
    // data[2] = '1';
    // data[3] = '2';
    // for(int i = 0; i< 15; i++)
    // {
    //     ROS_INFO("data[%d]: %c", i, data[i]);
    // }
    sp.write(data,15U);
}
