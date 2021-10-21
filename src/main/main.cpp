/* Copyright (C) Friedemann Metzger - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Friedemann Metzger <friedemann.metzger@gmx.de>, 2017
*/

#include <QCoreApplication>
#include <QCommandLineParser>
#include <QCommandLineOption>
#include <QStandardPaths>
#include <QDebug>
#include "PluginManager.h"
#include <QDir>
#include <initializer_list>
#include <signal.h>
#include <unistd.h>
#define DEATH_HANDLER
#ifdef DEATH_HANDLER
#include "death_handler.h"

void catchUnixSignals(std::initializer_list<int> quitSignals) {
    auto handler = [](int sig) -> void {
        // blocking and not aysnc-signal-safe func are valid
        printf("\nquit the application by signal(%d).\n", sig);
        QCoreApplication::quit();
    };

    sigset_t blocking_mask;
    sigemptyset(&blocking_mask);
    for (auto sig : quitSignals)
        sigaddset(&blocking_mask, sig);

    struct sigaction sa;
    sa.sa_handler = handler;
    sa.sa_mask    = blocking_mask;
    sa.sa_flags   = 0;

    for (auto sig : quitSignals)
        sigaction(sig, &sa, nullptr);
}
#endif


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
#ifdef DEATH_HANDLER
    catchUnixSignals({SIGQUIT, SIGINT, SIGTERM, SIGHUP});
    Debug::DeathHandler dh;
#endif
    QString path = a.applicationDirPath()+"/plugins";
    a.addLibraryPath(path);
    QCommandLineParser parser;
    parser.addHelpOption();
    QCommandLineOption portOption(QStringList()<<"p"<<"port", "Sets the port where the server will listen for websocket connections.", "port", "4711");
    QCommandLineOption folderOption(QStringList()<<"f"<<"folder", "Sets the folder where the server will store the cloud data.", "folder", QStandardPaths::standardLocations(QStandardPaths::DataLocation).at(0)+"/v1.3/");
    parser.addOption(portOption);
    parser.addOption(folderOption);
    parser.process(a);

    QStringList optionNames = parser.optionNames() ;
    QVariantMap parameters;
    foreach (QString optionName, optionNames)
    {
        parameters.insert(optionName, parser.value(optionName));
    }

    PluginManager::getInstance()->loadPlugins(parameters);
    return a.exec();
}
