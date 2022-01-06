function y = iLPF(x, cutoff)
    x_fft = fft(x);
    x_fft(round(length(x)*cutoff/2):(end-round(length(x)*cutoff/2-1))) = 0;
%     plot(abs(fftshift(x_fft)));
    y = ifft(x_fft);
end
