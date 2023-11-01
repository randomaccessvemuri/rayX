//
// Created by Tanmay Vemuri_L on 15-10-2023.
//

#include <plog/Log.h>
#include "classes/image.cpp"
#include "superCamera.cu"
#include "classes/rendering/Scene/primitives/Vertex.cu"
#include "classes/rendering/Scene/primitives/triangle.cu"

class superPipeline{
private:
    Image* image;
    char* rendererID;

    //These 2 are provided in case the end user doesn't have an Nvidia GPU
public:
    __host__ __device__ superPipeline(Image* image, char* rendererID){
        this->image = image;
        this->rendererID = rendererID;
    }

    //These will be called on host only since the GPU method will be expected to write its own CUDA kernel to parallelise its rendering!
    __host__ virtual int* renderGPU(VertexBuffer vertexBuffer, TriangleBuffer primitiveBuffer, superCamera superCameraIn) = 0;
    __host__ virtual int* renderCPU(VertexBuffer vertexBuffer, TriangleBuffer primitiveBuffer, superCamera superCameraIn) = 0;

    char* getRendererID() const {
        return rendererID;
    }
};