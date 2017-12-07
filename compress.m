function compressed_img = compress(filename, quality)
orig_img = imread(filename);
[img, rows, columns] = imgToMat(filename);
ycbImg = rgbToYcbcr(img);
imgCenter = centerIMG(ycbImg);
[y_blocks, cb_blocks, cr_blocks] = create_blocks(imgCenter);
[DCTy, DCTcb, DCTcr] = find_DCT(y_blocks, cb_blocks, cr_blocks);
[Qy, Qcb, Qcr] = quantize(DCTy, DCTcb, DCTcr, quality);

[dictY, dictCB, dictCR] = get_dicts(Qy, Qcb, Qcr);
[codedY, codedCB, codedCR] = encode(Qy,Qcb,Qcr, dictY, dictCB, dictCR);
[decY, decCB, decCR] = decode(codedY, codedCB, codedCR, dictY, dictCB, dictCR);

[reconY, reconCB, reconCR] = dequantize(decY, decCB, decCR, quality);
[y, cb, cr] = inv_DCT(reconY, reconCB, reconCR);
img_reconstruct = blocksToImg(y, cb, cr, size(imgCenter,1), size(imgCenter,2));
uncentered = uncenterIMG(img_reconstruct);
compressed_img = ycbcrToRgb(uncentered);
recon_img = matToImg(compressed_img, rows+8, columns);



subplot(1,2,1);
imshow(orig_img);
title(strcat('Number of bytes unencoded: ',string(prod(size(orig_img)))));

subplot(1,2,2);
imshow(uint8(recon_img));
title(strcat('Number of bytes encoded: ',string(ceil((size(codedY,2)+size(codedCB,2)+size(codedCR,2))/8))))

end