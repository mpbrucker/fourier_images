function [y, cb, cr] = inv_DCT(DCTy, DCTcb, DCTcr)
    array_len = size(DCTy,3);
    y = zeros(8,8,1);
    cb = zeros(8,8,1);
    cr = zeros(8,8,1);
    dct_mtx = DCT_mat(8);
    
    for i=1:array_len
        y(:,:,i) = dct_mtx*DCTy(:,:,i)*dct_mtx';
    end
    for i=1:array_len
        cb(:,:,i) = dct_mtx*DCTcb(:,:,i)*dct_mtx';
    end
    for i=1:array_len
        cr(:,:,i) = dct_mtx*DCTcr(:,:,i)*dct_mtx';
    end
end