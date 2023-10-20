#include <cuda_runtime.h>
#include "vector3.cu"
//This class can be called on both CPU and GPU
__device__ __host__ class Ray{
private:
    Vector3 origin;
    Vector3 direction;

public:
    __device__ __host__ Ray(Vector3 origin, Vector3 direction){
        this->origin = origin;
        this->direction = direction;
    }

    __device__ __host__ Ray(float origin, float direction){
        this->origin = Vector3(origin, origin, origin);
        this->direction = Vector3(direction, direction, direction);
    }

    __device__ __host__ Ray(){
        this->origin = Vector3(0,0,0);
        this->direction = Vector3(0,0,0);
    }

    __device__ __host__ Ray(float originX, float originY, float originZ, float directionX, float directionY, float directionZ){
        this->origin = Vector3(originX, originY, originZ);
        this->direction = Vector3(directionX, directionY, directionZ);
    }

    __device__ __host__ Vector3 getOrigin(){
        return this->origin;
    }
    __device__ __host__ Vector3 getDirection(){
        return this->direction;
    }
    __device__ __host__ void setOrigin(Vector3 origin){
        this->origin = origin;
    }
    __device__ __host__ void setDirection(Vector3 direction){
        this->direction = direction;
    }
};