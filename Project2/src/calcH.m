close('all'); clear; clc;

N = 32;
CP = 3;
T = 1e-6;
w_c = 100e6;
fs = 1e9;

h_n = [0.5 zeros(1, 1.5*T*fs-1) 0.4 zeros(1, 1*T*fs-1) 0.35 zeros(1, 0.5*T*fs-1) 0.3];

amp_h = h_n>0;

h_n_t = [h_n zeros(1, T*fs)];

for i = 1:length(amp_h)
    if amp_h(i) > 0
        h_n_t((i+1):(i+T*fs-1)) = h_n_t((i+1):(i+T*fs-1)) + h_n(i);
    end
end

h_n_t(end) = [];

t = linspace(0, length(h_n_t)/fs - 1/fs, length(h_n_t));
figure;
plot(t, h_n_t, linspace(0, length(h_n)/fs - 1/fs, length(h_n)), h_n, 'r');
grid('on');
axis([t(1) t(end) ylim]);
legend('h_t(t)', 'h(t)');
xlabel('t (s)');

HH = mean(reshape(h_n_t, T*fs, length(h_n_t)/T/fs));
figure; stem(HH);