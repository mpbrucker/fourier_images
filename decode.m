function [y, cb, cr] = decode(yIn, cbIn, crIn, dictY, dictCB, dictCR)
    y = reshape(huffmandeco(yIn,dictY),8,8,[]);
    cb= reshape(huffmandeco(cbIn, dictCB),8,8,[]);
    cr = reshape(huffmandeco(crIn, dictCR),8,8,[]);
end