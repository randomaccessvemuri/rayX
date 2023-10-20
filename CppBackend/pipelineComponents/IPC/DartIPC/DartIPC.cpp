//
// Created by Tanmay Vemuri_L on 20-10-2023.
//

#include "../SuperIPC.cpp"

class DartIPC : public SuperIPC {
    /*
     * This method will be called to send the image to the Dart front end, compiled at runtime!
     */
    int sendToFrontEnd(int* imageBuffer, int imageWidth, int imageHeight, int imageChannels) override {
        
    }
};