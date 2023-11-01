//
// Created by Tanmay Vemuri_L on 01-11-2023.
//
#include "classes/rendering/Scene/primitives/vector3.cu"

class Vertex{
private:
    Vector3 position;
    Vector3 normal;
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