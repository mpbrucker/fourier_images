# JPEG Compression Implementation

We broke the process of compressing an RGB image into seven main steps that we implemented in MATLAB. In order to uncompress the image, the same seven steps need to be reversed, so we wrote the converse to each of these steps as well. Here are seven steps to compress an image:

## 1. Resize The Image
#### Input: file name
#### Output: MATLAB NxMx3 matrix, where N and M are multiples of 8

	We wanted our program to be robust enough to take in any image, but only certain image sizes would work with our algorithm. In order for the compression to work, the height and width of the image needed to be divisible by eight. So in this function, an image is converted to a matrix, and if it's dimensions are not divisible by 8, then the appropriate amount of rows or columns are added as padding to make the image the correct dimensions. These values are saved for later unpacking.

## 2. Convert it to the YCbCr color-space
#### Input: NxMx3 matrix in RGB space
#### Output: NxMx3 YCbCr matrix
	
	Generally, the color of an image is defined by its RGB (red, green and blue) values from 0 to 255. However, this is not the only way to define the color of a pixel. YCbCr encodes the color in terms of luminance, chrominance red and chrominance blue. YCbCr is used by JPEG compression because of the discovery that our eyes are much more responsive to changes in light than to changes in color. So in order to save more important information it makes sense to save information about the brightness of an image. 
	This function converts an RGB matrix to a YCbCr matrix by iterating over every pixel and transforming it by the appropriate operation. There are accepted values used to transform RGB to YCbCr space. The output of this function is that matrix.

## 3.  Shifting The Values to Center Around Zero
#### Input NxMx3 image in range [0, 255]
#### Output: NxMx3 image in range [-128,127]

	This functions shifts all the values to a range from -128 to 127 so that the matrix is ready for the blocking step.
