function compressed_img = compress(filename)
orig_img = imread(filename);
img = imgToMat(filename);
ycbImg = rgbToYcbcr(img);
imgCenter = centerIMG(ycbImg);
[y_blocks, cb_blocks, cr_blocks] = create_blocks(imgCenter);
[DCTy, DCTcb, DCTcr] = find_DCT(y_blocks, cb_blocks, cr_blocks);
[Qy, Qcb, Qcr] = quantize(DCTy, DCTcb, DCTcr);

[y, cb, cr] = inv_DCT(Qy, Qcb, Qcr);
img_reconstruct = blocksToImg(y, cb, cr, size(imgCenter,1), size(imgCenter,2));
uncentered = uncenterIMG(img_reconstruct);
compressed_img = ycbcrToRgb(uncentered);

subplot(1,2,1);
imagesc(orig_img);
subplot(1,2,2);
imagesc(uint8(compressed_img));

end