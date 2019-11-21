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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>

#define SMACK_LABEL     "webOS::App::com.webos.app.test.smack.native"

QString readSmackLabel()
{
    QString label;
    QFile f("/proc/self/attr/current");
    if (f.open(QFile::ReadOnly | QFile::Text)) {
        QTextStream in(&f);
        label = in.readAll();
        f.close();
    }

    return label;
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQuickView view;

    view.rootContext()->setContextProperty("smackLabel", SMACK_LABEL);
    view.rootContext()->setContextProperty("realSmackLabel", readSmackLabel());
    QUrl url = QUrl("main.qml");
    QUrl baseUrl = QUrl("file:/usr/palm/applications/com.webos.app.test.smack.native/");
    view.setSource(baseUrl.resolved(url));
    view.show();

    return app.exec();
}