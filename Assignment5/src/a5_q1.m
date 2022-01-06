close('all'); clear; clc;

%% load
f_name = 'yuki_004627.ogg';
[y, fs] = audioread(strcat('./assets/', f_name));
y = (sum(y.') / 2).';   % merge track


%% preview
% sound(y, fs);

t = linspace(0, length(y)/fs, length(y));

figure;
plot(t, y);
grid('on'); axis([t(1) t(end) ylim]);
title(f_name, 'interpreter', 'none'); xlabel('t');


%% repeat signal
sig = repmat(y, 10, 1);


%% calc periodogram power spectral density
[pxx, w] = periodogram(sig, [], 512, fs);

figure;
subplot(2, 1, 1);
plot(w, 10*log10(pxx));
grid('on'); axis([w(1) w(end) ylim]);
title('Periodogram of signal'); xlabel('\omega (Hz)'); ylabel('Power/Frequency (dB/Hz)');
subplot(2, 1, 2);
plot(w, pxx);
grid('on'); axis([w(1) w(end) ylim]);
title('Periodogram of signal'); xlabel('\omega (Hz)'); ylabel('Power/Frequency');


%% fir2
b = fir2(3000, w/(fs/2), sqrt(pxx/max(pxx)));
[h, wh] = freqz(b, 1, 128);

figure;
subplot(2, 1, 1);
plot(wh, 20*log10(abs(h)));
grid('on'); axis([wh(1) wh(end) ylim]);
title('Amplitude frequency response of filter'); xlabel('\omega'); ylabel('Amplitude (dB)');
subplot(2, 1, 2);
plot(wh, abs(h));
grid('on'); axis([wh(1) wh(end) ylim]);
title('Amplitude frequency response of filter'); xlabel('\omega'); ylabel('Amplitude');


%% noise generate
noise = 1 - 2*rand(1, length(y));

[pxxn, wn] = periodogram(noise, [], 512, fs);

figure;
subplot(2, 1, 1);
plot(wn, 10*log10(pxxn));
grid('on'); axis([wn(1) wn(end) ylim]);
title('Periodogram of noise'); xlabel('\omega (Hz)'); ylabel('Power/Frequency (dB/Hz)');
subplot(2, 1, 2); 
plot(wn, pxxn);
grid('on'); axis([wn(1) wn(end) ylim]);
title('Periodogram of noise'); xlabel('\omega (Hz)'); ylabel('Power/Frequency');


%% apply filter
y_n = filter(b, 1, noise);

[pxxyn, wyn] = periodogram(y_n, [], 512, fs);

figure;
subplot(2, 1, 1); hold('on');
plot(wyn, 10*log10(pxxyn));
plot(w, 10*log10(pxx));
grid('on'); axis([wyn(1) wyn(end) ylim]);
legend('noise', 'signal');
title('Periodogram'); xlabel('\omega (Hz)'); ylabel('Power/Frequency (dB/Hz)');
subplot(2, 1, 2); hold('on');
plot(wyn, pxxyn);
plot(w, pxx);
grid('on'); axis([wyn(1) wyn(end) ylim]);
legend('noise', 'signal');
title('Periodogram'); xlabel('\omega (Hz)'); ylabel('Power/Frequency');


%% save SSN
audiowrite('./assets/SSN.wav', y_n, fs);
