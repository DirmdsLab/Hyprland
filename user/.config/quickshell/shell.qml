import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: window

            required property var modelData

            screen: modelData

            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            exclusionMode: ExclusionMode.Ignore
            color: "transparent"

            property bool launcherOpen: false

            Item {
                id: launcher

                width: 600
                height: content.height + 40

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                // 0 = terbuka
                // 1 = tertutup
                property real offsetScale: launcherOpen ? 0 : 1

                opacity: 1 - offsetScale

                anchors.bottomMargin:
                    (-height - 10) * offsetScale

                visible: offsetScale < 1

                Behavior on offsetScale {
                    NumberAnimation {
                        duration: 250
                        easing.type: Easing.OutCubic
                    }
                }

                Rectangle {
                    anchors.fill: parent

                    radius: 24
                    color: "#202020"

                    border.width: 1
                    border.color: "#404040"
                }

                Column {
                    id: content

                    width: parent.width
                    spacing: 12

                    padding: 20

                    TextField {
                        id: search

                        width: parent.width - 40
                        height: 50

                        placeholderText: "Search..."

                        color: "white"
                        placeholderTextColor: "#888888"

                        background: Rectangle {
                            radius: 14
                            color: "#303030"
                        }

                        Keys.onEscapePressed: {
                            launcher.launcherOpen = false
                        }
                    }

                    Column {
                        width: parent.width - 40
                        spacing: 4

                        Repeater {
                            model: [
                                "App 1",
                                "App 2",
                                "App 3",
                                "App 4"
                            ]

                            delegate: Rectangle {
                                width: parent.width
                                height: 52

                                radius: 12
                                color: mouse.containsMouse
                                       ? "#3a3a3a"
                                       : "#282828"

                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 16

                                    anchors.verticalCenter: parent.verticalCenter

                                    text: modelData

                                    color: "white"
                                    font.pixelSize: 16
                                }

                                MouseArea {
                                    id: mouse

                                    anchors.fill: parent
                                    hoverEnabled: true

                                    onClicked: {
                                        console.log("Clicked:", modelData)
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Klik area kosong untuk membuka launcher
            MouseArea {
                anchors.fill: parent

                z: -1

                onClicked: {
                    launcher.launcherOpen =
                        !launcher.launcherOpen
                }
            }

            // Shortcut sementara
            Shortcut {
                sequence: "Super+Space"

                onActivated: {
                    launcher.launcherOpen =
                        !launcher.launcherOpen

                    if (launcher.launcherOpen)
                        search.forceActiveFocus()
                }
            }
        }
    }
}