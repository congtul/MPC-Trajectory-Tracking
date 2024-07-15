#include "q_node.h"

QNode::QNode(int argc, char** argv) : init_argc(argc), init_argv(argv) { init(); }

QNode::~QNode()
{
  if (ros::isStarted())
  {
    ros::shutdown();
    ros::waitForShutdown();
  }
  wait();
}

void QNode::init()
{
  ros::init(init_argc, init_argv, "qnode");
  ros::start();

  ros::NodeHandle nh;
  pubSettings = nh.advertise<ugv_msgs::toUGV>("settings", 1);
  subMeasures = nh.subscribe("measures", 1, &QNode::onMeasuresReceived, this);

  start();
}

void QNode::run()
{
  ros::Rate loop_rate(10);
  while (ros::ok())
  {
    ros::spinOnce();
    loop_rate.sleep();
  }
}

void QNode::publishSettings()
{
  pubSettings.publish(settings);
}

void QNode::onMeasuresReceived(const ugv_msgs::toGUI::ConstPtr measures)
{
  this->measures = *measures;
  emit measuresReceived();
}
