load handel
handelDct = dct(y);
handelFft = fft(y);

handelDct(30000:end) = 0;
handelFft(30000:end) = 0;
reconDct = idct(handelDct);
reconFft = ifft(handelFft);

plot(y);
hold on;
plot(reconDct);
plot(real(reconFft));