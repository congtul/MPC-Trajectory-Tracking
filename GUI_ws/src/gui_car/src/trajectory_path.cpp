#include "trajectory_path.h"
#include <ros/ros.h>
TrajectoryPath::TrajectoryPath() {}

TrajectoryPath::~TrajectoryPath() {
  std::cout<<"  ~TrajectoryPath() "<<std::endl;
  delete ref_path_lat; delete ref_path_lng;
}

void TrajectoryPath::ConverttoXY(double lat, double lon, double ref_lat,
                                           double ref_lon, double& x, double& y)
{
  if ((lat == ref_lat) && (lon == ref_lon))
    x = y = 0;

  double lat_rad = lat * M_PI / 180.0;
  double lon_rad = lon * M_PI / 180.0;

  double ref_lon_rad = ref_lon * M_PI / 180.0;
  double ref_lat_rad = ref_lat * M_PI / 180.0;

  double sin_lat = sin(lat_rad);
  double cos_lat = cos(lat_rad);
  double cos_d_lon = cos(lon_rad - ref_lon_rad);

  double ref_sin_lat = sin(ref_lat_rad);
  double ref_cos_lat = cos(ref_lat_rad);

  double c = acos(ref_sin_lat * sin_lat + ref_cos_lat * cos_lat * cos_d_lon);
  double k = (fabs(c) < std::numeric_limits<double>::epsilon()) ? 1.0 : (c / sin(c));

  x = k * (ref_cos_lat * sin_lat - ref_sin_lat * cos_lat * cos_d_lon) * 6371000;
  y = k * cos_lat * sin(lon_rad - ref_lon_rad) * 6371000;

}

void TrajectoryPath::ConverttoLatLong(double x, double y, double ref_lat,
                                           double ref_lon, double& lat, double& lon)
{
  double pi = 3.141592653589793;
  double x_rad = x / 6371000;
  double y_rad = y / 6371000;
  double c = sqrt(x_rad * x_rad + y_rad * y_rad);
  double sin_c = sin(c);
  double cos_c = cos(c);

  double ref_lon_rad = ref_lon * pi / 180.0;
  double ref_lat_rad = ref_lat * pi / 180.0;

  double ref_sin_lat = sin(ref_lat_rad);
  double ref_cos_lat = cos(ref_lat_rad);

  double lat_rad;
  double lon_rad;

  if (fabs(c) > std::numeric_limits<double>::epsilon())
  {
    lat_rad = asin(cos_c * ref_sin_lat + (x_rad * sin_c * ref_cos_lat) / c);
    lon_rad = (ref_lon_rad + atan2(y_rad * sin_c, c * ref_cos_lat * cos_c - x_rad * ref_sin_lat * sin_c));
  }
  else
  {
    lat_rad = ref_lat_rad;
    lon_rad = ref_lon_rad;
  }

  lat = lat_rad * 180.0 / pi;
  lon = lon_rad * 180.0 / pi;
}

double* TrajectoryPath::linspace(double start_val, double end_val, int N) {
     double *x;
     int i = 0;
     double step = (end_val - start_val) / (double)(N-1);
     x = (double*)calloc(N, sizeof(double));

     x[i] = start_val; /*<=== Line 14*/

     for (i = 1; i < N; i++) {
         x[i] = x[i - 1] + step;
     }
     x[N - 1] = end_val;
     return x;
}

void TrajectoryPath::setBase(double baseLatitude, double baseLongitude)
{
  this->baseLat = baseLatitude;
  this->baseLng = baseLongitude;
}

void TrajectoryPath::setInputPoints(double* inputLatitude, double* inputLongitude, int numInputPoints)
{
  //waypoint in
  this->numIn = numInputPoints;
  double xout;
  double yout;
  std::cout<<"  setInputPoints():" << this->numIn <<std::endl;

  for (int i = 0; i < this->numIn; i++)
  {
    ConverttoXY(inputLatitude[i], inputLongitude[i], this->baseLat, this->baseLng, xout, yout);
    this->inPointX[i] = xout;
    this->inPointY[i] = yout;
    std::cout<<"    " << (double)this->inPointX[i] << ":" << (double)this->inPointY[i] <<std::endl;

  }
}

void TrajectoryPath::setInputPointsXY(double* inputX, double* inputY, int numInputPoints)
{
  //waypoint in
  this->numIn = numInputPoints;
  std::cout<<"  setInputPointsXY():" << this->numIn << " waypoints" <<std::endl;

  for (int i = 0; i < this->numIn; i++)
  {
    this->inPointX[i] = inputX[i];
    this->inPointY[i] = inputY[i];
    std::cout<<"    " << (double)this->inPointX[i] << ":" << (double)this->inPointY[i] <<std::endl;

  }
}

void TrajectoryPath::setCircleParameters(double* inputLatitude, double* inputLongitude, int numCirclePoints, int circle_len_by_degree, bool isClockwise)
{
  double xout;
  double yout;
  this->numcirIn = numCirclePoints;
  std::cout<<"  setCircleParameters(): numIn = " << this->numcirIn <<std::endl;

  this->circle_len_by_degree = circle_len_by_degree;
  this->isClockwise =  isClockwise;
  for (int i = 0; i < this->numcirIn; i++)
  {
    ConverttoXY(inputLatitude[i], inputLongitude[i], this->baseLat, this->baseLng, xout, yout);
    this->CircleX[i] = xout;
    this->CircleY[i] = yout;
    std::cout<<"    " << (double)this->CircleX[i] << ":" << (double)this->CircleY[i] <<std::endl;
  }

}

void TrajectoryPath::setCircleParametersXY(double inputX, double inputY, int circle_len_by_degree, bool isClockwise)
{
  std::cout<<"  setCirclePointsXY():" << this->numIn <<std::endl;

  this->circle_len_by_degree = circle_len_by_degree;
  this->isClockwise =  isClockwise;
  this->CircleX[0] = inputX;
  this->CircleY[0] = inputY;
  std::cout<<"    " << (double)this->CircleX[0] << ":" << (double)this->CircleY[0] <<std::endl;
}

void TrajectoryPath::setParameters(TrajectoryType _trajectory_type)
{
  this->trajectory_type = _trajectory_type;
}

void TrajectoryPath::generateTrajectoryPath(void)
{
  std::cout<<"  generateTrajectoryPath() "<<std::endl;
  Matrix ref_path; // size is 3 x numpoint_resolution
  if(this->trajectory_type == TrajectoryType::Line)
  {
    std::cout<<"  TrajectoryType::Line "<<std::endl;

    ref_path = generate_line_reference_path(this->inPointX, this->inPointY, this->numIn, 900);

  }
  else if(this->trajectory_type == TrajectoryType::Circle)
  {
      std::cout<<"  TrajectoryType::Circle "<<std::endl;
    Matrix circle_path = generate_circle_reference_path(this->inPointX[this->numIn-1], this->inPointY[this->numIn-1], 0, 0, 300*3, true);
    ref_path = circle_path;
  }
  else if(this->trajectory_type == TrajectoryType::Custom)
  {
    std::cout<<"  TrajectoryType::Custom "<<std::endl;
    read_path.open("path_data/custom_path.dat");
    std::vector<double> x_points_list, y_points_list, theta_points_list;
    std::string line;
    std::getline(read_path, line); // Read and discard the header line
    // std::cout << line << std::endl;
    while (std::getline(read_path, line)) {
        // std::cout << line << std::endl;
        std::stringstream ss(line);
        std::string token;
        while (std::getline(ss, token, ',')) {
            replaceCommasWithDots(token);
            double value = std::stod(token);
            // ROS_INFO("x: %f",value);
            x_points_list.push_back(value); // Push back to x_points_list
            std::getline(ss, token, ',');
            replaceCommasWithDots(token);
            value = std::stod(token);
            // ROS_INFO("y: %f",value);
            y_points_list.push_back(value); // Push back to x_points_listy_points_list
            std::getline(ss, token);
            replaceCommasWithDots(token);
            value = std::stod(token);
            // ROS_INFO("theta: %f",value);
            theta_points_list.push_back(value); // Push back to theta_points_list
        }
    }
    read_path.close();
    int num_point_list = x_points_list.size();
    // ROS_INFO("size of path: %d", num_point_list);
    double ref_points_input[num_point_list*3];
    for(int i = 0; i < num_point_list; i++)
    {
      ref_points_input[i] = x_points_list[i];
      ref_points_input[num_point_list + i] = y_points_list[i];
      ref_points_input[2*num_point_list + i] = theta_points_list[i];
    }
    // memcpy(&ref_points_input[num_point_list*0], x_points_list, num_point_list*sizeof(double));
    // memcpy(&ref_points_input[num_point_list*1], y_points_list, num_point_list*sizeof(double));
    // memcpy(&ref_points_input[num_point_list*2], theta_points_list, num_point_list*sizeof(double));
    ref_path = Matrix(ref_points_input, 3U, sizeof(ref_points_input)/sizeof(double)/3);
    // ROS_INFO("size of ref_path: %d", ref_path.size_cols());
  }

  // ROS_INFO("Ref_path(269,0): %f", ref_path(0,0));
  numOut = ref_path.size_cols();
  // ROS_INFO("Ref_path(2,numOut): %f", ref_path(2,numOut-1));

  ref_path_lat = new double[numOut];
  ref_path_lng = new double[numOut];
  double tmp_lat, tmp_lng;
  ROS_INFO("size of ref_path: %d", numOut);
  // save_path.open("data_path.dat");
  // save_path<<"[x_ref,y_ref,yaw_ref]"<<std::endl;
  for (int i = 0; i < numOut; i++)
  {
    ConverttoLatLong(ref_path.get_pointer_row(0)[i], ref_path.get_pointer_row(1)[i], baseLat, baseLng, tmp_lat, tmp_lng);
    ref_path_lat[i] = tmp_lat;
    ref_path_lng[i] = tmp_lng;
    // ROS_INFO("%f", ref_path(2,i)*180/3.14);
    // save_path<<ref_path(0,i)<<","<<ref_path(1,i)<<","<<ref_path(2,i)<<std::endl;
  }
  // save_path.close();
}

Matrix TrajectoryPath::generate_line_reference_path(double* x_points, double* y_points, int num_points, int numpoints_at_segment)
{
    double x_points_list[numpoints_at_segment*(num_points-1)];
    double y_points_list[numpoints_at_segment*(num_points-1)];
    double theta_points_list[numpoints_at_segment*(num_points-1)];
    int num_point_list = sizeof(x_points_list)/sizeof(double);

    // Generate x path
    for (int i = 0; i < num_points-1; i++) {
        double* points_list = linspace(x_points[i], x_points[i+1], numpoints_at_segment);
        memcpy((double*)&x_points_list[numpoints_at_segment*i], (double*)points_list, numpoints_at_segment*sizeof(double));
        free(points_list);
    }
    // Generate y path
    for (int i = 0; i < num_points-1; i++) {
        double* points_list = linspace(y_points[i], y_points[i+1], numpoints_at_segment);
        memcpy((double*)&y_points_list[numpoints_at_segment*i], (double*)points_list, numpoints_at_segment*sizeof(double));
        free(points_list);
    }
    // Generate theta
    for (int i = 0; i < num_point_list-1; i++) {
        theta_points_list[i] = atan2(y_points_list[i+1]-y_points_list[i], x_points_list[i+1]-x_points_list[i]);
    }
    theta_points_list[num_point_list-1] = theta_points_list[num_point_list-2];

    // Create Matrix of ref points input
    double ref_points_input[num_point_list*3];
    memcpy(&ref_points_input[num_point_list*0], x_points_list, num_point_list*sizeof(double));
    memcpy(&ref_points_input[num_point_list*1], y_points_list, num_point_list*sizeof(double));
    memcpy(&ref_points_input[num_point_list*2], theta_points_list, num_point_list*sizeof(double));
    Matrix ref_path = Matrix(ref_points_input, 3U, sizeof(ref_points_input)/sizeof(double)/3);
    return ref_path;
}

Matrix TrajectoryPath::generate_circle_reference_path(double start_x_point, double start_y_point, double Ox_point, double Oy_point, int circle_len_by_degree, bool isClockwise)
{
  double x_points_list[circle_len_by_degree];
  double y_points_list[circle_len_by_degree];
  double theta_points_list[circle_len_by_degree];
  int num_point_list = sizeof(x_points_list)/sizeof(double);

  double R = sqrt((start_x_point-Ox_point)*(start_x_point-Ox_point) + (start_y_point-Oy_point)*(start_y_point-Oy_point));
  double omega_0 = atan2(start_y_point-Oy_point, start_x_point-Ox_point);

  if (isClockwise)
  {
    for (int i = 0; i < circle_len_by_degree; i++)
    {
      x_points_list[i] = Ox_point + R*cos(omega_0+(double)i/3*M_PI/180);
      y_points_list[i] = Oy_point + R*sin(omega_0+(double)i/3*M_PI/180);
    }

  }
  else
  {
    for (int i = 0; i < circle_len_by_degree; i++)
    {
      x_points_list[i] = Ox_point + R*cos(omega_0-(double)i/3*M_PI/180);
      y_points_list[i] = Oy_point + R*sin(omega_0-(double)i/3*M_PI/180);
    }
  }


  // Generate theta
  for (int i = 0; i < num_point_list-1; i++) {
      theta_points_list[i] = atan2(y_points_list[i+1]-y_points_list[i], x_points_list[i+1]-x_points_list[i]);
  }
  theta_points_list[num_point_list-1] = theta_points_list[num_point_list-2];

  // Create Matrix of ref points input
  double ref_points_input[num_point_list*3];
  memcpy(&ref_points_input[num_point_list*0], x_points_list, num_point_list*sizeof(double));
  memcpy(&ref_points_input[num_point_list*1], y_points_list, num_point_list*sizeof(double));
  memcpy(&ref_points_input[num_point_list*2], theta_points_list, num_point_list*sizeof(double));
  Matrix ref_path = Matrix(ref_points_input, 3U, sizeof(ref_points_input)/sizeof(double)/3);

  return ref_path;

}

// Function to replace commas with dots in a string
void TrajectoryPath::replaceCommasWithDots(std::string& str) {
    for (char& ch : str) {
        if (ch == '.') {
            ch = ',';
        }
    }
}