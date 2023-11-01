//______           __   __    ______            _                  _    ______         _____               _ _ _
//| ___ \          \ \ / /    | ___ \          | |                | |_  | ___ \       |_   _|             (_|_) |
//| |_/ /__ _ _   _ \ V /     | |_/ / __ _  ___| | _____ _ __   __| (_) | |_/ /_   _    | |_ __ ___   __ _ _ _| | __
//|    // _` | | | |/   \     | ___ \/ _` |/ __| |/ / _ \ '_ \ / _` |   | ___ \ | | |   | | '_ ` _ \ / _` | | | |/ /
//| |\ \ (_| | |_| / /^\ \    | |_/ / (_| | (__|   <  __/ | | | (_| |_  | |_/ / |_| |   | | | | | | | (_| | | |   <
//\_| \_\__,_|\__, \/   \/    \____/ \__,_|\___|_|\_\___|_| |_|\__,_(_) \____/ \__, |   \_/_| |_| |_|\__,_| |_|_|\_\
//             __/ |                                                            __/ |                    _/ |
//             |___/                                                            |___/                    |__/


#define RAYX_BACKEND_VERSION "0.0.0"
#include <iostream>
#include <cuda_runtime.h>
#include <plog/Log.h>
#include <plog/Appenders/ColorConsoleAppender.h>
#include <plog/Appenders/RollingFileAppender.h>
#include <plog/Formatters/TxtFormatter.h>
#include <plog/Formatters/CsvFormatter.h>
#include <plog/Initializers/RollingFileInitializer.h>
#include "classes/rendering/Scene/primitives/ray.cu"


int initfileLogging(){
    static plog::RollingFileAppender<plog::TxtFormatter> fileAppender("logs/log.txt", 1000000, 3);
    static plog::RollingFileAppender<plog::CsvFormatter> csvAppender("logs/log.csv", 1000000, 3);
    static plog::RollingFileAppender<plog::TxtFormatter> errorAppender("logs/error.txt", 1000000, 3);
    static plog::RollingFileAppender<plog::CsvFormatter> errorCsvAppender("logs/error.csv", 1000000, 3);
    static plog::ColorConsoleAppender<plog::TxtFormatter> consoleAppender;


    plog::init(plog::verbose, &fileAppender).addAppender(&csvAppender).addAppender(&errorAppender).addAppender(&errorCsvAppender).addAppender(&consoleAppender);

    return 0;
}

void printSignature(){
    //RayX ASCII Art signature

    PLOG_INFO << "______           __   __    ______            _                  _    ______         _____               _ _ _";
    PLOG_INFO << "| ___ \\          \\ \\ / /    | ___ \\          | |                | |_  | ___ \\       |_   _|             (_|_) |";
    PLOG_INFO << "| |_/ /__ _ _   _ \\ V /     | |_/ / __ _  ___| | _____ _ __   __| (_) | |_/ /_   _    | |_ __ ___   __ _ _ _| | __";
    PLOG_INFO << "|    // _` | | | |/   \\     | ___ \\/ _` |/ __| |/ / _ \\ '_ \\ / _` |   | ___ \\ | | |   | | '_ ` _ \\ / _` | | | |/ /";
    PLOG_INFO << "| |\\ \\ (_| | |_| / /\\ \\    | |_/ / (_| | (__|   <  __/ | | | (_| |_  | |_/ / |_| |   | | | | | | | (_| | | |   <";
    PLOG_INFO << "\\_| \\_\\__,_|\\__, \\/  \\/    \\____/ \\__,_|\\___|_|\\_\\___|_| |_|\\__,_(_) \\____/ \\__, |   \\_/_| |_| |_|\\__,_| |_|_|\\_\\";
    PLOG_INFO << "             __/ |                                                            __/ |                    _/ |";
    PLOG_INFO << "             |___/                                                            |___/                    |__/";

    PLOG_INFO << "=======================================================";
    PLOG_INFO << "RayX Backend Version: " << RAYX_BACKEND_VERSION;
    PLOG_INFO << "CUDA Version: " << CUDART_VERSION;
    PLOG_INFO << "CUDA Driver Version: " << CUDART_VERSION;
    PLOG_INFO << "=======================================================";
}




int main() {
    initfileLogging();
    printSignature();

    //Here we will ideally have the IPC code to receive the scene modifications/config from the frontend and thus the rendering loop within it:



    return 0;
}
