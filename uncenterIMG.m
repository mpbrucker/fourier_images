function [ycbcrIMG] = uncenterIMG(centeredIMG)
%uncenterIMG makes image values back to range of [0,255]
    ycbcrIMG = centeredIMG + 128;
end

