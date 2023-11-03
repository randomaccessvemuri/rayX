//
// Created by Tanmay Vemuri_L on 03-11-2023.
//


#include "classes/rendering/Scene/primitives/plane.cu"
#include "classes/rendering/Scene/primitives/Vertex.cu"

class Vector2{
private:
    int x;
    int y;
public:
    __host__ __device__ Vector2(int x, int y) {
        this->x = x;
        this->y = y;
    }


    __host__ __device__ int getX() const {
        return x;
    }

    __host__ __device__ void setX(int xIn) {
        Vector2::x = xIn;
    }

    __host__ __device__ int getY() const {
        return y;
    }

    __host__ __device__ void setY(int yIn) {
        Vector2::y = yIn;
    }
};

namespace RayX_Math{
    __host__ __device__  Vector2 map3DVertexTo2DPlane(Vertex inVert, Plane planeIn){
        //Project the vertex onto the plane still in 3D space

        Vector3 projection3D = planeIn.getNormal() * (inVert.getPosition().getDot(planeIn.getNormal()));

        //Map this 3D point to a 2D point on the plane
        Vector2 projection2D = Vector2(projection3D.getX(), projection3D.getY());




    }
}

