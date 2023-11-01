//
// Created by Tanmay Vemuri_L on 01-11-2023.
//

#include "pipelineComponents/renderPipelines/superPipeline.cu"
#include "classes/rendering/Scene/primitives/triangle.cu"

struct D2Coordinates{
    int x;
    int y;
};


class wireframeRenderer : public superPipeline{
    int* renderGPU(VertexBuffer vertexBuffer, TriangleBuffer primitiveBuffer, superCamera superCameraIn) override {
        int imageHeight = superCameraIn.getImageHeight();
        int imageWidth = superCameraIn.getImageWidth();
    }
};

__host__ __device__ struct D2Coordinates mapVertexTo2DPlane(Vertex inVert){
    //TODO: Implement this
}

