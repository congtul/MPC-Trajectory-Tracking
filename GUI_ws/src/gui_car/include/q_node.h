#ifndef Q_NODE_H
#define Q_NODE_H

#include "ugv_msgs/toUGV.h"
#include <ugv_msgs/toGUI.h>
#include <ros/ros.h>
#include <std_msgs/Int16.h>

#include <QThread>

#include <cstring>
#include <iostream>

class QNode : public QThread
{
  Q_OBJECT

public:
  QNode(int argc, char** argv);
  virtual ~QNode();

  void init();
  void run();

  inline ugv_msgs::toUGV* getSettings() { return &settings; }
  inline ugv_msgs::toGUI* getMeasures() { return &measures; }

  void publishSettings();

private:
  int init_argc;
  char** init_argv;

  ros::Publisher pubSettings;
  ros::Subscriber subMeasures;

  ugv_msgs::toUGV settings;
  ugv_msgs::toGUI measures;

  void onMeasuresReceived(const ugv_msgs::toGUI::ConstPtr measures);

signals:
  void measuresReceived();
};

#endif // Q_NODE_H
