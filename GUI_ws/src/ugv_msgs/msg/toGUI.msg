#GPS Data 
float64 lat_postion
float64 lng_postion
float32 x
float32 y
float32 set_speed
float32 speed_left
float32 speed_right

#IMU Data 
#float32 roll
#float32 pitch
float32 yaw

#Controll Data
float32 set_steering
float32 steering
int8 num_mpc_refpath
float32[20] x_mpc_repath
float32[20] y_mpc_repath
float32[20] yaw_mpc_repath