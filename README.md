# CUDA Image Grayscale

A beginner-friendly CUDA C++ project for converting RGB images to grayscale on the GPU.

This repository is part of my CUDA image processing series, designed for developers who want to learn practical GPU programming with simple and visual examples.

## Features

- RGB to grayscale conversion with CUDA
- C++ + CUDA implementation
- Easy-to-understand kernel structure
- Suitable for CUDA beginners
- Good starting point for image processing on GPU

## Tech Stack

- C++
- CUDA
- OpenCV

## Project Goal

The goal of this project is to help developers understand:

- how CUDA threads map to image pixels
- how GPU parallelism accelerates image processing
- how to organize a simple CUDA image project in C++

## Future Improvements

- batch image processing
- performance benchmarking
- stream-based optimization
- Jetson version

## Related Topics

CUDA, GPU Programming, Image Processing, Computer Vision, C++, OpenCV

## Author

Harry12345123

## More

This project is part of my CUDA learning and project ecosystem. More CUDA, TensorRT, Jetson, and OpenGL projects are coming.

## Requirements

- CUDA Toolkit
- OpenCV
- CMake
- C++17 compatible compiler

## Build
```bash
mkdir build
cd build
cmake ..
make -j

## Run
./cuda_image_grayscale ./input.jpg






