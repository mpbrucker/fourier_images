function [rgbImage] = ycbcrToRgb(yImage)
% ycbcrToRgb converts image back to rgb
    trans = [.299 .587 .114; -.169 -.334 .5; .5 -.419 -.081];
    shift = [0; 128; 128];
    [n,m,z] = size(yImage);
    rgbImg = zeros(n,m,z);
    for r = 1:n
        for c = 1:m
            ycc = yImage(r,c,:);
            ycc = double(reshape(ycc,[3,1]));
            rgb = trans\(ycc - shift);
            rgbImg(r,c,:) = rgb;
        end
    end
    rgbImage = rgbImg;
end

