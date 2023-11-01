//
// Created by Tanmay Vemuri_L on 15-10-2023.
//

#include "plog/Log.h"
#include "ray.cu"

/// This class stores the indices of the vertices wrt to the vertex buffer
class Triangle  {
private:
    int V1;
    int V2;
    int V3;

public:
    __device__ __host__ Triangle(int V1, int V2, int V3) {
        this->V1 = V1;
        this->V2 = V2;
        this->V3 = V3;
    }

    __device__ __host__ float rayTriangleIntersection(Ray* inRay){
        //TODO:
    }
};

class TriangleBuffer {
private:
    Triangle* triangles;
    int size;
public:
    __device__ __host__ Triangle* getTriangle(int index){
        return &triangles[index];
    }

    //For culling triangles, when we eventually get to it
    __device__ __host__ int deleteTriangle(int index){
        //TODO:
    }
};