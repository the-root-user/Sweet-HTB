import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

TextField {
    placeholderTextColor: "#919cb4" // config.color
    palette.text: "#a7b4d0" // config.color
    font.pointSize: config.fontSize
    font.family: config.font
    background: Rectangle {
        color: "#1c2636"
        // color: "#1a2332"
        // color: "#0F111A"
        radius: parent.width / 2
        height: width / 9
        width: parent.width
        opacity: 0.5
        anchors.centerIn: parent
    }
}
