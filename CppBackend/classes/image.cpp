//
// Created by Tanmay Vemuri_L on 15-10-2023.
//
#include <opencv2/opencv.hpp>

class Image {
private:
    cv::Mat image;
    std::string name;

public:
    Image(std::string name, int rows, int cols){
        this->name = name;
        image = cv::Mat(rows, cols, CV_8UC3, cv::Scalar(0,0,0));
    }

    Image(std::string name, int rows, int cols, cv::Vec3b defaultColor){
        this->name = name;
        image = cv::Mat(rows, cols, CV_8UC3, defaultColor);
    }

    Image(std::string name, int rows, int cols, int r, int g, int b){
        this->name = name;
        image = cv::Mat(rows, cols, CV_8UC3, cv::Scalar(r,g,b));
    }

    Image(std::string name, std::string dir){
        this->name = name;
        image = cv::imread(dir);
    }

    Image(std::string name, cv::Mat image){
        this->name = name;
        this->image = image;
    }

    Image(std::string name, int* image, int rows, int cols){
        this->name = name;
        this->image = cv::Mat(rows, cols, CV_8UC3, (unsigned*)image);
    }

    void setPixel(int x, int y, cv::Vec3b color){
        image.at<cv::Vec3b>(x, y) = color;
    }

    void setPixel(int x, int y, int r, int g, int b){
        image.at<cv::Vec3b>(x, y) = cv::Vec3b(r, g, b);
    }


    uchar* getRawImageBuffer(){
        return image.data;
    }

    std::pair<int,int> getDims(){
        return std::make_pair(image.rows, image.cols);
    }

    //DEBUG ONLY
    void displayImage(){
        cv::imshow(name, image);
        cv::waitKey(0);
    }

    void saveImage(std::string filename){
        cv::imwrite(filename, image);
    }

    void loadImageFromFile(std::string dir){
        image = cv::imread(dir);
    }
};