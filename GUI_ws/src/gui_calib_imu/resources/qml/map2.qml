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


    }
    function sendWaypointsToTable() {
       s
    }
    function mountWaypointsFromTable(coordinateList) {

    }

    Plugin {
        id: mapPlugin
        name: 'esri'
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
            }
        }
    }
}
