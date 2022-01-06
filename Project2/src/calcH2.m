close('all'); clear; clc;

N = 32;
CP = 3;
T = 1e-6;
w_c = 100e6;
fs = 1e9;
cutoff = 0.02;

x = zeros(1,32);

X_CP = [1 zeros(1, N-1)];
X_c = reshape(repmat(X_CP, T*fs, 1), 1, []);
t_X_c = linspace(0, length(X_c)/fs - 1/fs, length(X_c));    % non-integer end

X_cos = real(X_c) .* cos(w_c*t_X_c);
X_sin = imag(X_c) .* sin(w_c*t_X_c);
X_m = X_cos + X_sin;

h_n = [0.5 zeros(1, 1.5*T*fs-1) 0.4 zeros(1, 1*T*fs-1) 0.35 zeros(1, 0.5*T*fs-1) 0.3];
X_t = conv(X_m, h_n);
t_X_t = linspace(0, length(X_t)/fs - 1/fs, length(X_t));

[b, a] = butter(5, cutoff, 'low');
X_r_d = 2 * filter(b, a, X_t .* cos(w_c*t_X_t)) + 2j * filter(b, a, X_t .* sin(w_c*t_X_t));

X_r_adc = mean(reshape(X_r_d, T*fs, length(X_r_d)/T/fs));

figure; hold('on');
plot(t_X_c, X_cos, t_X_c, X_sin);
axis([0 t_X_c(end) ylim]); grid('on');
xlabel('t (s)'); ylabel('X(t)');
legend('x\_cos', 'x\_sin'); title('modulation');

figure; hold('on');
plot(t_X_c, X_m);
axis([0 t_X_c(end) ylim]); grid('on');
xlabel('t (s)'); ylabel('X(t)');
title('summation');

figure;
plot(t_X_t, X_t);
axis([0 t_X_t(end) ylim]); grid('on');
xlabel('t (s)');  ylabel('X(t)');
title('transfer');

figure;
plot(t_X_t, real(X_r_d), t_X_t, imag(X_r_d));
axis([0 t_X_t(end) ylim]); grid('on');
xlabel('t (s)'); ylabel('X(t)');
legend('real', 'image'); title('demodulation');

figure;
plot(t_X_t, abs(X_r_d));
axis([0 4.5e-6 ylim]); grid('on');
xlabel('t (s)'); ylabel('X(t)');
title('demodulation');

figure; hold('on');
stem(0:(length(X_r_adc)-1), abs(X_r_adc));
axis([-0.25 4.25 ylim]);
set(gca, 'XTick', 0:4, 'XTickLabel', {'0', '1', '2', '3', '4'});
grid('on');
xlabel('n'); ylabel('X[n]');
 title('ADC');
    