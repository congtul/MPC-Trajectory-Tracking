import QtQuick 2.4

Rectangle {
    id: compass_window
    width: 180; height: 180
    color: "#231cb1"
    radius: 90
    rotation: 0
    //    property alias helloText: yaw_txt

    function updateYaw(rotation_yaw,sin_yaw,cos_yaw) {
    yaw_txt.text = Number(rotation_yaw).toLocaleString(Qt.locale("de_DE"),'f',0)
    vehicle_img.rotation = rotation_yaw

    }


    Image {
        id: compass_img
        transformOrigin: Item.Center
        source: 'qrc:/images/markers/compassInstrumentDial.svg'
        sourceSize.width: 180
        sourceSize.height: 180
//        clip: true
    }

    Image {
        id: vehicle_img
        x: 40
        y: 40
        transformOrigin: Item.Center
        source: 'qrc:/images/markers/target.svg'
        sourceSize.width: 100
        sourceSize.height: 100
        //        clip: true
//        NumberAnimation on rotation { from: 0; to: 360; duration: 2000; loops: Animation.Infinite; }

    }

    Text {
        id: yaw_txt
        x: 90
        y: 89
        width: 0
        height: 0
        color: "#1a0e0e"
        text: qsTr("OFF")
        style: Text.Normal
        elide: Text.ElideNone
        horizontalAlignment: Text.AlignHCenter
        //        anchors.horizontalCenter: page.horizontalCenter
//        anchors.verticalCenter:  page.verticalCenter
        verticalAlignment : Text.AlignVCenter
        font.pointSize: 14; font.bold: false
    }

}

