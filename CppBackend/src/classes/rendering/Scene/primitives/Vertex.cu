//
// Created by Tanmay Vemuri_L on 01-11-2023.
//
#include "classes/rendering/Scene/primitives/vector3.cu"

class Vertex{
private:
    Vector3 position;
    Vector3 normal;
    //TODO: UV Mapping
public:
    __device__ __host__ Vertex(Vector3 position, Vector3 normal){
        this->position = position;
        this->normal = normal;
    }

    __device__ __host__ Vector3 getPosition(){
        return position;
    }

    __device__ __host__ Vector3 getNormal(){
        return normal;
    }
};

class VertexBuffer{
private:
    Vertex* vertices;
    int size;
public:
    Vertex* getVertex(int index){
        return &vertices[index];
    }

    //TODO: {I/O} Add functions to import objects from file

    //TODO: {SHADER} Flesh out the shader system
};