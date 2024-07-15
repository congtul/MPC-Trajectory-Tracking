#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(int argc, char **argv, QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ros::init(argc, argv, "GUI_IMU_calib");
    ros::NodeHandle nh;
    pubSettings = nh.advertise<ugv_msgs::IMU_calib>("GUI_calib_IMU", 1);
    ui->setupUi(this);
    ui->comboBox->addItem("$DATOP XXXX");
    ui->comboBox->addItem("$TSAMP X");
    ui->comboBox->addItem("$BRATE X");
    ui->comboBox->addItem("$RESET");
    ui->comboBox->addItem("$GPARA");
    ui->comboBox->addItem("$DELTA XX");
    ui->comboBox->addItem("$DELTT XX");
    ui->comboBox->addItem("$ALPHA XX");
    ui->comboBox->addItem("$ALPHT XX");
    ui->comboBox->addItem("$TPRED XX");
    ui->comboBox->addItem("$GCONF");
    ui->comboBox->addItem("$START");
    ui->comboBox->addItem("$CALIB");
    ui->comboBox->addItem("$MAG2D");
    ui->comboBox->addItem("$MAG3D");
    ui->comboBox->addItem("$MAGST");  
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    int mode = ui->comboBox->currentIndex();
    double parameters = ui->plainTextEdit->toPlainText().toDouble();
    data.mode = mode;
    data.parameters = parameters;
    ROS_INFO("Detect send");
    pubSettings.publish(data);
    
}
void MainWindow::on_comboBox_currentIndexChanged(int index)
{
    switch(ui->comboBox->currentIndex())
    {
    case 0: //$DATOP byte1_byte2_byte3_byte4
    {
        ui->Note_txt->setText("byte1: 3 goc, byte2: 3 van toc goc, byte3: 3 gia toc, byte4: 3 tu truong. 1: enable, 0: disable");
        break;
    }
    case 1: //$TSAMP byte1
    {
        ui->Note_txt->setText("Chu ky cap nhat, Output_rate = 500/TSAMP (Hz)");
        break;
    }
    case 2: //$BRATE byte1
    {
        ui->Note_txt->setText("set up Baudrate, 1: 115.2K, 2: 230.4K, 3: 460.8K, 4: 921.6K");
        break;
    }
    case 3: //$RESET
    {
        ui->Note_txt->setText("$DATOP 1110, $TSAMP 5 (100Hz), $BRATE 2 (230400). Need to reset IMU after send this command");
        break;
    }
    case 4: //$GPARA
    {
        ui->Note_txt->setText("Return DATOP, TSAMP, BAUDRATE");
        break;
    }
    case 5: //$DELTA byte1_byte2_
    {
        ui->Note_txt->setText("Cấu hình hệ số bộ ước lượng – trọng số gia tốc, default 2");
        break;
    }
    case 6: //$DELTT byte1_byte2_
    {
        ui->Note_txt->setText("Cấu hình hệ số bộ ước lượng – trọng số gia tốc online, khi lấy dữ liệu thì chia cho 10000");
        break;
    }
    case 7: //$ALPHA byte1_byte2_
    {
        ui->Note_txt->setText("Cấu hình hệ số bộ ước lượng – trọng số từ trường, khi lấy dữ liệu thì chia cho 10000. Giá trị mặc định $ALPHA 1 (giá trị tốt nhất)");
        break;
    }
    case 8: //$ALPHT byte1_byte2_...
    {
        ui->Note_txt->setText("Cấu hình hệ số bộ ước lượng – trọng số từ trường online, khi lấy dữ liệu thì chia cho 10000");
        break;
    }
    case 9: //$TPRED byte1_byte2_...
    {
        ui->Note_txt->setText("Cấu hình thời gian ước lượng dự báo, khi lấy dữ liệu thì chia cho 10000, Giá trị mặc định $TPRED 20 (giá trị tốt nhất)");
        break;
    }
    case 10: //$GCONF
    {
        ui->Note_txt->setText("Trả về giá trị: DELTA, ALPHA, TPRED, TEMPE");
        break;
    }
    case 11: //$START
    {
        ui->Note_txt->setText("Sau 2s dữ liệu IMU sẽ được gửi lên theo thông số vừa được cài đặt (trừ lệnh cấu hình Baudrate $BRATE, IMU phải được bật nguồn lại thì Baudrate vừa cài đặt mới có tác dụng)");
        break;
    }
    case 12: //$CALIB
    {
        ui->Note_txt->setText("Trước khi gửi lệnh này, IMU phải được đặt đứng yên tuyệt đối. Thuật toán cân chỉnh gyro bias diễn ra trong 8s, trong thời gian này IMU cũng phải giữ đứng yên tuyệt đối. Sau 8s, dữ liệu IMU sẽ được gửi lên lại mà không cần gửi lệnh $START");
        break;
    }
    case 13: //$MAG2D
    {
        ui->Note_txt->setText("Lệnh cân chỉnh từ trường 2D. Sau khi gửi lệnh này, IMU phải được xoay tròn trên mặt phẳng 2D nhiều vòng (tối thiểu 10 vòng) để thuật toán ước lượng tính toán giá trị của từ trường bias (theo trục x và trục y). Để hoàn tất việc cân chỉnh và lưu giá trị bias này vào EEPROM thì gửi lệnh: $MAGST Sau khi nhận lệnh $MAGST, IMU lưu giá trị bias vào EEPROM và sẽ sử dụng lại giá trị bias này cho các lần khởi động sau.");
        break;
    }
    case 14: //$MAG3D
    {
        ui->Note_txt->setText("Lệnh cân chỉnh từ trường 3D. Sau khi gửi lệnh này, IMU phải được xoay tròn trên mặt cầu 3D nhiều vòng (tối thiểu 10 vòng) để thuật toán ước lượng tính toán giá trị bias của từ trường (theo cả 3 trục x, y, z). Để hoàn tất việc cân chỉnh và lưu giá trị bias này vào EEPROM thì gửi lệnh: $MAGST. Sau khi nhận lệnh $MAGST, IMU lưu giá trị bias vào EEPROM và sẽ sử dụng lại giá trị bias này cho các lần khởi động sau.");
        break;
    }
    case 15: //$MAGST
    {
        ui->Note_txt->setText("Lenh gui sau calib");
        break;
    }
    default: //$RESET
    {
        ui->Note_txt->setText("");
        break;
    }
    }
}
