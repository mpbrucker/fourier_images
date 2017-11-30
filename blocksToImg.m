function [img] = blocksToImg(y, cb, cr, width, height)
    y_channel = zeros(width, height);
    cb_channel = zeros(width, height);
    cr_channel = zeros(width, height);
    
    block_num = 1;
    for i=1:8:width-7
        for j=1:8:height-7
            y_channel(i:i+7,j:j+7) = y(:,:,block_num);
            block_num = block_num+1;
        end
    end
    
    block_num = 1;
    for i=1:8:width-7
        for j=1:8:height-7
            cb_channel(i:i+7,j:j+7) = cb(:,:,block_num);
            block_num = block_num+1;
        end
    end
    
    block_num = 1;
    for i=1:8:width-7
        for j=1:8:height-7
            cr_channel(i:i+7,j:j+7) = cr(:,:,block_num);
            block_num = block_num+1;
        end
    end
            
    img = cat(3,y_channel, cb_channel, cr_channel);        
end