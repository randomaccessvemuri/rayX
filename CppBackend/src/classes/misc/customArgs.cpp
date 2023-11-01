//
// Created by Tanmay Vemuri_L on 31-10-2023.
//
#include <plog/Log.h>

template <typename T>
class customArguments{
    T* data;
    int numberOfArguments;

    __host__ __device__ customArguments(T* data, int numberOfArguments){
        this->data = data;
        this->numberOfArguments = numberOfArguments;
    }

    __host__ __device__ operator[](int index) {
        if (index >= numberOfArguments) {
                PLOGE << "Index out of bounds for custom arguments!";

                //Think of better way to create error codes!
                exit(1);
            }
            return data[index];

    }


};