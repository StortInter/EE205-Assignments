close('all'); clear; clc;

%% load
f_name = 'yuki_004627.ogg';
[x, fs] = audioread(strcat('./assets/', f_name));
x = (sum(x.') / 2).';   % merge track

SSN = audioread(strcat('./assets/SSN.wav'));


%% add noise
SNR = -5;
syms('a', 'b');
[a, b] = solve( ...
    (a*norm(x)) / (b*norm(SSN)) == 10^(SNR/20), ...
    a^2*norm(x)^2 + 2*a*b*norm(x.*SSN) + b^2*norm(SSN)^2 == norm(x)^2 ...
    );
a = double(a(a>0));
b = double(b(b>0));
y = a*x + b*SSN;


%% check
fprintf('E_x=%.2f\n', norm(x)^2);
fprintf('E_y=%.2f\n', norm(y)^2);
fprintf('SNR=%.3f\n', 20*log10(norm(a*x)/norm(b*SSN)));


%% preview
% sound(y, fs);

t = linspace(0, length(y)/fs, length(y));
[pyy, w] = periodogram(repmat(y, 10, 1), [], 512, fs);
pxx = periodogram(repmat(x, 10, 1), [], 512, fs);

figure;
subplot(2, 1, 1);
plot(t, y);
grid('on'); axis([t(1) t(end) ylim]);
title(sprintf('Signal add SSN, SNR=%d', SNR)); xlabel('t');
subplot(2, 1, 2);
plot(w, 10*log10(pyy), w, 10*log10(pxx));
legend('orgin signal', 'signal with noise')
grid('on'); axis([w(1) w(end) ylim]);
title('Periodogram of signal'); xlabel('\omega (Hz)'); ylabel('Power/Frequency (dB/Hz)');
