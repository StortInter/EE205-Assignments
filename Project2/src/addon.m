figure; hold('on');
stem(0:(length(x)-1), real(ifft(x))); stem(0:(length(x)-1), imag(ifft(x)));
axis([-1 length(x) ylim]); grid('on'); xlabel('n');
title('signal');


figure;
plot(t_X_c, X_cos + X_sin);
axis([0 t_X_c(end) ylim]); grid('on');
xlabel('t (s)'); ylabel('X(t)');
legend('x\_cos', 'x\_sin'); title('modulation');


figure; hold('on');
plot(linspace(-fs/2+1, fs/2, length(X_t)), abs(fftshift(fft(X_t))));
grid('on'); axis([-4e7, 4e7, ylim]); xlabel('Frequency (Hz)');


figure; hold('on');
plot(linspace(-fs/2+1, fs/2, length(X_t)), abs(fftshift(fft(X_t .* cos(w_c*t_X_t)))));
plot(linspace(-fs/2+1, fs/2, length(X_t)), abs(fftshift(fft(filter(b, a, X_t .* cos(w_c*t_X_t))))), 'r:');
grid('on'); axis([-4e7, 4e7, ylim]); xlabel('Frequency (Hz)');

ww = linspace(-fs/2+1, fs/2, length(X_m));
figure; hold('on');
plot(ww, abs(fftshift(fft(X_m))));
axis([ww(1) ww(end) ylim]);
% line([w_c/2/pi, w_c/2/pi], [1e4, 0], 'Color', 'magenta');
% line([-w_c/2/pi, -w_c/2/pi], [1e4, 0], 'Color', 'magenta');
grid('on'); xlabel('Frequency (Hz)');
title('FT of modulated signal');


ww2 = linspace(-fs/2, fs/2-1, length(X_c));
figure; hold('on');
plot(ww, abs(fftshift(fft(X_c))));
axis([ww(1) ww(end) ylim]);
grid('on'); xlabel('Frequency (Hz)');
title('FT of modulated signal');
