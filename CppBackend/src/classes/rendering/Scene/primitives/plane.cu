//
// Created by Tanmay Vemuri_L on 03-11-2023.
//
#include "vector3.cu"

class Plane{
private:
    Vector3 normal;
    Vector3 pointOnPlane;
public:
    __device__ __host__ Plane(Vector3 normal, Vector3 pointOnPlane){
        this->normal = normal;
        this->pointOnPlane = pointOnPlane;
    }

    __device__ __host__ Vector3 getNormal(){
        return normal;
    }

    __device__ __host__ Vector3 getPointOnPlane(){
        return pointOnPlane;
    }
};