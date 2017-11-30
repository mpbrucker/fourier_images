function [codedY, codedCB, codedCR, dict] = encode(y, cb, cr, dictY, dictCB, dictCR)
    codedY = huffmanenco(reshape(y,1,[]),dictY);
    codedCB = huffmanenco(reshape(cb,1,[]), dictCB);
    codedCR = huffmanenco(reshape(cr,1,[]), dictCR);
end