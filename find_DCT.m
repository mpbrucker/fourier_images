function [DCTy, DCTcb, DCTcr] = find_DCT(y, cb, cr)
    array_len = size(y,3);
    DCTy = zeros(8,8,1);% Start a list of Y DCTs
    DCTcb = zeros(8,8,1);
    DCTcr = zeros(8,8,1);
    dct_mtx = DCT_mat(8); % Get the DCT matrix
    
    for i=1:array_len
        DCTy(:,:,i) = dct_mtx'*y(:,:,i)*dct_mtx;
    end
    for i=1:array_len
        DCTcb(:,:,i) = dct_mtx'*cb(:,:,i)*dct_mtx;
    end
    for i=1:array_len
        DCTcr(:,:,i) = dct_mtx'*cr(:,:,i)*dct_mtx;
    end
end