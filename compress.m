function compressed_img = compress(filename)
orig_img = imread(filename);
[img, rows, columns] = imgToMat(filename);
ycbImg = rgbToYcbcr(img);
imgCenter = centerIMG(ycbImg);
[y_blocks, cb_blocks, cr_blocks] = create_blocks(imgCenter);
[DCTy, DCTcb, DCTcr] = find_DCT(y_blocks, cb_blocks, cr_blocks);
[Qy, Qcb, Qcr] = quantize(DCTy, DCTcb, DCTcr);

[dictY, dictCB, dictCR] = get_dicts(Qy, Qcb, Qcr);
[codedY, codedCB, codedCR] = encode(Qy,Qcb,Qcr, dictY, dictCB, dictCR);
[decY, decCB, decCR] = decode(codedY, codedCB, codedCR, dictY, dictCB, dictCR);

[reconY, reconCB, reconCR] = dequantize(decY, decCB, decCR);
[y, cb, cr] = inv_DCT(reconY, reconCB, reconCR);
img_reconstruct = blocksToImg(y, cb, cr, size(imgCenter,1), size(imgCenter,2));
uncentered = uncenterIMG(img_reconstruct);
compressed_img = ycbcrToRgb(uncentered);
recon_img = matToImg(compressed_img, rows, columns);

subplot(1,2,1);
imagesc(orig_img);
subplot(1,2,2);
imagesc(uint8(recon_img));

end