//import QtQuick 2.15
//import QtQuick.Controls 2.3
//import QtQuick.Window 2.10
//import QtQuick.Layouts 1.14
//import QtQuick 2.0
//import QtQuick.Controls 2.5
////Window {
////    width: 600
////    height: 600
////    visible: true

////    ListModel {
////        id: buttonModel
////    }

////    Column {
////        id: column
////        anchors.centerIn: parent
////        spacing: 10


////        Repeater {
////            model: buttonModel
////            Button {
////                text: model.name
////            }
////        }
////    }

////    RowLayout {
////        anchors.bottom: parent.bottom
////        spacing: 10

////        TextField {
////            id: buttonNameField
////        }

////        Button {
////            text: "Add button"
////            onClicked: {
////                for(var i=0;i<buttonNameField.text;i++){
////                    buttonModel.append({ "name": "Team "+(i+1) });
////                }
////            }
////        }
////    }
////}


//ApplicationWindow {
//    visible: true
//    width: 300
//    height: 200

//    property int groupCount: 0
//    property int checkBoxListCount: 4
//    property var checkBoxStatus: []

//    Column {
//        spacing: 10
//        Button {
//            text: "Create Group"
//            onClicked: {
//                groupCount += 1
//                groupRectangle.visible = true
//            }
//        }
//        Rectangle {
//            id: groupRectangle
//            visible: false
//            width: 300
//            height: 200
//            color: "white"

//            Column {
//                spacing: 10
//                Row {
//                    Label {
//                        text: "Number of groups:"
//                    }
//                    TextField {
//                        id: groupCountTextField
//                        onTextChanged: {
//                            groupCount = groupCountTextField.text.toInt()
//                        }
//                    }
//                }
//                Row {
//                    Button {
//                        text: "Create"
//                        onClicked: {
//                            for (var i = 0; i < groupCount; i++) {
//                                checkBoxStatus.push(new Array(checkBoxListCount).fill(false))
//                            }
//                             buttonContainer.visible = true
//                        }
//                    }
//                }
//                Row{
//                    Repeater {
//                        id: buttonContainer
//                        visible: false
//                        model: groupCount
//                        delegate: Column {
//                            spacing: 20
//                            Row {
//                                Button {
//                                    text: "Button " + (index + 1)
//                                    Text {
//                                        id: buttonImage
//                                        text: "*"
//                                        MouseArea{
//                                            anchors.fill: parent
//                                            onClicked: {
//                                                checkboxList.visible = true
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                            Row{
//                                spacing:20
//                                ListView {
//                                    id: checkboxList
//                                    visible: false
//                                    model: checkBoxListCount
//                                    orientation:        ListView.Horizontal
//                                    delegate: CheckBox {
//                                        text: "Checkbox " + (index + 1)
//                                        enabled: !checkBoxStatus[index][modelData]
//                                        onCheckedChanged: {
//                                            if (checked) {
//                                                checkBoxStatus[index][modelData] = true
//                                            }
//                                        }
//                                    }
//                                }

//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}


import QtQml 2.11
import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtCharts 2.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int scaleX: 1;
     property int scaleY: 1;

    Rectangle {
        anchors.fill: parent
        color: "green"

        Flickable {
            id: flickArea
            anchors {fill: parent; margins: 10; }
            contentWidth: rect.width*rect.scale
            contentHeight: rect.height*rect.scale
            transform: Scale { origin.x: 0; origin.y: 240; xScale: scaleX ; yScale: scaleY}
            Rectangle {
                id: rect
                transformOrigin: Item.TopLeft
                x: 0; y: 0;
                width: 200; height: 300;
                color: "lightgrey"

                Rectangle {
                    id: inner
                    anchors { fill: parent; margins: 10; }
                    color: "red"
                    Text{
                        text:"hello joshika"
                    }
                }
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onWheel: {
            if (wheel.angleDelta.y > 0) {
                scaleX+=1
                scaleY+=1
                console.log("Mouse wheel scrolled clockwise")
            } else {
                scaleX-=1
                scaleY-=1
                console.log("Mouse wheel scrolled counterclockwise")
            }
        }
    }

//    Button {
//        anchors.bottom: parent.bottom;
//        anchors.horizontalCenter: parent.horizontalCenter;
//        text: "Scale flickArea"
//        onClicked: {
////            flickArea.scale += 0.2;
//            scaleX += 1;
//            scaleY +=1;
//            console.log(flickArea.contentWidth);
//            console.log(flickArea.scale)
//        }
//    }
}
