function [ycbcrIMG] = rgbToYcbcr(rgbIMG)
%rgbToYbcbcr converts rgb image to Y Cb Cr values
    trans = [.299 .587 .114; -.169 -.334 .5; .5 -.419 -.081];
    shift = [0; 128; 128];
    [n,m,z] = size(rgbIMG);
    yImage = zeros(n,m,z);
    for r = 1:n
        for c = 1:m
            rgb = rgbIMG(r,c,:);
            rgb = reshape(rgb,[3,1]);
            ycc = (trans*rgb) + shift;
            yImage(r,c,:) = ycc;
        end
    end
    ycbcrIMG = yImage;
end

