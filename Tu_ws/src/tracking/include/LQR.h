#ifndef LQR_H
#define LQR_H

#include <ros/ros.h>

#include <cmath>
#include "trajectory_path.h"
#include <cstring>
#include <iostream>
#include <boost/array.hpp>
#include "matrix.h"

class LQR
{
public:
    LQR();
    virtual ~LQR();
    void create_path();
    void get_linearized_model(double X, double Y, double yaw, double v, double L);
    int find_nearest_point(double X, double Y, int index_cur);
    Matrix LQR_solver();
    double Pure_pursuit_controller(double X, double Y, double yaw);


    double Waypoint_x[40];
    double Waypoint_y[40];
    int8_t numWaypoint;
    int8_t path_type;
    Matrix ref_path;

    Matrix Ae;
    Matrix e;
    Matrix Be;
    Matrix Ce;
    Matrix Q;
    Matrix R;
    double set_speed;
    double set_angle; //rad
    int8_t Np;
    double L_wheel;
    double umax;
    double umin;
    int point_ahead;
    int index_cur;






private:

};

#endif // LQR_H
