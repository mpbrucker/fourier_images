function [y, cb, cr] = inv_DCT(DCTy, DCTcb, DCTcr)
    array_len = size(DCTy,3);
    y = zeros(8,8,1);
    cb = zeros(8,8,1);
    cr = zeros(8,8,1);
    for i=1:array_len
        y(:,:,i) = idct2(DCTy(:,:,i));
    end
    for i=1:array_len
        cb(:,:,i) = idct2(DCTcb(:,:,i));
    end
    for i=1:array_len
        cr(:,:,i) = idct2(DCTcr(:,:,i));
    end
end