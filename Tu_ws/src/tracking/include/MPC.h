#ifndef MPC_H
#define MPC_H

#include <ros/ros.h>


#include <cmath>
#include "trajectory_path.h"
#include <cstring>
#include <iostream>
#include <string>
#include <boost/array.hpp>
#include "matrix.h"

class MPC
{
public:
    MPC();
    virtual ~MPC();
    void get_linearized_model(double X,double Y,double yaw,double v,double L);
    void create_trajectory(double X, double Y, double yaw, int8_t Np, double v);
    int find_nearest_point(double X, double Y, int index_cur);
    double QP_solver();
    void create_path();


    double Waypoint_x[40];
    double Waypoint_y[40];
    int8_t numWaypoint;
    double set_speed;
    double set_angle; //rad
    int8_t Np;
    int8_t Nc;
    double L_wheel;
    Matrix Qy;
    Matrix R;
    Matrix M;
    Matrix N;
    double umax;
    double umin;
    Matrix ref_path;
    Matrix Ae;
    Matrix Be;
    Matrix Ce;
    Matrix Rs;
    Matrix Xe;
    Matrix ref_trajectory;
    int8_t path_type;
    int index_cur;

private:
};

#endif // MPC_H
