//
// Created by Tanmay Vemuri_L on 31-10-2023.
//
#include "pipelineComponents/renderPipelines/superPipeline.cu"
#include "pipelineComponents/renderPipelines/superCamera.cu"
#include "classes/rendering/Scene/primitives/Vertex.cu"
#include "classes/rendering/Scene/primitives/triangle.cu"
#include <cuda_runtime.h>
#include <plog/Log.h>

//TODO: When the shader table and stuff is implemented, add them as members
class Scene{
    superCamera* camera;
    superPipeline* pipeline;
    VertexBuffer* vertexBuffer;
    PrimitiveBuffer* primitiveBuffer;


    //As the components of the full pipeline are completed, add them here!

    int* generateImage() {
        try{
            //NOTE: If rendererID starts with G, renders on GPU
            if (this->pipeline->getRendererID()[0] == 'G') {
                try{
                    return this->pipeline->renderGPU(vertexBuffer, primitiveBuffer);
                } catch (const char* msg) {
                    PLOGE <<"POSSIBLE ERROR WITH GPU, TRYING TO SWITCHING TO CPU. CHECK FOLLOWING MESSAGE FOR MORE: " << msg;
                    return this->pipeline->renderCPU(vertexBuffer, primitiveBuffer);
                }

            } else {
                return this->pipeline->renderCPU(vertexBuffer, primitiveBuffer);
            }
        } catch (const char* msg) {
            PLOGE << msg;
            this->pipeline->renderCPU();
        }
    }
};