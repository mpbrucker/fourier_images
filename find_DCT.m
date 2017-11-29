function [DCTy, DCTcb, DCTcr] = find_DCT(y, cb, cr)
    array_len = size(y,3);
    DCTy = zeros(8,8,1);
    DCTcb = zeros(8,8,1);
    DCTcr = zeros(8,8,1);
    for i=1:array_len
        DCTy(:,:,i) = dct2(y(:,:,i));
    end
    for i=1:array_len
        DCTcb(:,:,i) = dct2(cb(:,:,i));
    end
    for i=1:array_len
        DCTcr(:,:,i) = dct2(cr(:,:,i));
    end
end