function [y_blocks, cb_blocks, cr_blocks] = create_blocks(input_mat)
    blocks = zeros(8,8,1,3);
    for dim=1:3
        slice = input_mat(:,:,dim);
        slice_size = size(slice);
        cur_block = 1; % The current block in our list of blocks
        for i=1:8:slice_size(1)-7
            for j=1:8:slice_size(2)-7
                block = slice(i:i+7,j:j+7); % Create the block
                blocks(:,:,cur_block,dim) = block; % Add onto the list of blocks
                cur_block = cur_block+1; % Increment the block we're on
            end
        end
    end
    y_blocks = blocks(:,:,:,1);
    cb_blocks = blocks(:,:,:,2);
    cr_blocks = blocks(:,:,:,3);
end