#0: update PID, 1: manual, 2: MPC, 3: LQR
uint8 mode
uint8 start_mode
uint8 send_parameters

#Parameters for PID
float64 Kp_steering
float64 Ki_steering 
float64 Kd_steering
float64 Kp_speed
float64 Ki_speed 
float64 Kd_speed

# Parameters for manual
float64 set_speed
float64 set_angle

# Parameters for MPC
float64 mpc_L_wheel
int8 mpc_Np
int8 mpc_Nc
float64[3] mpc_Q
float64[3] mpc_Qp
float64 mpc_R
float64 mpc_umax
float64 mpc_umin
int8 refpoint_offset

#Parameters for LQR
float64 lqr_L_wheel
int8 lqr_Np
float64[3] lqr_Q
float64[3] lqr_K
float64 lqr_R
float64 lqr_umax
float64 lqr_umin

int8 TrajectoryType #Line = 0

int8 numWaypoint   # number of waypoint except for base waypoint
float64 lat_base
float64 lng_base
float64[40] X_point
float64[40] Y_point
