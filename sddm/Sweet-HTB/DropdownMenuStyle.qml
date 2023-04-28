import QtQuick 2.2

import org.kde.plasma.core 2.0 as PlasmaCore

import QtQuick.Controls.Styles 1.4 as QQCS
import QtQuick.Controls 1.3 as QQC

QQCS.MenuStyle {
    frame: Rectangle {
        color: "#0F151D"
        border.color: "#040608"
        border.width: 1
        radius: 1
        opacity: 1
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
            GradientStop { position: 1.0; color: config.selected_color_1 } }
        radius: 8
        border.color: "#040608"
        border.width: 2
    }
}
