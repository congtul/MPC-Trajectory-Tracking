#ifndef TRAJECTORY_PATH_H
#define TRAJECTORY_PATH_H

#include <cmath>
#include <iostream>
#include <limits>
#include <cmath>
#include <algorithm>
#include <QThread>
#include "matrix.h"
#include <cstdlib>
#include <fstream>

#define PI 3.14159265
using namespace std;

enum class TrajectoryType { Line = 0      // Trajectory include only line
                      ,Circle  // Trajectory include only circle
                      ,Custom
                    };
Q_ENUMS(TrajectoryType)

class TrajectoryPath: public QThread
{
  Q_OBJECT
public:
    TrajectoryPath();
    ~TrajectoryPath();

    void setBase(double baseLatitude, double baseLongitude);
    void setInputPoints(double* inputLatitude, double* inputLongitude, int numInputPoints);
    void setInputPointsXY(double* inputX, double* inputY, int numInputPoints);
    void setCircleParameters(double* inputLatitude, double* inputLongitude, int numCirclePoints, int circle_len_by_degree, bool isClockwise);
    void setCircleParametersXY(double inputX, double inputY, int circle_len_by_degree, bool isClockwise);
    void setParameters(TrajectoryType _trajectory_type);
    void generateTrajectoryPath(void);
    inline double* getReferencePoint(double curLatitude, double curLongitude);
    Matrix generate_line_reference_path(double* x_points, double* y_points, int num_points, int numpoints_at_segment);
    Matrix generate_circle_reference_path(double start_x_point, double start_y_point, double Ox_point, double Oy_point, int circle_len_by_degree, bool isClockwise);
    Matrix generate_eight_reference_path(double end_x_point_line, double end_y_point_line, double O1x_point, double O1y_point, double O2x_point, double O2y_point, bool isClockwise);
    inline double* getOutputLatitude() {return ref_path_lat;}
    inline double* getOutputLongitude() {return ref_path_lng;}
    inline int getOutputNumPoint() {return numOut;}

private:

  int numIn;  // number of waypoint(not include base waypoint)
  int numOut; // number point of output ref path
  int numcirIn;
  TrajectoryType trajectory_type;
  double baseLat;
  double baseLng;
  double inPointX[10];
  double inPointY[10];
  double CircleX[10];
  double CircleY[10];
  int circle_len_by_degree;
  bool isClockwise;
  double *ref_path_lat;
  double *ref_path_lng;
  std::ofstream save_path;
  std::ifstream read_path;


  void ConverttoXY(double lat, double lon, double ref_lat,
                                             double ref_lon, double& x, double& y);
  void ConverttoLatLong(double x, double y, double ref_lat,
                        double ref_lon, double& lat, double& lon);
  double* linspace(double start_val, double end_val, int N);
  void replaceCommasWithDots(std::string& str);
};

#endif // TRAJECTORY_PATH_H
