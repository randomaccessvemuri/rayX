//
// Created by Tanmay Vemuri_L on 15-10-2023.
//
#include <cuda_runtime.h>
__device__ __host__ class Vector3{
private:
    float x, y, z;
public:
    __device__ __host__ Vector3(float x, float y, float z){
        this->x = x;
        this->y = y;
        this->z = z;
    }

    __device__ __host__ Vector3(){
        this->x = 0;
        this->y = 0;
        this->z = 0;
    }

    __device__ __host__ float getDot(Vector3 v){
        return this->x*v.x + this->y*v.y + this->z*v.z;
    }

    __device__ __host__ float getMagnitude(){
        return sqrt(this->x*this->x + this->y*this->y + this->z*this->z);
    }

    __device__ __host__ Vector3 getCross(Vector3 v){
        return Vector3(this->y*v.z - this->z*v.y, this->z*v.x - this->x*v.z, this->x*v.y - this->y*v.x);
    }

    __device__ __host__ Vector3 getUnitVector(){
        float magnitude = this->getMagnitude();
        return Vector3(this->x/magnitude, this->y/magnitude, this->z/magnitude);
    }

    //Operators
    __device__ __host__ Vector3 operator+(Vector3 v){
        return Vector3(this->x + v.x, this->y + v.y, this->z + v.z);
    }

    __device__ __host__ Vector3 operator-(Vector3 v){
        return Vector3(this->x - v.x, this->y - v.y, this->z - v.z);
    }

    __device__ __host__ Vector3 operator*(float f){
        return Vector3(this->x*f, this->y*f, this->z*f);
    }

    __device__ __host__ Vector3 operator/(float f){
        return Vector3(this->x/f, this->y/f, this->z/f);
    }

    //Getter
    __device__ __host__ float getX(){
        return this->x;
    }

    __device__ __host__ float getY(){
        return this->y;
    }

    __device__ __host__ float getZ(){
        return this->z;
    }
};