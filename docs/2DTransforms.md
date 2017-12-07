---
layout: default
title: 2D Transforms
---

# Two-Dimensional Transforms and Image Processing

The discrete Fourier transform transforms a finite length signal that starts as a function of time into a function of frequency. Just like any one dimensional signal (ex. sound wave) can be represented as a combination of one dimensional frequencies - see Figure 1 - and any two dimensional signals (ex. image) can be represented as a combination of two-dimensional frequencies (see Figure 2). A one-dimensional signal is just a list of values associated with specific moments in time. A two dimensional signal can be represented as a two dimensional matrix of values. That is why a gray scale image can be considered a two-dimensional signal.

![Wave Combination Image](wave.PNG)
**Figure 1.**

![2D Wave Combination Image](imagewave.PNG)
**Figure 2.**

As the functions and properties of one-dimensional and two dimensional Fourier transforms have carried, there are also many possibilities for filtering two-dimensional Fourier transforms. A low pass filter applied to the transform of an image would cause higher frequency properties (such as noise) to be eliminated while a high pass filter would take a way a lot of the details of the image.

![2D Filtering Image](filter.PNG)
