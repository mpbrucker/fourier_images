function [image] = matToImg(mat, r, c)
% matToImg converts a matrix with padding back to the image
    [n,m,~] = size(mat);
    image = mat(1:n-r, 1:m-c, :);
end

