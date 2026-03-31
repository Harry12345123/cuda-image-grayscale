#include <opencv2/opencv.hpp>
#include <iostream>
void grayscale_cuda(const unsigned char *bgr, unsigned char *gray, int width, int height);
int main(int argc, char **argv)
{
    std::string input = argc > 1 ? argv[1] : "input.jpg";
    cv::Mat img = cv::imread(input, cv::IMREAD_COLOR);
    if (img.empty())
    {
        std::cerr << "Failed to load image: " << input << std::endl;
        return -1;
    }
    cv::Mat gray(img.rows, img.cols, CV_8UC1);
    grayscale_cuda(img.data, gray.data, img.cols, img.rows);
    cv::imwrite("output_grayscale.jpg", gray);
    std::cout << "Saved: output_grayscale.jpg" << std::endl;
    return 0;
}