//
// Created by Tanmay Vemuri_L on 31-10-2023.
//


#include <plog/Log.h>
#include "classes/rendering/Scene/primitives/vector3.cu"

///This class is to be inherited by all the other cameras and specifically implemented for any style of camera that you desire to make. Since the way the camera works for path tracing (by shooting out rays) is different from the way it works for rasterization, this class is virtual and will be implemented by the rasterization pipeline and the path tracing pipeline separately. It doesn't implement any specific methods, as opposed to the way it's defined in Ray tracing In One Weekend (that defines a getPixel function) since the method of rendering is different and it may involve iterating over each pixel or rather mapping things onto the camera plane

class superCamera{
private:
    int imageHeight;
    int imageWidth;
    int FOV;
    int aspectRatio;

    Vector3 origin;
    Vector3 direction;
public:
    __host__ __device__ superCamera(int imageHeight, int imageWidth, int FOV, int aspectRatio, Vector3 origin, Vector3 direction){
        this->imageHeight = imageHeight;
        this->imageWidth = imageWidth;
        this->FOV = FOV;
        this->aspectRatio = aspectRatio;
        this->origin = origin;
        this->direction = direction;
    }

    int getImageHeight() const {
        return imageHeight;
    }

    void setImageHeight(int imageHeightIn) {
        superCamera::imageHeight = imageHeightIn;
    }

    int getImageWidth() const {
        return imageWidth;
    }

    void setImageWidth(int imageWidthIn) {
        superCamera::imageWidth = imageWidthIn;
    }

    int getFov() const {
        return FOV;
    }

    void setFov(int fov) {
        FOV = fov;
    }

    int getAspectRatio() const {
        return aspectRatio;
    }

    void setAspectRatio(int aspectRatioIn) {
        superCamera::aspectRatio = aspectRatioIn;
    }

    const Vector3 &getOrigin() const {
        return origin;
    }

    void setOrigin(const Vector3 &originIn) {
        superCamera::origin = originIn;
    }

    const Vector3 &getDirection() const {
        return direction;
    }

    void setDirection(const Vector3 &directionIn) {
        superCamera::direction = directionIn;
    }
};

