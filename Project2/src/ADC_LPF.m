
%%
res = reshape(repmat(X_r_adc, T*fs, 1), 1, []);
t_res = linspace(0, length(res)/fs - 1/fs, length(res));

figure;
plot(t_res, real(res), t_res, imag(res));
axis([0 t_res(end) ylim]); grid('on');
xlabel('t (s)'); ylabel('X[n]');
legend('real', 'image'); title('DAC');

%%
h_n = [ones(1, T*fs) zeros(1, T*fs)];
figure;
plot(abs(fftshift(fft(h_n))));
