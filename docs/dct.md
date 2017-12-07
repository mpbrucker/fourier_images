---
layout: default
title: The Discrete Cosine Transform
use_math: true
---

### Transforms for Image Compression: The Discrete Cosine Transform

When it comes to image compression, the DFT isn't ideal. It involves a lot of complex numbers, which can be tricky to represent, and it often isn't the most efficient at representing data, for reasons we will see later. However, fortunately there's a transform that's better suited for compression. The Discrete Cosine Transform is a transform in the Fourier family of transforms - that is, it involves the projection of a signal onto a number of sinusoidal basis vectors, except now the basis vectors are cosine waves instead of complex exponentials as in the DFT.  

#### Properties of the Discrete Cosine Transform

The DCT has a number of properties which differentiate it from the DFT. The first property is fairly noticeable, if we look at the definition of the DCT:

$$
 X_{i,j} = \sum_{n=0}^{N-1} \sum_{m=0}^{M-1} x_{n,m}cos(\frac{\pi}{N}(n+\frac{1}{2})i)cos(\frac{\pi}{M}(m+\frac{1}{2})j)
$$

we can see that the DCT only uses cosine waves, and thus the output of the DCT is always real. Other properties of the DCT have important implications for how and where it's used. The first is related to properties of signals that the DCT is usually applied to. Real-world signals tend to be "pink" in nature, meaning that the power of a signal is proportional to *1/frequency*. The DCT has high energy compaction, which means that low-frequency content of a signal is highly concentrated together in a few terms. This is useful for most real-world signals, as it means that most of the power of the signal will be concentrated in the first few terms of the DCT.

Another important property of DCTs - and how they relate to DFTs - is their *edge behavior*. Because these transforms turn signals into sums of exponentials, which are defined for the set of real numbers, these transforms imply an extension of the original signal infinitely in the time domain. However, different transforms handle this extension differently; the DFT simply repeats the original signal infinitely, whereas the DCT is "even" at boundaries, meaning that anything past the boundaries of the signal is just a reflection of the signal (there are other types of DCTs that are "odd", but we focus on a DCT that is even).

![The edge behavior of the DCT.](FourierSample.png)
Observe that in the DFT, a signal with a very different starting and ending value has a large jump - or *boundary discontinuity* - at the edges of the original. This results in a lot of high frequencies showing up to compensate for this discontinuity. However, in the DCT, there is no discontinuity at boundaries, and thus fewer high frequencies showing up, making it more advantageous for transforming image data, which may have very different edge values.

#### 2D DCTs of Images

In order to get the image processing benefits of the DCT, we must be able to take DCTs of 2D signals such as images. Fortunately, the DCT of a 2D signal can be taken fairly easily, in a manner similar to a 2D DFT. In order to take the DCT of an image, we must definte a DCT matrix, with each vector of the matrix being:

$$
\begin{equation}
    v_i =
    \alpha_i
        \begin{bmatrix}
        cos(\frac{\pi}{2N}i) \\
        cos(\frac{\pi}{N}(1+\frac{1}{2})i) \\
        cos(\frac{\pi}{N}(2+\frac{1}{2})i) \\
        \vdots \\
        cos(\frac{\pi}{N}((N-1)+\frac{1}{2})i) \\
        \end{bmatrix}
\end{equation}
$$

where N is the size of the image. The DCT matrix then becomes:

$$
\begin{equation}
    \bf{V} = \begin{bmatrix}
        \bf{v_1 v_2 v_3} \ldots \bf{v_n}
    \end{bmatrix}
\end{equation}
$$  

Note that $\alpha_i$ is a coefficient equal to:  

$$
\begin{equation}
    \alpha_i =
    \begin{cases}
      \frac{1}{\sqrt{N}} & i=0 \\
      \sqrt{\frac{2}{N}} & 1\leq i\leq N-1 \\
  \end{cases}
\end{equation}
$$  

The purpose of $\alpha_i$ is to make the DCT matrix orthonormal; this way, we can transpose the DCT matrix to find its inverse. In order to actually take the DCT of an image, we simply take $VXV^T$, where $X$ is the original image matrix. In the 2D DCT, the constant component of the data is in the top left, with frequency increasing down and to the right.

![The DCT of an image.](dct_img.PNG)

We mentioned earlier that in the DCT, most of the information is concentrated in a few low frequencies. This can be seen in the above figure; the highest DCT coefficients, which are the brightest pixels, are in the top-left of the DCT matrix, which correspond to the low-frequency components of the DCT.
