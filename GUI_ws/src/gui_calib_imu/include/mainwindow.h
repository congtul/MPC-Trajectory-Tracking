#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <ros/ros.h>
#include <ugv_msgs/IMU_calib.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(int argc, char** argv,QWidget *parent = nullptr);
    ~MainWindow();
    ugv_msgs::IMU_calib data;
    ros::Publisher pubSettings;

private slots:
    void on_pushButton_clicked();

    void on_comboBox_currentIndexChanged(int index);


private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
