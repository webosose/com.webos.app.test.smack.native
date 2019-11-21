// Copyright (c) 2019 LG Electronics, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

import QtQuick 2.12
import QtQuick.Window 2.12

Window
{
    visible: true
    width: 1920
    height: 1080

    color: (realSmackLabel === smackLabel) ? "green" : "red"

    Text
    {
        id: text1
        text: qsTr("Hello, I am Native application!")
        font.pointSize: 25
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text
    {
        id: text2
        text: qsTr("My SMACK label shoud be " + smackLabel)
        anchors.top: text1.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20
    }
    Text
    {
        id: text3
        text: (realSmackLabel === "") ? qsTr("SMACK is off") : qsTr("My current SMACK label is " + realSmackLabel)
        anchors.top: text2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20
    }
    Text
    {
        id: text4
        text: (realSmackLabel === smackLabel) ? qsTr("CORRECT") : qsTr("WRONG")

        anchors.top: text3.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
    }
}