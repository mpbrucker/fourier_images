img1 = rgb2gray(imread('image1.jpg'));
img_fft = fftshift(fft2(img1, 512, 512));

kern = [0,0,2; 0,2,4; 2,4,4];
kernel = zeros(size(img_fft));
kernel(111:113,111:113) = kern;
kernel_fft = fftshift(fft2(kernel));
filt_fft = img_fft.*kernel_fft;

% noisy_peaks = ~imregionalmax(img_mags);
% noisy_peaks(250:260,250:260) = 1;
% filt_fft = img_fft.*noisy_peaks;
filt_img = ifft2(ifftshift(filt_fft));


img_mags = log(abs(img_fft) + 1);
plot_fft = mat2gray(img_mags);
plot_filt = mat2gray(log(abs(filt_fft)+1));
clf;
subplot(1,4,1);
imshow(img1);
title('Original');
subplot(1,4,2);
imshow(plot_fft, []);
title('FFT of image');
subplot(1,4,3);
imshow(plot_filt, []);
title('Filtered FFT');
subplot(1,4,4);
imshow(mat2gray(abs(filt_img)));
title('Filtered image');