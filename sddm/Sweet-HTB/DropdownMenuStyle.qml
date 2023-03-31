import QtQuick 2.2

import org.kde.plasma.core 2.0 as PlasmaCore

import QtQuick.Controls.Styles 1.4 as QQCS
import QtQuick.Controls 1.3 as QQC

QQCS.MenuStyle {
    frame: Rectangle {
        color: "#1c2636"
        // radius: 4
        border.color: "#1a2332" // "transparent"
        border.width: 1
        // background: "#ff00af"
    }
    itemDelegate.label: QQC.Label {
        height: contentHeight * 2
        verticalAlignment: Text.AlignVCenter
        color: styleData.selected ? config.highlight_color : "#a1adc8"
        font.pointSize: config.fontSize
        font.family: config.font
        text: styleData.text
    }
    itemDelegate.background: Rectangle {
        visible: styleData.selected
        // color: config.selected_color
        gradient: Gradient {
            GradientStop { position: 0.0; color: config.selected_color }
            GradientStop { position: 1.0; color: config.selected_color_1 }
        }
        radius: 8
        border.color: "#2a394f" // "#1f2a3b"
        border.width: 2
        // border.leftWidth: 3
        // border.rightWidth: 3
        // inset: 2
    }
}
