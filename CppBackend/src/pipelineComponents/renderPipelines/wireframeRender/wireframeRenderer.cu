//
// Created by Tanmay Vemuri_L on 01-11-2023.
//

#include "pipelineComponents/renderPipelines/superPipeline.cu"
#include "classes/rendering/Scene/primitives/triangle.cu"
#include "classes/rendering/Scene/primitives/plane.cu"
#include "math/coordinateGeometry.cu"

struct D2Coordinates{
    int x;
    int y;
};

__global__ mapVertexBufferToCameraPlane(//TODO:)


class wireframeRenderer : public superPipeline{
    int* renderGPU(VertexBuffer vertexBuffer, TriangleBuffer primitiveBuffer, superCamera superCameraIn) override {
        int imageHeight = superCameraIn.getImageHeight();
        int imageWidth = superCameraIn.getImageWidth();

        int* image = new int[imageHeight * imageWidth];


    }
};



