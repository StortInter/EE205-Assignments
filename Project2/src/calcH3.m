close('all'); clear; clc;

N = 32;
CP = 3;
T = 1e-6;
w_c = 100e6;
fs = 1e9;
cutoff = 0.02;

X_m = ones(1,T*fs);

h_n = [0.5 zeros(1, 1.5*T*fs-1) 0.4 zeros(1, 1*T*fs-1) 0.35 zeros(1, 0.5*T*fs-1) 0.3];
X_t = conv(X_m, h_n);
t_X_t = linspace(0, length(X_t)/fs - 1/fs, length(X_t));

figure;
plot(t_X_t, X_t);
axis([0 t_X_t(end) ylim]); grid('on');
xlabel('t (s)');  ylabel('X(t)');
title('transfer');
