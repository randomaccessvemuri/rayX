# Structuring

The whole program can be broken down into the following components

- A Manager that oversees the whole process and whose primary job is to **compile the renderer at runtime**
- A backend under this manager that is responsible for modifying the scene as specified, compiling shaders, rendering the scene and applying post processing effects as specified.
- The frontend is responsible for displaying the rendered image and the scene in a window. It also allows the user to modify the scene and the post processing effects.

That is the main feature of this program. The renderer is compiled at runtime based on sources provided by default or specified by the user in a json file called "rendererDef.json"

The manager also oversees that the IPC between the backend and the frontend is taking place correctly by communicating with both of them. 

Funnily, even the IPC between the backend and the frontend is compiled at runtime. The manager compiles the IPC at runtime based on the sources provided by default or specified by the user in the rendererDef.json file. This allows specifying the IPC in any language as long as the user can implement it. However, it must specify the IPC between the manager and the frontend for obvious reasons!

This allows for a very extensible rendering framework that can be used to test out different rendering algorithms and techniques and allows testing them out much faster!

We are also now not limited to just path tracing but any form of rendering that can be done on CUDA. This includes rasterization, ray tracing, path tracing, photon mapping, etc. This way, we can also specify any processes to be run before and after the rendering process like shadow mapping, affine transformations on the scene, etc.

The project will provide an overridable superclasses for each of the stages, and anything written that is to be included in the pipeline must adhere to these in order to maintain consistency and actually be able to be executed by the manager.

Potentially Code sanitiziation may be considered to prevent malicious code but unfortunately, the fact that we provide so much access to the user means that we cannot outright prevent them from running anything malicious but we can reduce it to some extent!

## Another feature: Shaders written in CUDA + C++
 
The shaders are written in CUDA + C++ and same as the renderer, compiled at runtime. This allows for a lot of flexibility and allows the user to write shaders in any language as long as they can be compiled to a shared library. This also allows for the user to use any libraries they want to use in their shaders as long as it is compatible with CUDA. 