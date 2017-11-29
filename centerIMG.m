function [centeredIMG] = centerIMG(ycbcrIMG)
%center makes values from [-128,127]
    centeredIMG = ycbcrIMG - 128;
end

