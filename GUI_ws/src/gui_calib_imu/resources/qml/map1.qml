import QtQuick 2.9
import QtLocation 5.13
import QtPositioning 5.13

Rectangle {
    id: window
    width: 800
    height: 600
    visible: true

    property double intial_latitude: 10.78521
    property double intial_longitude: 106.66372
    property int markerCounter: 0

    signal waypointsSent(var coordinateList)

    function updateRealPath(coordinate) {
        realPath.addCoordinate(coordinate)
        target_marker.coordinate = coordinate
        target_marker.visible = true
    }
    function generateDesiredPath(coordinateList) {
        var num_points = coordinateList.length
        for (var i = 0; i < num_points; i++) {
            desiredPath.addCoordinate(coordinateList[i])
        }
    }
    function clearPaths() {
        markerCounter = 0
        marker0.visible = false
        marker1.visible = false
        marker2.visible = false
        marker3.visible = false
        marker4.visible = false
        marker5.visible = false
        marker6.visible = false
        marker0.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker1.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker2.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker3.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker4.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker5.coordinate = QtPositioning.coordinate(0.0, 0.0)
        marker6.coordinate = QtPositioning.coordinate(0.0, 0.0)

        target_marker.visible = false
        var num_points = realPath.pathLength()
        for (var i = 0; i < num_points; i++) {
            realPath.removeCoordinate(realPath.path[i])
        }

        num_points = desiredPath.pathLength()
        for (i = 0; i < num_points; i++) {
            desiredPath.removeCoordinate(realPath.path[i])
        }

    }
    function sendWaypointsToTable() {
        var array = [marker0.coordinate, marker1.coordinate, marker2.coordinate,
                     marker3.coordinate, marker4.coordinate, marker5.coordinate, marker6.coordinate]
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
    }

    Plugin {
        id: mapPlugin
        name: 'osm'
        PluginParameter {
            name: 'osm.mapping.custom.host'
            value: 'qrc:/maps/bachkhoa.osm'
        }
        PluginParameter {
            name: 'osm.mapping.providersrepository.disabled'
            value: true
        }
    }

    Map {
        id: mapview
        anchors.fill: parent
        activeMapType: map.supportedMapTypes[1]
        center: QtPositioning.coordinate(intial_latitude, intial_longitude)
        zoomLevel: maximumZoomLevel
        rotation: 0
        plugin: mapPlugin

        gesture.enabled: true
        gesture.acceptedGestures: MapGestureArea.PinchGesture | MapGestureArea.PanGesture

        MapPolygon {
            id: poolBorder
            color: "paleturquoise"
            path: [
                { latitude: 10.785125294172735, longitude: 106.66361593852923 },
                { latitude: 10.785179802287233, longitude: 106.66365038814394 },
                { latitude: 10.785176344062812, longitude: 106.66368282611631 },
                { latitude: 10.785061893587997, longitude: 106.66366773864070 },
                { latitude: 10.785025170617715, longitude: 106.66361568706293 },
                { latitude: 10.785059588104174, longitude: 106.66356355168267 }
            ]
        }

        MapPolyline {
            id: desiredPath
            line.width: 3
            line.color: 'blue'
        }
        MapPolyline {
            id: realPath
            line.width: 3
            line.color: 'red'
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
            id: target_marker
            objectName: 'target_marker'
            coordinate: QtPositioning.coordinate(intial_latitude, intial_longitude)
            anchorPoint.x: target_marker_image.width / 2
            anchorPoint.y: target_marker_image.height
            sourceItem: Image{
                id: target_marker_image
                source: 'qrc:/images/markers/marker2.png'
            }
            visible: false
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            pressAndHoldInterval: 400

            onDoubleClicked: {
                var mouseGeoPos = mapview.toCoordinate(Qt.point(mouse.x, mouse.y));
                var preZoomPoint = mapview.fromCoordinate(mouseGeoPos, false);
                if (mouse.button === Qt.LeftButton) {
                    mapview.zoomLevel = Math.floor(mapview.zoomLevel + 1)
                } else if (mouse.button === Qt.RightButton) {
                    mapview.zoomLevel = Math.floor(mapview.zoomLevel - 1)
                }
                var postZoomPoint = mapview.fromCoordinate(mouseGeoPos, false);
                var dx = postZoomPoint.x - preZoomPoint.x;
                var dy = postZoomPoint.y - preZoomPoint.y;

                var mapCenterPoint = Qt.point(mapview.width / 2.0 + dx, mapview.height / 2.0 + dy);
                mapview.center = mapview.toCoordinate(mapCenterPoint);
            }
            onPressAndHold:{
                var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
                if (markerCounter == 0) {
                    marker0.coordinate = coordinate
                    marker0.visible = true
                    markerCounter++
                } else if (markerCounter == 1) {
                    marker1.coordinate = coordinate
                    marker1.visible = true
                    markerCounter++
                } else if (markerCounter == 2) {
                    marker2.coordinate = coordinate
                    marker2.visible = true
                    markerCounter++
                } else if (markerCounter == 3) {
                    marker3.coordinate = coordinate
                    marker3.visible = true
                    markerCounter++
                } else if (markerCounter == 4) {
                    marker4.coordinate = coordinate
                    marker4.visible = true
                    markerCounter++
                } else if (markerCounter == 5) {
                    marker5.coordinate = coordinate
                    marker5.visible = true

                    markerCounter++
                } else if (markerCounter == 6) {
                    marker6.coordinate = coordinate
                    marker6.visible = true
                    markerCounter = -1
                } else {}
            }
        }
    }
}
