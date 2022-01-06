clc; clear;

[pxx, w] = periodogram(repmat(y, 10, 1), [], 512, fs);
[pxx2, w2] = periodogram(repmat(y_ssn, 10, 1), [], 512, fs);

figure;
plot(w, 10*log10(pxx), w2, 10*log10(pxx2))
title('Periodogram of signal'); xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');
grid('on'); legend('y', 'y\_ssn')
