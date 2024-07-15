import QtQuick 2.9
import QtLocation 5.13
import QtPositioning 5.13
// import Esri.ArcGISRuntime 200.0

Rectangle {
    id: window
    width: 1000
    height: 800
    visible: true

    property double initial_latitude: 10.772992663121164
    property double initial_longitude: 106.659779558453920
    property var waypoints: []
    property int markerCounter: 0
    property var obs_point: []
    property int obs_Counter: 0

//    signal waypointSent(var name, var coordinate)
    signal waypointsSent(var coordinateList)

    function updateRealPath(coordinate) {
        realPath.addCoordinate(coordinate)
        target_marker.coordinate = coordinate
        target_marker.visible = true
    }
    function updateYaw(rotation_yaw,sin_yaw,cos_yaw) {
        target_marker.rotation = rotation_yaw
        // target_marker.anchorPoint.x = 50/2/cos(rotation_yaw*3.14/180)
        // target_marker.anchorPoint.y = 50/12/sin(rotation_yaw*3.14/180)
        target_marker.anchorPoint.x = 50/2 + 50*4/12*sin_yaw
        target_marker.anchorPoint.y = 50/2 - 50*4/12*cos_yaw
    }
    function updateRefpoint(coordinateList) {
        // refpoint_marker.coordinate = coordinate
        // refpoint_marker.visible = true
        var num_mpc_refpath_old = mpc_refpath.pathLength()
        for (var i = 0; i < num_mpc_refpath_old; i++) {
            mpc_refpath.removeCoordinate(mpc_refpath.path[i])
        }
        var num_points = coordinateList.length
        for (var i = 0; i < num_points; i++) {
            mpc_refpath.addCoordinate(coordinateList[i])
        }
    }
    function change_mapView(type_map) {
        if(type_map === 0)
            mapView.activeMapType = mapView.supportedMapTypes[0]
        else if(type_map === 1)
            mapView.activeMapType = mapView.supportedMapTypes[1]
    }

//    function updateDesiredPath(coordinate) {
//        var component = Qt.createComponent("Marker.qml")
//        waypoints.push(component.createObject(mapView))

//        var lastIndex = waypoints.length - 1
//        waypoints[lastIndex].coordinate = coordinate

//        mapView.addMapItem(waypoints[lastIndex])
//        desiredPath.addCoordinate(coordinate)
//    }
    function generateDesiredPath(coordinateList){
        // clear old path
        var num_points_old = desiredPath.pathLength()
        for (var i = 0; i < num_points_old; i++) {
            desiredPath.removeCoordinate(desiredPath.path[i])
        }

        var num_points = coordinateList.length
        for (var i = 0; i < num_points; i++) {
            desiredPath.addCoordinate(coordinateList[i])
        }
        // desiredPath.setPath(coordinateList)
    }
    function sendWaypointsToTable(){
        var array = [marker0.coordinate, marker1.coordinate, marker2.coordinate,
                     marker3.coordinate, marker4.coordinate, marker5.coordinate,
                     marker6.coordinate,marker7.coordinate,marker8.coordinate,marker9.coordinate,marker10.coordinate,
                     obstacle1.coordinate,obstacle2.coordinate,obstacle3.coordinate,obstacle4.coordinate,obstacle5.coordinate,
                    obstacle6.coordinate,obstacle7.coordinate,obstacle8.coordinate,obstacle9.coordinate,obstacle10.coordinate]
        waypointsSent(array)
    }
    function mountWaypointsFromTable(coordinateList) {
        markerCounter = 0;
        marker0.coordinate = coordinateList[0]
        marker1.coordinate = coordinateList[1]
        marker2.coordinate = coordinateList[2]
        marker3.coordinate = coordinateList[3]
        marker4.coordinate = coordinateList[4]
        marker5.coordinate = coordinateList[5]
        marker6.coordinate = coordinateList[6]
        marker7.coordinate = coordinateList[7]
        marker8.coordinate = coordinateList[8]
        marker9.coordinate = coordinateList[9]
        marker10.coordinate = coordinateList[10]

        obs_Counter = 0;
        obstacle1.coordinate = coordinateList[11]
        obstacle2.coordinate = coordinateList[12]
        obstacle3.coordinate = coordinateList[13]
        obstacle4.coordinate = coordinateList[14]
        obstacle5.coordinate = coordinateList[15]
        obstacle6.coordinate = coordinateList[16]
        obstacle7.coordinate = coordinateList[17]
        obstacle8.coordinate = coordinateList[18]
        obstacle9.coordinate = coordinateList[19]
        obstacle10.coordinate = coordinateList[10]

        cir_obs1.center.latitude = coordinateList[11].latitude
        cir_obs1.center.longitude = coordinateList[11].longitude
        cir_obs2.center.latitude = coordinateList[12].latitude
        cir_obs2.center.longitude = coordinateList[12].longitude
        cir_obs3.center.latitude = coordinateList[13].latitude
        cir_obs3.center.longitude = coordinateList[13].longitude
        cir_obs4.center.latitude = coordinateList[14].latitude
        cir_obs4.center.longitude = coordinateList[14].longitude
        cir_obs5.center.latitude = coordinateList[15].latitude
        cir_obs5.center.longitude = coordinateList[15].longitude
        cir_obs6.center.latitude = coordinateList[16].latitude
        cir_obs6.center.longitude = coordinateList[16].longitude
        cir_obs7.center.latitude = coordinateList[17].latitude
        cir_obs7.center.longitude = coordinateList[17].longitude
        cir_obs8.center.latitude = coordinateList[18].latitude
        cir_obs8.center.longitude = coordinateList[18].longitude
        cir_obs9.center.latitude = coordinateList[19].latitude
        cir_obs9.center.longitude = coordinateList[19].longitude
        cir_obs10.center.latitude = coordinateList[10].latitude
        cir_obs10.center.longitude = coordinateList[10].longitude


        if (Math.abs(marker0.coordinate.latitude) > Number.EPSILON) {
            marker0.visible = true
            markerCounter++
        }
        if (Math.abs(marker1.coordinate.latitude) > Number.EPSILON) {
            marker1.visible = true
            markerCounter++
        }
        if (Math.abs(marker2.coordinate.latitude) > Number.EPSILON) {
            marker2.visible = true
            markerCounter++
        }
        if (Math.abs(marker3.coordinate.latitude) > Number.EPSILON) {
            marker3.visible = true
            markerCounter++
        }
        if (Math.abs(marker4.coordinate.latitude) > Number.EPSILON) {
            marker4.visible = true
            markerCounter++
        }
        if (Math.abs(marker5.coordinate.latitude) > Number.EPSILON) {
            marker5.visible = true
            markerCounter++
        }
        if (Math.abs(marker6.coordinate.latitude) > Number.EPSILON) {
            marker6.visible = true
            markerCounter++
        }
        if (Math.abs(marker7.coordinate.latitude) > Number.EPSILON) {
            marker7.visible = true
            markerCounter++
        }
        if (Math.abs(marker8.coordinate.latitude) > Number.EPSILON) {
            marker8.visible = true
            markerCounter++
        }
        if (Math.abs(marker9.coordinate.latitude) > Number.EPSILON) {
            marker9.visible = true
            markerCounter++
        }
        if (Math.abs(marker10.coordinate.latitude) > Number.EPSILON) {
            marker10.visible = true
            markerCounter++
        }



        if (Math.abs(obstacle1.coordinate.latitude) > Number.EPSILON) {
            obstacle1.visible = true
            cir_obs1.visible = true
            cir_obs1.center.latitude = coordinateList[11].latitude
            cir_obs1.center.longitude = coordinateList[11].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle2.coordinate.latitude) > Number.EPSILON) {
            obstacle2.visible = true
            cir_obs2.visible = true
            cir_obs2.center.latitude = coordinateList[12].latitude
            cir_obs2.center.longitude = coordinateList[12].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle3.coordinate.latitude) > Number.EPSILON) {
            obstacle3.visible = true
            cir_obs3.visible = true
            cir_obs3.center.latitude = coordinateList[13].latitude
            cir_obs3.center.longitude = coordinateList[13].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle4.coordinate.latitude) > Number.EPSILON) {
            obstacle4.visible = true
            cir_obs4.visible = true
            cir_obs4.center.latitude = coordinateList[14].latitude
            cir_obs4.center.longitude = coordinateList[14].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle5.coordinate.latitude) > Number.EPSILON) {
            obstacle5.visible = true
            cir_obs5.visible = true
            cir_obs5.center.latitude = coordinateList[15].latitude
            cir_obs5.center.longitude = coordinateList[15].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle6.coordinate.latitude) > Number.EPSILON) {
            obstacle6.visible = true
            cir_obs6.visible = true
            cir_obs6.center.latitude = coordinateList[16].latitude
            cir_obs6.center.longitude = coordinateList[16].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle7.coordinate.latitude) > Number.EPSILON) {
            obstacle7.visible = true
            cir_obs7.visible = true
            cir_obs7.center.latitude = coordinateList[17].latitude
            cir_obs7.center.longitude = coordinateList[17].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle8.coordinate.latitude) > Number.EPSILON) {
            obstacle8.visible = true
            cir_obs8.visible = true
            cir_obs8.center.latitude = coordinateList[18].latitude
            cir_obs8.center.longitude = coordinateList[18].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle9.coordinate.latitude) > Number.EPSILON) {
            obstacle9.visible = true
            cir_obs9.visible = true
            cir_obs9.center.latitude = coordinateList[19].latitude
            cir_obs9.center.longitude = coordinateList[19].longitude
            obs_Counter++
        }
        if (Math.abs(obstacle10.coordinate.latitude) > Number.EPSILON) {
            obstacle10.visible = true
            cir_obs10.visible = true
            cir_obs10.center.latitude = coordinateList[20].latitude
            cir_obs10.center.longitude = coordinateList[20].longitude
            obs_Counter++
        }
    }
    function clearPaths() {
//        for (var i = 0; i < waypoints.length; i++) {
//            mapView.removeMapItem(waypoints[i])
//        }
        var num_mpc_refpath = mpc_refpath.pathLength()
        for (i = 0; i < num_mpc_refpath; i++) {
            mpc_refpath.removeCoordinate(desiredPath.path[i])
        }
        refpoint_marker.visible = false
        markerCounter = 0
        marker0.visible = false
        marker1.visible = false
        marker2.visible = false
        marker3.visible = false
        marker4.visible = false
        marker5.visible = false
        marker6.visible = false
        marker7.visible = false
        marker8.visible = false
        marker9.visible = false
        marker10.visible = false
        marker0.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker1.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker2.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker3.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker4.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker5.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker6.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker7.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker8.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker9.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker10.coordinate = QtPositioning.coordinate(0.0, 0.0)

        obs_Counter = 0;
        obstacle1.visible = false
        obstacle1.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs1.visible = false
        cir_obs1.center.latitude = 0.0
        cir_obs1.center.longitude = 0.0

        obstacle2.visible = false
        obstacle2.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs2.visible = false
        cir_obs2.center.latitude = 0.0
        cir_obs2.center.longitude = 0.0

        obstacle3.visible = false
        obstacle3.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs3.visible = false
        cir_obs3.center.latitude = 0.0
        cir_obs3.center.longitude = 0.0

        obstacle4.visible = false
        obstacle4.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs4.visible = false
        cir_obs4.center.latitude = 0.0
        cir_obs4.center.longitude = 0.0

        obstacle5.visible = false
        obstacle5.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs5.visible = false
        cir_obs5.center.latitude = 0.0
        cir_obs5.center.longitude = 0.0

        obstacle6.visible = false
        obstacle6.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs6.visible = false
        cir_obs6.center.latitude = 0.0
        cir_obs6.center.longitude = 0.0

        obstacle7.visible = false
        obstacle7.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs7.visible = false
        cir_obs7.center.latitude = 0.0
        cir_obs7.center.longitude = 0.0

        obstacle8.visible = false
        obstacle8.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs8.visible = false
        cir_obs8.center.latitude = 0.0
        cir_obs8.center.longitude = 0.0

        obstacle9.visible = false
        obstacle9.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs9.visible = false
        cir_obs9.center.latitude = 0.0
        cir_obs9.center.longitude = 0.0

        obstacle10.visible = false
        obstacle10.coordinate = QtPositioning.coordinate(0.0, 0.0)
        cir_obs10.visible = false
        cir_obs10.center.latitude = 0.0
        cir_obs10.center.longitude = 0.0



        target_marker.visible = false
        var num_points = realPath.pathLength()
        for (var i = 0; i < num_points; i++) {
            realPath.removeCoordinate(realPath.path[i])
        }

        num_points = desiredPath.pathLength()
        for (i = 0; i < num_points; i++) {
            desiredPath.removeCoordinate(desiredPath.path[i])
        }
        waypoints = []
//        desiredPath.path = []
//        realPath.path = []
    }

    Plugin {
        id: mapPlugin
        name: 'googlemaps'
        PluginParameter {
            name: 'googlemaps.maps.apikey'
            value: "AIzaSyDjIbY_-VWIdor1v5nsKWlI7vA7_F9EoMc"
        }
        // name: 'esri'
        // PluginParameter {
        //     name: 'esri.token'
        //     value: "AAPK0436e65d33934ed5b6e56df680ad180634gNE2J_orMa-efST050-sVnxmaFwbQ-Q_yE4tNtukyCJxRPoC4b0gar7Mg27RTu"
        // }
        // PluginParameter {
        //     name: 'osm.mapping.providersrepository.disabled'
        //     value: true
        // }
    }       
    Map {
        id: mapView
        anchors.fill: parent
        activeMapType: mapView.supportedMapTypes[1]
        center: QtPositioning.coordinate(initial_latitude, initial_longitude)
        zoomLevel: maximumZoomLevel
        rotation: 0
        plugin: mapPlugin

        gesture.enabled: true
        gesture.acceptedGestures: MapGestureArea.PinchGesture | MapGestureArea.PanGesture

        MapPolyline {
            id: realPath
            line.width: 2
            line.color: 'red'
        }

        MapPolyline {
            id: desiredPath
            line.width: 2
            line.color: 'blue'
        }

        MapPolyline {
            id: mpc_refpath
            line.width: 3
            line.color: 'gold'
        }

        //
        MapQuickItem {
            id: refpoint_marker
            objectName: 'refpoint_marker'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image0.width / 2
            anchorPoint.y: image0.height
            sourceItem: Column {
                Image {
                    id: image_refpoint
                    source: 'qrc:/images/markers/marker2.png'
                }
            }
            visible: false
        }

        // obstacle maker-----------------------------------------
                MapCircle {
                    id: cir_obs1
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle1
                    objectName: 'obstacle1'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs1.width / 2
        //            anchorPoint.y: img_obs1.height
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "1"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs1
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }


                MapCircle {
                    id: cir_obs2
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle2
                    objectName: 'obstacle2'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs1.width / 2
        //            anchorPoint.y: img_obs1.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "2"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs2
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs3
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle3
                    objectName: 'obstacle3'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs3.width / 2
        //            anchorPoint.y: img_obs3.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "3"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs3
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs4
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle4
                    objectName: 'obstacle4'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs4.width / 2
        //            anchorPoint.y: img_obs4.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "4"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs4
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs5
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle5
                    objectName: 'obstacle5'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs5.width / 2
        //            anchorPoint.y: img_obs5.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "5"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs5
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs6
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle6
                    objectName: 'obstacle6'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs6.width / 2
        //            anchorPoint.y: img_obs6.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "6"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs6
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs7
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle7
                    objectName: 'obstacle7'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs7.width / 2
        //            anchorPoint.y: img_obs7.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "7"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs7
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs8
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle8
                    objectName: 'obstacle8'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs8.width / 2
        //            anchorPoint.y: img_obs8.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "8"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs8
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs9
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle9
                    objectName: 'obstacle9'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs9.width / 2
        //            anchorPoint.y: img_obs9.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "9"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs9
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }

                MapCircle {
                    id: cir_obs10
                        center {
                            latitude: initial_latitude
                            longitude: initial_longitude
                        }
        //            coordinate: QtPositioning.coordinate(0.0, 0.0)
                        radius: 0.5
                        color: 'fuchsia'
                        border.width: 2
                        border.color: "black"
                        visible: false
                   }

                MapQuickItem {
                    id: obstacle10
                    objectName: 'obstacle10'
                    coordinate: QtPositioning.coordinate(0.0, 0.0)
        //            anchorPoint.x: img_obs10.width / 2
        //            anchorPoint.y: img_obs10.height*1.9
                    anchorPoint.x: 6
                    anchorPoint.y: 8
                    sourceItem: Column {
                        Text {
                            text: "10"
                            color: "black"
                            font.bold: true
                        }
        //                Image {
        //                    id: img_obs10
        //                    source: 'qrc:/images/markers/marker2.png'
        //                }
                    }
                    visible: false
                }


        //Marker-------------------
        MapQuickItem {
            id: target_marker
            coordinate: QtPositioning.coordinate(initial_latitude, initial_longitude)
            anchorPoint.x: target_marker_image.width/2
            anchorPoint.y: target_marker_image.height/12
//            transformOrigin: Item.Center
//            zoomLevel: 20
//            NumberAnimation on rotation { from: 0; to: 360; duration: 2000; loops: Animation.Infinite; }
            sourceItem: Image{
                id: target_marker_image
                source: 'qrc:/images/markers/target.svg'
                sourceSize.width: 50
                sourceSize.height: 50
                // sourceSize.width: 30
                // sourceSize.height: 28
//                rotation: -30
            }
            visible: true
        }
        MapQuickItem {
            id: marker0
            objectName: 'marker0'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image0.width / 2
            anchorPoint.y: image0.height*1.9
            sourceItem: Column {
                Text {
                    text: "0"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image0
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }
        MapQuickItem {
            id: marker1
            objectName: 'marker1'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image1.width / 2
            anchorPoint.y: image1.height*1.9
            sourceItem: Column {
                Text {
                    text: "1"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image1
                    source: 'qrc:/images/markers/marker.png'
                }
            }

            visible: false
        }
        MapQuickItem {
            id: marker2
            objectName: 'marker2'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image2.width / 2
            anchorPoint.y: image2.height*1.9
            sourceItem: Column {
                Text {
                    text: "2"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image2
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }
        MapQuickItem {
            id: marker3
            objectName: 'marker3'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image3.width / 2
            anchorPoint.y: image3.height*1.9
            sourceItem: Column {
                Text {
                    text: "3"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image3
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }
        MapQuickItem {
            id: marker4
            objectName: 'marker4'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image4.width / 2
            anchorPoint.y: image4.height*1.9
            sourceItem: Column {
                Text {
                    text: "4"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image4
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }
        MapQuickItem {
            id: marker5
            objectName: 'marker5'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image5.width / 2
            anchorPoint.y: image5.height*1.9
            sourceItem: Column {
                Text {
                    text: "5"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image5
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }

        MapQuickItem {
            id: marker6
            objectName: 'marker6'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image6.width / 2
            anchorPoint.y: image6.height*1.9
            sourceItem: Column {
                Text {
                    text: "6"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image6
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }

        MapQuickItem {
            id: marker7
            objectName: 'marker7'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image7.width / 2
            anchorPoint.y: image7.height*1.9
            sourceItem: Column {
                Text {
                    text: "7"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image7
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }

        MapQuickItem {
            id: marker8
            objectName: 'marker8'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image8.width / 2
            anchorPoint.y: image8.height*1.9
            sourceItem: Column {
                Text {
                    text: "8"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image8
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }

        MapQuickItem {
            id: marker9
            objectName: 'marker9'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image9.width / 2
            anchorPoint.y: image9.height*1.9
            sourceItem: Column {
                Text {
                    text: "9"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image9
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }

        MapQuickItem {
            id: marker10
            objectName: 'marker10'
            coordinate: QtPositioning.coordinate(0.0, 0.0)
            anchorPoint.x: image10.width / 2
            anchorPoint.y: image10.height*1.9
            sourceItem: Column {
                Text {
                    text: "10"
                    color: "blue"
                    font.bold: true
                }
                Image {
                    id: image10
                    source: 'qrc:/images/markers/marker.png'
                }
            }
            visible: false
        }




        MouseArea {
            //id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            pressAndHoldInterval: 200

            onDoubleClicked: {
                var mouseGeoPos = mapView.toCoordinate(Qt.point(mouse.x, mouse.y));
                var preZoomPoint = mapView.fromCoordinate(mouseGeoPos, false);
                if (mouse.button === Qt.LeftButton) {
                    mapView.zoomLevel = Math.floor(mapView.zoomLevel + 1)
                } else if (mouse.button === Qt.RightButton) {
                    mapView.zoomLevel = Math.floor(mapView.zoomLevel - 1)
                }
                var postZoomPoint = mapView.fromCoordinate(mouseGeoPos, false);
                var dx = postZoomPoint.x - preZoomPoint.x;
                var dy = postZoomPoint.y - preZoomPoint.y;

                var mapCenterPoint = Qt.point(mapView.width / 2.0 + dx, mapView.height / 2.0 + dy);
                mapView.center = mapView.toCoordinate(mapCenterPoint);
            }

            onPressAndHold:{

//                var lastIndex = waypoints.length - 1
                var coord = mapView.toCoordinate(Qt.point(mouse.x, mouse.y))
                var lat_pos = coord.latitude
                var long_pos = coord.longitude
//                console.log(lat_pos,long_pos)

//                waypoints[lastIndex].coordinate = coord

//                mapView.addMapItem(waypoints[lastIndex])
//                desiredPath.addCoordinate(coord)
//                waypointSent("frame", coord)

//                var coord = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))

                if (mouse.button === Qt.LeftButton){
                    var component = Qt.createComponent("Marker.qml")
                    waypoints.push(component.createObject(mapView))

                    if (markerCounter == 0) {
                        marker0.coordinate = coord
                        marker0.visible = true
                        markerCounter++
                    }else if (markerCounter == 1) {
                        marker1.coordinate = coord
                        marker1.visible = true
                        markerCounter++
                    } else if (markerCounter == 2) {
                        marker2.coordinate = coord
                        marker2.visible = true
                        markerCounter++
                    } else if (markerCounter == 3) {
                        marker3.coordinate = coord
                        marker3.visible = true
                        markerCounter++
                    } else if (markerCounter == 4) {
                        marker4.coordinate = coord
                        marker4.visible = true
                        markerCounter++
                    } else if (markerCounter == 5) {
                        marker5.coordinate = coord
                        marker5.visible = true
                        markerCounter++
                    } else if (markerCounter == 5) {
                        marker5.coordinate = coord
                        marker5.visible = true
                        markerCounter++
                    }else if (markerCounter == 6) {
                        marker6.coordinate = coord
                        marker6.visible = true
                        markerCounter++
                    }else if (markerCounter == 7) {
                        marker7.coordinate = coord
                        marker7.visible = true
                        markerCounter++
                    }else if (markerCounter == 8) {
                        marker8.coordinate = coord
                        marker8.visible = true
                        markerCounter++
                    }else if (markerCounter == 9) {
                        marker9.coordinate = coord
                        marker9.visible = true
                        markerCounter++
                    }else if (markerCounter == 10) {
                        marker10.coordinate = coord
                        marker10.visible = true
                        markerCounter = -1
                    } else {}

                }else if(mouse.button === Qt.RightButton){
                    var component1 = Qt.createComponent("Marker.qml")
                    obs_point.push(component1.createObject(mapView))

                    if (obs_Counter == 0) {
                        cir_obs1.center.latitude = lat_pos
                        cir_obs1.center.longitude = long_pos
                        cir_obs1.visible = true
                        obstacle1.coordinate = coord
                        obstacle1.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 1) {
                        cir_obs2.center.latitude = lat_pos
                        cir_obs2.center.longitude = long_pos
                        cir_obs2.visible = true
                        obstacle2.coordinate = coord
                        obstacle2.visible = true
                        obs_Counter++
                    } else if (obs_Counter == 2) {
                        cir_obs3.center.latitude = lat_pos
                        cir_obs3.center.longitude = long_pos
                        cir_obs3.visible = true
                        obstacle3.coordinate = coord
                        obstacle3.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 3) {
                        cir_obs4.center.latitude = lat_pos
                        cir_obs4.center.longitude = long_pos
                        cir_obs4.visible = true
                        obstacle4.coordinate = coord
                        obstacle4.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 4) {
                        cir_obs5.center.latitude = lat_pos
                        cir_obs5.center.longitude = long_pos
                        cir_obs5.visible = true
                        obstacle5.coordinate = coord
                        obstacle5.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 5) {
                        cir_obs6.center.latitude = lat_pos
                        cir_obs6.center.longitude = long_pos
                        cir_obs6.visible = true
                        obstacle6.coordinate = coord
                        obstacle6.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 6) {
                        cir_obs7.center.latitude = lat_pos
                        cir_obs7.center.longitude = long_pos
                        cir_obs7.visible = true
                        obstacle7.coordinate = coord
                        obstacle7.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 7) {
                        cir_obs8.center.latitude = lat_pos
                        cir_obs8.center.longitude = long_pos
                        cir_obs8.visible = true
                        obstacle8.coordinate = coord
                        obstacle8.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 8) {
                        cir_obs9.center.latitude = lat_pos
                        cir_obs9.center.longitude = long_pos
                        cir_obs9.visible = true
                        obstacle9.coordinate = coord
                        obstacle9.visible = true
                        obs_Counter++
                    }else if (obs_Counter == 9) {
                        cir_obs10.center.latitude = lat_pos
                        cir_obs10.center.longitude = long_pos
                        cir_obs10.visible = true
                        obstacle10.coordinate = coord
                        obstacle10.visible = true
                        obs_Counter = -1
                    }
                }


            }
        }
    }
}
