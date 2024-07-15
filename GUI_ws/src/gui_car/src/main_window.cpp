#include "main_window.h"
#include "ui_main_window.h"
#include <iostream>
#include <string>

Main_Window::Main_Window(int argc, char **argv, QWidget *parent) : QMainWindow(parent), ui(new Ui::Main_Window), qnode(argc, argv)
{
    ui->setupUi(this);
    // Graph for Steering
      ui->Graph_customPlot->addGraph();
      ui->Graph_customPlot->graph(0)->setPen(QPen(Qt::blue));
      ui->Graph_customPlot->graph(0)->setName("Real Value");
      ui->Graph_customPlot->addGraph();
      ui->Graph_customPlot->graph(1)->setPen(QPen(Qt::red));
      ui->Graph_customPlot->graph(1)->setName("Set Value");
      ui->Graph_customPlot->legend->setVisible(true);
      ui->Graph_customPlot->xAxis->setLabel("Time (second)");
      ui->Graph_customPlot->yAxis->setLabel("Steering (degree)");
      ui->Graph_customPlot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);
      isTimerStarted = false;

      // Graph for Rear Speed
      ui->Graph_Speed_customPlot->addGraph();
      ui->Graph_Speed_customPlot->graph(0)->setPen(QPen(Qt::black));
      ui->Graph_Speed_customPlot->graph(0)->setName("Set Speed");
      ui->Graph_Speed_customPlot->addGraph();
      ui->Graph_Speed_customPlot->graph(1)->setPen(QPen(Qt::red));
      ui->Graph_Speed_customPlot->graph(1)->setName("Left Speed");
      ui->Graph_Speed_customPlot->addGraph();
      ui->Graph_Speed_customPlot->graph(2)->setPen(QPen(Qt::blue));
      ui->Graph_Speed_customPlot->graph(2)->setName("Right Speed");
      ui->Graph_Speed_customPlot->legend->setVisible(true);
      ui->Graph_Speed_customPlot->xAxis->setLabel("Time (second)");
      ui->Graph_Speed_customPlot->yAxis->setLabel("Speed (m/s)");
      ui->Graph_Speed_customPlot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

      // Graph for X response
      ui->XGraph_customPlot->addGraph();
      ui->XGraph_customPlot->graph(0)->setPen(QPen(Qt::black));
      ui->XGraph_customPlot->graph(0)->setName("X - Reference");
      ui->XGraph_customPlot->addGraph();
      ui->XGraph_customPlot->graph(1)->setPen(QPen(Qt::red));
      ui->XGraph_customPlot->graph(1)->setName("X - Response");
      ui->XGraph_customPlot->legend->setVisible(true);
      ui->XGraph_customPlot->xAxis->setLabel("Time (second)");
      ui->XGraph_customPlot->yAxis->setLabel("(m)");
      ui->XGraph_customPlot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

      // Graph for Y response
      ui->YGraph_customPlot->addGraph();
      ui->YGraph_customPlot->graph(0)->setPen(QPen(Qt::black));
      ui->YGraph_customPlot->graph(0)->setName("Y - Reference");
      ui->YGraph_customPlot->addGraph();
      ui->YGraph_customPlot->graph(1)->setPen(QPen(Qt::red));
      ui->YGraph_customPlot->graph(1)->setName("Y - Response");
      ui->YGraph_customPlot->legend->setVisible(true);
      ui->YGraph_customPlot->xAxis->setLabel("Time (second)");
      ui->YGraph_customPlot->yAxis->setLabel("(m)");
      ui->YGraph_customPlot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

      // Graph for yaw response
      ui->yawGraph_customPlot->addGraph();
      ui->yawGraph_customPlot->graph(0)->setPen(QPen(Qt::black));
      ui->yawGraph_customPlot->graph(0)->setName("yaw - Reference");
      ui->yawGraph_customPlot->addGraph();
      ui->yawGraph_customPlot->graph(1)->setPen(QPen(Qt::red));
      ui->yawGraph_customPlot->graph(1)->setName("yaw - Response");
      ui->yawGraph_customPlot->legend->setVisible(true);
      ui->yawGraph_customPlot->xAxis->setLabel("Time (second)");
      ui->yawGraph_customPlot->yAxis->setLabel("(rad)");
      ui->yawGraph_customPlot->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom);

    //Set compass
      QQuickView *view1 = new QQuickView();
      QWidget *container1 = QWidget::createWindowContainer(view1, this);
      view1->setSource(QUrl("qrc:/qml/Compass.qml"));
      ui->Compass_Layout->addWidget(container1);
      QQuickItem *compass_window = view1->rootObject();

    // Set map
      QQuickView *view = new QQuickView();
      QWidget *container = QWidget::createWindowContainer(view, this);
      view->setSource(QUrl("qrc:/qml/map.qml"));
      ui->Map_verticalLayout_2->addWidget(container);
      QQuickItem *mapView = view->rootObject();
      // Map view button click
      connect(this, SIGNAL(change_maptype(QVariant)), mapView, SLOT(change_mapView(QVariant)));
      // Clear path button
      connect(ui->clear_pathButton, SIGNAL(clicked()), mapView, SLOT(clearPaths()));
      // Load waypoints from map to table (load to table button)
      connect(ui->Save_to_tableButton, SIGNAL(clicked()), mapView, SLOT(sendWaypointsToTable()));
      connect(mapView, SIGNAL(waypointsSent(QVariant)), this, SLOT(saveWaypointsToTable(QVariant)));
      connect(this, SIGNAL(waypointsLoadFromTableRequested(QVariant)), mapView, SLOT(mountWaypointsFromTable(QVariant)));
      connect(this, SIGNAL(desiredPathGenerated(QVariant)), mapView, SLOT(generateDesiredPath(QVariant)));

    // Set up Manual control
    QTimer *keyboard_timer = new QTimer(this);
    keyboard_timer->start(100);
    ui->Stop_Manual_Button->setEnabled(false);
    ui->Start_Manual_Button->setEnabled(true);
    connect(keyboard_timer, &QTimer::timeout, this, &Main_Window::on_ColorChange_keyboard_Timeout);
    step_speed_manual = 0.25;
    step_angle_manual = 2.5;
    set_angle = 0;
    set_speed = 0;
    ui->text_angle_manual->setText(QString::number(set_angle));
    ui->text_speed_manual->setText(QString::number(set_speed));
    ui->sendButton_MPC->setEnabled(true);
    ui->startButton_MPC->setEnabled(false);
    ui->stopButton_MPC->setEnabled(false);
    ui->sendButton_LQR->setEnabled(true);
    ui->startButton_LQR->setEnabled(false);
    ui->stopButton_LQR->setEnabled(false);

    // Set up Ros node to GUI
    connect(&qnode, &QNode::measuresReceived, this, &Main_Window::processMeasures);
    connect(this, SIGNAL(newPointReceived(QVariant)), mapView,SLOT(updateRealPath(QVariant)));
    connect(this, SIGNAL(newIMUrecieved(QVariant,QVariant,QVariant)), mapView,
        SLOT(updateYaw(QVariant,QVariant,QVariant)));
    connect(this, SIGNAL(newIMUrecieved(QVariant,QVariant,QVariant)), compass_window,
            SLOT(updateYaw(QVariant,QVariant,QVariant)));
    connect(this, SIGNAL(newRefpointRecieved(QVariant)), mapView,
            SLOT(updateRefpoint(QVariant)));
}

Main_Window::~Main_Window()
{
    delete ui;
}
void Main_Window::keyPressEvent(QKeyEvent *event)
{
    if (ui->Start_Manual_Button->isEnabled() == true)
        return;
    if(event->key() == Qt::Key_A)
    {
        ui->Left_Button->setStyleSheet("background-color: red;");
        if (set_angle <= -30) return;
        set_angle = set_angle - step_angle_manual;
        ui->text_angle_manual->setText(QString::number(set_angle));
    }
    if(event->key() == Qt::Key_D)
    {
        ui->Right_Button->setStyleSheet("background-color: red;");
        if (set_angle >= 30) return;
        set_angle = set_angle + step_angle_manual;
        ui->text_angle_manual->setText(QString::number(set_angle));
    }
    if(event->key() == Qt::Key_W)
    {
        ui->Up_Button->setStyleSheet("background-color: red;");
        if (set_speed >= 2.25) return;
        set_speed = set_speed + step_speed_manual;
        ui->text_speed_manual->setText(QString::number(set_speed));
    }
    if(event->key() == Qt::Key_S)
    {
        ui->Down_Button->setStyleSheet("background-color: red;");
        if (set_speed <= -2.25) return;
        set_speed = set_speed - step_speed_manual;
        ui->text_speed_manual->setText(QString::number(set_speed));
    }
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->set_angle = set_angle;
    msg->set_speed = set_speed;
    qnode.publishSettings();
}
void Main_Window::on_ColorChange_keyboard_Timeout()
{
    ui->Left_Button->setStyleSheet("background-color: white;");
    ui->Right_Button->setStyleSheet("background-color: white;");
    ui->Up_Button->setStyleSheet("background-color: white;");
    ui->Down_Button->setStyleSheet("background-color: white;");
}
void Main_Window::on_Start_Manual_Button_clicked()
{
    ui->Stop_Manual_Button->setEnabled(true);
    ui->Start_Manual_Button->setEnabled(false);
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 1;
    msg->start_mode = 1;
    qnode.publishSettings();
}

void Main_Window::on_Stop_Manual_Button_clicked()
{
    ui->Stop_Manual_Button->setEnabled(false);
    ui->Start_Manual_Button->setEnabled(true);
    set_speed = 0;
    set_angle = 0;
    ui->text_speed_manual->setText(QString::number(set_speed));
    ui->text_angle_manual->setText(QString::number(set_angle));
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 1;
    msg->start_mode = 0;
    msg->set_speed = 0;
    msg->set_angle = 0;
    qnode.publishSettings();
}

void Main_Window::on_sendButton_MPC_clicked()
{
    ui->startButton_MPC->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();

    // Config mode
    msg->mode = 2;
    msg->start_mode = 0;
    msg->send_parameters = 1;
    // Read parameters from text in GUI
    msg->set_speed = ui->text_v_MPC->toPlainText().toDouble();
    msg->mpc_Np = ui->text_Np->toPlainText().toInt();
    msg->mpc_Nc = ui->text_Nc->toPlainText().toInt();
    msg->mpc_L_wheel = ui->text_L_MPC->toPlainText().toDouble();
    msg->mpc_Q[0] = ui->text_Qx_MPC->toPlainText().toDouble();
    msg->mpc_Q[1] = ui->text_Qy_MPC->toPlainText().toDouble();
    msg->mpc_Q[2] = ui->text_Qyaw_MPC->toPlainText().toDouble();
    msg->mpc_Qp[0] = ui->text_Qpx_MPC->toPlainText().toDouble();
    msg->mpc_Qp[1] = ui->text_Qpy_MPC->toPlainText().toDouble();
    msg->mpc_Qp[2] = ui->text_Qpyaw_MPC->toPlainText().toDouble();
    msg->mpc_R = ui->text_R_MPC->toPlainText().toDouble();
    msg->mpc_umax = ui->text_steer_max_MPC->toPlainText().toDouble();
    msg->mpc_umin = ui->text_steer_min_MPC->toPlainText().toDouble();
    this->Send_Map();
    qnode.publishSettings();  
}

void Main_Window::on_startButton_MPC_clicked()
{
    ui->startButton_MPC->setEnabled(false);
    ui->sendButton_MPC->setEnabled(false);
    ui->stopButton_MPC->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 2;
    msg->start_mode = 1;
    msg->send_parameters = 0;
    ROS_INFO("**********Start Saving Data MPC to FILE*************:");
    save_log.open("data_log.dat");
    save_log<<"[UGV-MPC]"<<std::endl;
    save_log<<"[time: set_angle, angle_feedback, set_speed, speed, x, x_ref, y, y_ref, yaw, yaw_ref]="<<std::endl;
    qnode.publishSettings();
}

void Main_Window::on_stopButton_MPC_clicked()
{
    ui->stopButton_MPC->setEnabled(false);
    ui->sendButton_MPC->setEnabled(true);
    ui->startButton_MPC->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 2;
    msg->start_mode = 0;
    msg->send_parameters = 0;
    msg->set_speed = 0;
    save_log.close();
    ROS_INFO("**********Stop Saving Data MPC to FILE*************:");
    qnode.publishSettings();
}

void Main_Window::on_sendButton_LQR_clicked()
{
    ui->startButton_LQR->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();

    // Config mode
    msg->mode = 3;
    msg->start_mode = 0;
    msg->send_parameters = 1;
    // Read parameters from text in GUI
    msg->set_speed = ui->text_v_LQR->toPlainText().toDouble();
    msg->lqr_Np = ui->text_Np_LQR->toPlainText().toInt();
    msg->lqr_L_wheel = ui->text_L_LQR->toPlainText().toDouble();
    msg->lqr_Q[0] = ui->text_Qx_LQR->toPlainText().toDouble();
    msg->lqr_Q[1] = ui->text_Qy_LQR->toPlainText().toDouble();
    msg->lqr_Q[2] = ui->text_Qyaw_LQR->toPlainText().toDouble();
    msg->lqr_K[0] = ui->text_Kix_LQR->toPlainText().toDouble();
    msg->lqr_K[1] = ui->text_Kiy_LQR->toPlainText().toDouble();
    msg->lqr_K[2] = ui->text_Kiyaw_LQR->toPlainText().toDouble();
    msg->lqr_R = ui->text_R_LQR->toPlainText().toDouble();
    msg->lqr_umax = ui->text_steer_max_LQR->toPlainText().toDouble();
    msg->lqr_umin = ui->text_steer_min_LQR->toPlainText().toDouble();
    this->Send_Map();
    qnode.publishSettings();  
}

void Main_Window::on_startButton_LQR_clicked()
{
    ui->startButton_LQR->setEnabled(false);
    ui->sendButton_LQR->setEnabled(false);
    ui->stopButton_LQR->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 3;
    msg->start_mode = 1;
    msg->send_parameters = 0;
    ROS_INFO("**********Start Saving Data LQR to FILE*************:");
    save_log.open("data_log.dat");
    save_log<<"[UGV-LQR]"<<std::endl;
    save_log<<"[time: set_angle, angle_feedback, set_speed, speed, x, x_ref, y, y_ref, yaw, yaw_ref]="<<std::endl;
    qnode.publishSettings();
}

void Main_Window::on_stopButton_LQR_clicked()
{
    ui->stopButton_LQR->setEnabled(false);
    ui->sendButton_LQR->setEnabled(true);
    ui->startButton_LQR->setEnabled(true);
    ugv_msgs::toUGV *msg = qnode.getSettings();
    msg->mode = 3;
    msg->start_mode = 0;
    msg->send_parameters = 0;
    msg->set_speed = 0;
    save_log.close();
    ROS_INFO("**********Stop Saving Data MPC to FILE*************:");
    qnode.publishSettings();
}

void Main_Window::on_map_viewButton_clicked()
{
    if (ui->map_viewButton->text() == "Satellite")
    {
      emit change_maptype(QVariant::fromValue(1));
      ui->map_viewButton->setText("Street");
    }
    else if (ui->map_viewButton->text() == "Street")
    {
      emit change_maptype(QVariant::fromValue(0));
      ui->map_viewButton->setText("Satellite");
    }
}

void Main_Window::on_clear_pathButton_clicked()
{
    // angle
    ui->Graph_customPlot->graph(0)->data().data()->clear();
    ui->Graph_customPlot->graph(1)->data().data()->clear();
    ui->Graph_customPlot->replot();
    // speed
    ui->Graph_Speed_customPlot->graph(0)->data().data()->clear();
    ui->Graph_Speed_customPlot->graph(1)->data().data()->clear();
    ui->Graph_Speed_customPlot->graph(2)->data().data()->clear();
    ui->Graph_Speed_customPlot->replot();
    // X
    ui->XGraph_customPlot->graph(0)->data().data()->clear();
    ui->XGraph_customPlot->graph(1)->data().data()->clear();
    ui->XGraph_customPlot->replot();
    // Y
    ui->YGraph_customPlot->graph(0)->data().data()->clear();
    ui->YGraph_customPlot->graph(1)->data().data()->clear();
    ui->YGraph_customPlot->replot();
    // Yaw
    ui->yawGraph_customPlot->graph(0)->data().data()->clear();
    ui->yawGraph_customPlot->graph(1)->data().data()->clear();
    ui->yawGraph_customPlot->replot();
    isTimerStarted = false;
}

void Main_Window::saveWaypointsToTable(const QVariant &waypointList)
{
  QList<QVariant> list = waypointList.toList();
  for (int i = 0; i < 11; i++)
  {
    latitudeCoords[i] = list[i].value<QGeoCoordinate>().latitude();
    longitudeCoords[i] = list[i].value<QGeoCoordinate>().longitude();
    ui->tableWidget->setItem(i, 0, new QTableWidgetItem(QString::number(latitudeCoords[i], 'f', 15)));
    ui->tableWidget->setItem(i, 1, new QTableWidgetItem(QString::number(longitudeCoords[i], 'f', 15)));
  }
}

void Main_Window::on_Save_to_fileButton_clicked()
{
    std::cout<<"**********Save Waypoint to FILE*************:"<<std::endl;
    save_data.open("out_wp.dat");
    save_data<<(int)11<<std::endl; // num_InputPoints, default is 11

    // update lattitude
    for(int i=0; i<11; i++)
    {
      save_data<< ui->tableWidget->item(i, 0)->text().toStdString() <<",";
    }
    save_data<< ui->tableWidget->item(10, 0)->text().toStdString() <<std::endl;

    // update longtitude
    for(int i=0; i<11; i++)
    {
      save_data<< ui->tableWidget->item(i, 1)->text().toStdString() <<",";
    }
    save_data<< ui->tableWidget->item(10, 1)->text().toStdString() <<std::endl;
    save_data.close();
}

void Main_Window::on_load_from_fileButton_clicked()
{
    // Load waypoints from file then update waypoints to map_view
    std::cout<<"**********Load Waypoint from FILE*************:"<<std::endl;
    char temp[1000], num_InputPoints = 0;
    double lat_temp[30], lng_temp[30];
    in_data.open("in_wp.dat");
    in_data>>temp;
    QString temp1 =temp;
    in_data>>temp;
    QString temp2 =temp;
    in_data>>temp;
    QString temp3 =temp;
    in_data.close();
    num_InputPoints = temp1.toInt();
    for(int i=0; i<num_InputPoints; i++)
    {
      lat_temp[i] = temp2.split(',')[i].toDouble();
      lng_temp[i] = temp3.split(',')[i].toDouble();
      // std::cout<<"lat_file, lng_file: "<<lat_temp[i]<<", "<<lng_temp[i]<<std::endl;
    }

    for (int i = 0; i < 11; i++)
    {
      QGeoCoordinate waypoint;
      auto lat = lat_temp[i];
      auto lng = lng_temp[i];
      /********************************/
      latitudeCoords[i] = lat;
      longitudeCoords[i] = lng;
    }
    // update waypoints to Waypoints_tableWidget
    for (int i = 0; i < 11; i++)
    {
      ui->tableWidget->setItem(i, 0, new QTableWidgetItem(QString::number(latitudeCoords[i], 'f', 15)));
      ui->tableWidget->setItem(i, 1, new QTableWidgetItem(QString::number(longitudeCoords[i], 'f', 15)));
    }

    // call function for global update
    on_load_from_tableButton_clicked();
}

void Main_Window::on_load_from_tableButton_clicked()
{
    QList<QVariant> waypointList;
    for (int i = 0; i < 11; i++)
    {
      QGeoCoordinate waypoint;
      auto lat = ui->tableWidget->item(i, 0)->text().toDouble();
      auto lng = ui->tableWidget->item(i, 1)->text().toDouble();
      waypoint.setLatitude(lat);
      waypoint.setLongitude(lng);
      waypointList.append(QVariant::fromValue(waypoint));
      /********************************/
      latitudeCoords[i] = lat;
      longitudeCoords[i] = lng;
    }

    emit waypointsLoadFromTableRequested(QVariant::fromValue(waypointList));
}

void Main_Window::on_Generate_path_Button_clicked()
{
    std::cout << "on_GenerateDesiredPath_pushButton_clicked(): " << std::endl;
    TrajectoryPath trajectoty_path;
    double *inputLatitude = latitudeCoords.c_array();
    double *inputLongitude = longitudeCoords.c_array();
    double baseLatitude = inputLatitude[0];
    double baseLongitude = inputLongitude[0];

    std::cout << "  trajectoty_path.setBase(): START" << std::endl;
    trajectoty_path.setBase(baseLatitude, baseLongitude);
    std::cout << "  trajectoty_path.setBase(): END" << std::endl;
    // Count the number of waypoints that user use
    int numInputPoints = 0;
    for (int i = 1; i < 11; i++)
    {
      numInputPoints = (std::isgreater(inputLatitude[i], 0.00001)) ? numInputPoints + 1 : numInputPoints;
    }
    std::cout << "  numInputPoints: " << numInputPoints << std::endl;
    trajectoty_path.setInputPoints(&inputLatitude[1], &inputLongitude[1], numInputPoints);
    trajectoty_path.setParameters((TrajectoryType)ui->TrajectoryType_comboBox->currentIndex());
    trajectoty_path.generateTrajectoryPath();
    double *outputLatitude = trajectoty_path.getOutputLatitude();
    double *outputLongitude = trajectoty_path.getOutputLongitude();
    QList<QVariant> pointList;
    for (int i = 0; i < trajectoty_path.getOutputNumPoint(); i++)
    {
      QGeoCoordinate point;
      auto lat = outputLatitude[i];
      auto lng = outputLongitude[i];
      point.setLatitude(lat);
      point.setLongitude(lng);
      pointList.append(QVariant::fromValue(point));
    }

    emit desiredPathGenerated(QVariant::fromValue(pointList));
}
void Main_Window::Send_Map()
{
    ugv_msgs::toUGV *msg = qnode.getSettings();
    // Just line type is possible
    msg->TrajectoryType = (uint8_t)ui->TrajectoryType_comboBox->currentIndex();
    msg->lat_base = latitudeCoords[0];
    msg->lng_base = longitudeCoords[0];
    int8_t numInputPoints = 0;
    double *inputLatitude = latitudeCoords.c_array();
    double *inputLongitude = longitudeCoords.c_array();
    for (int i = 1; i < 11; i++)
      numInputPoints = (std::isgreater(inputLatitude[i], 0.0)) ? numInputPoints + 1 : numInputPoints;
    double xout;
    double yout;
    for (int i = 1; i < 11; i++)
    {
      // empty waypoints in msg
      msg->X_point[i-1] = 0;
      msg->Y_point[i-1] = 0;
    }
    msg->numWaypoint = numInputPoints;
    for (int i = 1; i < msg->numWaypoint + 1; i++)
    {
      ConverttoXY(inputLatitude[i], inputLongitude[i], msg->lat_base, msg->lng_base, xout, yout);
      msg->X_point[i-1] = xout;
      msg->Y_point[i-1] = yout;
    }
}


void Main_Window::on_defaultSetting_Button_clicked()
{
    // implement in future
}

void Main_Window::on_defaultButton_MPC_clicked()
{
    ui->text_Np->setText(QString::number(10));
    ui->text_v_MPC->setText(QString::number(0.75));
    ui->text_Nc->setText(QString::number(10));
    ui->text_L_MPC->setText(QString::number(0.38));
    ui->text_Qx_MPC->setText(QString::number(1));
    ui->text_Qy_MPC->setText(QString::number(1));
    ui->text_Qyaw_MPC->setText(QString::number(0.3));
    ui->text_Qpx_MPC->setText(QString::number(2));
    ui->text_Qpy_MPC->setText(QString::number(2));
    ui->text_Qpyaw_MPC->setText(QString::number(0.6));
    ui->text_R_MPC->setText(QString::number(1));
    ui->text_steer_max_MPC->setText(QString::number(25));
    ui->text_steer_min_MPC->setText(QString::number(-25));
}

void Main_Window::on_defaultButton_LQR_clicked()
{
    ui->text_Np_LQR->setText(QString::number(10));
    ui->text_v_LQR->setText(QString::number(0.75));
    ui->text_L_LQR->setText(QString::number(0.38));
    ui->text_Kix_LQR->setText(QString::number(0.04));
    ui->text_Kiy_LQR->setText(QString::number(0.04));
    ui->text_Kiyaw_LQR->setText(QString::number(0.004));
    ui->text_Qx_LQR->setText(QString::number(100));
    ui->text_Qy_LQR->setText(QString::number(100));
    ui->text_Qyaw_LQR->setText(QString::number(10));
    ui->text_R_LQR->setText(QString::number(1));
    ui->text_steer_max_LQR->setText(QString::number(25));
    ui->text_steer_min_LQR->setText(QString::number(-25));
}

void Main_Window::ConverttoXY(double lat, double lon, double ref_lat,
                             double ref_lon, double &x, double &y)
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

void Main_Window::ConverttoLatLong(double x, double y, double ref_lat,
                                  double ref_lon, double &lat, double &lon)
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

// Ros callback from Car to GUI
void Main_Window::processMeasures()
{
  QGeoCoordinate point;
  point.setLatitude(qnode.getMeasures()->lat_postion);
  point.setLongitude(qnode.getMeasures()->lng_postion);
  emit newPointReceived(QVariant::fromValue(point));

  lat_position = qnode.getMeasures()->lat_postion;
  lng_position = qnode.getMeasures()->lng_postion;
  heading = qnode.getMeasures()->yaw;
  int rotation_yaw = (int)(qnode.getMeasures()->yaw);
  emit newIMUrecieved(QVariant::fromValue(rotation_yaw), QVariant::fromValue(sin(rotation_yaw*M_PI/180)), QVariant::fromValue(cos(rotation_yaw*M_PI/180)));

  QList<QVariant> pointList;
  double lat_out, lng_out;
  // std::cout<<"qnode.getMeasures()->num_mpc_refpath: " << qnode.getMeasures()->num_mpc_refpath <<std::endl;
  for (int i = 0; i < qnode.getMeasures()->num_mpc_refpath; i++)
  {
    QGeoCoordinate point;
    ConverttoLatLong((double)qnode.getMeasures()->x_mpc_repath[i], (double)qnode.getMeasures()->y_mpc_repath[i], 
                      latitudeCoords[0], longitudeCoords[0], lat_out, lng_out);
    point.setLatitude(lat_out);
    point.setLongitude(lng_out);   
    pointList.append(QVariant::fromValue(point));
    // std::cout<<"  qnode.getMeasures()->mpc_repath[i]: " << qnode.getMeasures()->x_mpc_repath[i] << ", " << qnode.getMeasures()->y_mpc_repath[i] <<std::endl;
  }
  emit newRefpointRecieved(QVariant::fromValue(pointList));
  
  QString speed_str = QString::number((qnode.getMeasures()->speed_left+qnode.getMeasures()->speed_right)/2, 'f', 3);
  ui->Speed_label_value->setText(speed_str);
  QString steering_str = QString::number(qnode.getMeasures()->steering, 'f', 3);
  ui->Steering_label_value->setText(steering_str);

  if (!isTimerStarted)
  {
    isTimerStarted = true;
    timer.restart();
  }
    //plot steering
  double now = double(timer.elapsed()) / 1000;
  ui->Graph_customPlot->graph(0)->addData(now, qnode.getMeasures()->steering);
  ui->Graph_customPlot->graph(1)->addData(now, qnode.getMeasures()->set_steering);
  ui->Graph_customPlot->xAxis->rescale();
  ui->Graph_customPlot->yAxis->rescale();
  ui->Graph_customPlot->replot();
  //  cout<<"now="<<now<<endl;
  //plot speed
  ui->Graph_Speed_customPlot->graph(0)->addData(now, qnode.getMeasures()->set_speed);
  ui->Graph_Speed_customPlot->graph(1)->addData(now, qnode.getMeasures()->speed_left);
  ui->Graph_Speed_customPlot->graph(2)->addData(now, qnode.getMeasures()->speed_right);
  ui->Graph_Speed_customPlot->xAxis->rescale();
  ui->Graph_Speed_customPlot->yAxis->rescale();
  ui->Graph_Speed_customPlot->replot();
  //plot X response
  ui->XGraph_customPlot->graph(0)->addData(now, qnode.getMeasures()->x_mpc_repath[0]);
  ui->XGraph_customPlot->graph(1)->addData(now, qnode.getMeasures()->x);
  ui->XGraph_customPlot->xAxis->rescale();
  ui->XGraph_customPlot->yAxis->rescale();
  ui->XGraph_customPlot->replot();
  //plot Y response
  ui->YGraph_customPlot->graph(0)->addData(now, qnode.getMeasures()->y_mpc_repath[0]);
  ui->YGraph_customPlot->graph(1)->addData(now, qnode.getMeasures()->y);
  ui->YGraph_customPlot->xAxis->rescale();
  ui->YGraph_customPlot->yAxis->rescale();
  ui->YGraph_customPlot->replot();
  //plot yaw response
  ui->yawGraph_customPlot->graph(0)->addData(now, qnode.getMeasures()->yaw_mpc_repath[0]);
  ui->yawGraph_customPlot->graph(1)->addData(now, qnode.getMeasures()->yaw*PI/180);
  ui->yawGraph_customPlot->xAxis->rescale();
  ui->yawGraph_customPlot->yAxis->rescale();
  ui->yawGraph_customPlot->replot();
  if(save_log.is_open())
  {
    save_log<<now<<":"<<qnode.getMeasures()->set_steering<<";"<<qnode.getMeasures()->steering<<";";
    save_log<<qnode.getMeasures()->set_speed<<";"<<qnode.getMeasures()->speed_left<<";";
    save_log<<qnode.getMeasures()->x<<";"<<qnode.getMeasures()->x_mpc_repath[0]<<";";
    save_log<<qnode.getMeasures()->y<<";"<<qnode.getMeasures()->y_mpc_repath[0]<<";";
    save_log<<qnode.getMeasures()->yaw*PI/180<<";"<<qnode.getMeasures()->yaw_mpc_repath[0]<<std::endl;    
  }
}