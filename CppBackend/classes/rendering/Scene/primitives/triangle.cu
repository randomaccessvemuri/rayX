//
// Created by Tanmay Vemuri_L on 15-10-2023.
//

#include <plog/Log.h>
#include "ray.cu"

__host__ __device__ class Triangle {
private:
    Vector3 V1;
    Vector3 V2;
    Vector3 V3;

public:
    __device__ __host__ Triangle(Vector3 V1, Vector3 V2, Vector3 V3) {
        this->V1 = V1;
        this->V2 = V2;
        this->V3 = V3;
    }

    __device__ __host__ float rayTriangleIntersection(Ray* inRay){
        //TODO:
    }
};