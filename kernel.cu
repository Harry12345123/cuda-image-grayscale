#include <cuda_runtime.h>
#include <iostream>
__global__ void grayscale_kernel(const unsigned char *bgr, unsigned char *gray, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= width || y >= height)
        return;
    int idx = y * width + x;
    int bgr_idx = idx * 3;
    unsigned char b = bgr[bgr_idx + 0];
    unsigned char g = bgr[bgr_idx + 1];
    unsigned char r = bgr[bgr_idx + 2];
    gray[idx] = static_cast<unsigned char>(0.114f * b + 0.587f * g + 0.299f * r);
}
void grayscale_cuda(const unsigned char *bgr, unsigned char *gray, int width, int height)
{
    size_t bgr_bytes = width * height * 3;
    size_t gray_bytes = width * height;
    unsigned char *d_bgr = nullptr, *d_gray = nullptr;
    cudaMalloc(&d_bgr, bgr_bytes);
    cudaMalloc(&d_gray, gray_bytes);
    cudaMemcpy(d_bgr, bgr, bgr_bytes, cudaMemcpyHostToDevice);
    dim3 block(16, 16);
    dim3 grid((width + block.x - 1) / block.x, (height + block.y - 1) / block.y);
    grayscale_kernel<<<grid, block>>>(d_bgr, d_gray, width, height);
    cudaDeviceSynchronize();
    cudaMemcpy(gray, d_gray, gray_bytes, cudaMemcpyDeviceToHost);
    cudaFree(d_bgr);
    cudaFree(d_gray);
}