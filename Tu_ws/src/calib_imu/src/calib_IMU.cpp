#include <ros/ros.h>
#include <iostream>
#include "std_msgs/String.h" //Ros defined String data type
#include <ros/ros.h>
#include <iostream>
#include <boost/algorithm/string.hpp>

#include "std_msgs/String.h" //Ros defined String data type
#include "sensor_msgs/NavSatFix.h"
#include <serial/serial.h>
#include "std_msgs/Float64.h"
#include "ugv_msgs/IMU_calib.h"
serial::Serial sp;
int8_t mode = 0;
double parameters = 0;
std::string data;
void Callback_GUI_config(const ugv_msgs::IMU_calib::ConstPtr& msg)
{
    mode = msg->mode;
    parameters = msg->parameters;
    ROS_INFO("HIIIIIIII");
    switch(mode)
    {
    case 0: //$DATOP byte1_byte2_byte3_byte4
    {
        uint8_t data[12];
        data[0] = '$';
        data[1] = 'D';
        data[2] = 'A';
        data[3] = 'T';
        data[4] = 'O';
        data[5] = 'P';
        data[6] = ' ';
        for(int i = 0; i < 4; i++)
        {
            if((int)parameters % 10 == 0) data[10-i] = '0';
            else data[10-i] = '1';
            parameters = parameters/10;
        }
        data[11] = '\n';
        sp.write(data,12U);
        break;
    }
    case 1: //$TSAMP byte1
    {
        uint8_t data[9];
        data[0] = '$';
        data[1] = 'T';
        data[2] = 'S';
        data[3] = 'A';
        data[4] = 'M';
        data[5] = 'P';
        data[6] = ' ';
        data[7] = parameters + 0x30;
        data[8] = '\n';
        sp.write(data, 9U);
        break;
    }
    case 2: //$BRATE byte1
    {
        uint8_t data[9];
        data[0] = '$';
        data[1] = 'B';
        data[2] = 'R';
        data[3] = 'A';
        data[4] = 'T';
        data[5] = 'E';
        data[6] = ' ';
        data[7] = parameters + 0x30;
        data[8] = '\n';
        sp.write(data, 9U);
        break;
    }
    case 3: //$RESET
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'R';
        data[2] = 'E';
        data[3] = 'S';
        data[4] = 'E';
        data[5] = 'T';
        data[6] = '\n';
        sp.write(data, 7U);
        break;
    }
    case 4: //$GPARA
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'G';
        data[2] = 'P';
        data[3] = 'A';
        data[4] = 'R';
        data[5] = 'A';
        data[6] = '\n';
        sp.write(data, 7U);
        break;
    }
    case 5: //$DELTA byte1_byte2_
    {
        break;
    }
    case 6: //$DELTT byte1_byte2_
    {
        break;
    }
    case 7: //$ALPHA byte1_byte2_
    {
        break;
    }
    case 8: //$ALPHT byte1_byte2_...
    {
        break;
    }
    case 9: //$TPRED byte1_byte2_...
    {
        break;
    }
    case 10: //$GCONF
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'G';
        data[2] = 'C';
        data[3] = 'O';
        data[4] = 'N';
        data[5] = 'F';
        data[6] = '\n';
        sp.write(data, 7U);
        break;
    }
    case 11: //$START
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'S';
        data[2] = 'T';
        data[3] = 'A';
        data[4] = 'R';
        data[5] = 'T';
        data[6] = '\n';
        sp.write(data,7U);
        break;
    }
    case 12: //$CALIB
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'C';
        data[2] = 'A';
        data[3] = 'L';
        data[4] = 'I';
        data[5] = 'B';
        data[6] = '\n';
        sp.write(data,7U);
        break;
    }
    case 13: //$MAG2D
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'M';
        data[2] = 'A';
        data[3] = 'G';
        data[4] = '2';
        data[5] = 'D';
        data[6] = '\n';
        sp.write(data,7U);
        break;
    }
    case 14: //$MAG3D
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'M';
        data[2] = 'A';
        data[3] = 'G';
        data[4] = '3';
        data[5] = 'D';
        data[6] = '\n';
        sp.write(data,7U);
        break;
    }
    case 15: //$MAGST
    {
        uint8_t data[7];
        data[0] = '$';
        data[1] = 'M';
        data[2] = 'A';
        data[3] = 'G';
        data[4] = 'S';
        data[5] = 'T';
        data[6] = '\n';
        sp.write(data,7U);
       break;
    }
    default: //$RESET
    {
       break;
    }
    }
}
void Callback_serial_IMU(const ros::TimerEvent&)
{
    // ROS_INFO("Hello");
    if(sp.isOpen())
    {
        static int flag_yaw = 1, cnt_yaw = 0;	
        try
        {
            data = sp.readline(100, "\r\n");
            if(data.size() < 70) {
                ROS_ERROR("IMU Read: data.size() < 70");
                return;
            }
            std::cout<<"sp.readline():"<< data << std::endl;		
        }
        catch(boost::exception const& err)
        {
            std::cout<<"Cannot navigate..." << std::endl;
        }
    }
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "IMU_calib_node");
	ros::NodeHandle n;
	ROS_INFO("[Main] Start Init IMU Calib Node!!!");
    // Set up multi-threaded spinner with 2 threads
    ros::MultiThreadedSpinner spinner(2);
    std::string port("/dev/ttyUSB1"); //achieve name of port	
    serial::Timeout to = serial::Timeout::simpleTimeout(20);
    // Set the name of the serial port to be opened
	sp.setPort(port);
    // Set the baud rate of serial communication
	sp.setBaudrate(115200*2);
    // Serial port set timeout
	sp.setTimeout(to);
    sp.open();
    if(sp.isOpen())
    	std::cout << " Yes." << std::endl;
  	else
   	 	std::cout << " No." << std::endl;
	ros::Duration(1).sleep(); // waiting for serial is ready
    ros::Subscriber sub_GUI = n.subscribe("GUI_calib_IMU", 1000, Callback_GUI_config);

    ros::Timer timer2 = n.createTimer(ros::Duration((double)0.01), Callback_serial_IMU); // Read UART from MCU every 15ms
    spinner.spin();
    while(ros::ok())
    {

    }
    std::cout<<"............Ending............"<<std::endl;  
    return 0;
}