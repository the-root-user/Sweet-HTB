import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

TextField {
    placeholderTextColor: "#818ba1" // config.color
    palette.text: config.color
    font.pointSize: config.fontSize
    font.family: config.font
    background: Rectangle {
        // color: "#1a1e2d"
        // color: "#212c3f"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#212c3f" }
            GradientStop { position: 1.0; color: "#1a2432" } }
        radius: 10
        height: width / 9
        width: parent.width
        opacity: 0.5
        // opacity: enabled ? 0.5 : 0.3
        anchors.centerIn: parent
    }
}
