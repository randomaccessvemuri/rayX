//
// Created by Tanmay Vemuri_L on 20-10-2023.
//


class SuperIPC {
    /*
     * This class is the superclass for all the IPC classes that will be used to communicate between the different processes
     * This allows for writing IPC towards any other process without having to worry about the implementation details of the IPC, keeping the code cleaner
     */
    virtual int sendToFrontEnd(int* imageBuffer, int imageWidth, int imageHeight, int imageChannels) = 0;

};