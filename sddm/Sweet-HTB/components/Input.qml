import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

TextField {
    placeholderTextColor: "#a1adc8" // config.color
    palette.text: "#a1adc8" // config.color
    font.pointSize: config.fontSize
    font.family: config.font
    background: Rectangle {
        color: "#1a2231"
        // color: "#0F111A"
        radius: parent.width / 2
        height: width / 9
        width: parent.width
        opacity: 0.5
        anchors.centerIn: parent
    }
}
