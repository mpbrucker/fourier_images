function matOut = DCT_mat(N)
size = 0:N-1;
[j,i] = meshgrid(size);
matOut = sqrt(2/N).*cos((pi/N).*(i+0.5).*j); % Build the DCT matrix
matOut(:,1) = matOut(:,1)/ sqrt(2); % Change the first column

end