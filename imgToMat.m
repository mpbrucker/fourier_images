function [img, rows, collumns] = imgToMat(imgName)
%imgToMat takes an image file and converts it to a matrix of the correct
%size. If image is not a multiple of 8 size extra zeros will be added to
%make it the correct size.
    image = imread(imgName);
    [n,m,z] = size(image);
    c = 0; 
    r = 0;
    if mod(n,8) ~= 0
        extra = 8 - mod(n,8);
        zMAT = zeros(extra,m,z);
        image = vertcat(image,zMAT);
        c = extra;
    end

    [n,m,z] = size(image);

    if mod(m,8) ~= 0
        extra = 8 - mod(m,8);
        zMAT = zeros(n,extra,z);
        image = horzcat(image,zMAT);
        r = extra;
    end
    img = double(image);
    rows = r;
    collumns = c;
end

