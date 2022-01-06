close('all'); clear; clc;

%% load
f_name = 'yuki_004627.ogg';
[y, fs] = audioread(strcat('./assets/', f_name));
y = (sum(y.') / 2).';   % merge track
t = linspace(0, length(y)/fs, length(y));

%% full wave rectification
y = abs(y);

%% change cutoff freq
cutoff = [100, 200, 300];
figure;
for i = 1:length(cutoff)
    subplot(length(cutoff), 1, i);
    plot(t, y, t, butterLPF(y, fs, 2, cutoff(i)));
    legend('orginal signal', 'envelope curve');
    axis([t(1) t(end) ylim]); xlabel('t'); grid('on');
    title(sprintf('Order: %d, Cutoff freq: %dHz', 3, cutoff(i)));
end

%% change order
order = [2, 6];
figure;
for i = 1:length(order)
    subplot(length(order), 1, i);
    plot(t, y, t, butterLPF(y, fs, order(i), 200));
    legend('orginal signal', 'envelope curve');
    axis([t(1) t(end) ylim]); xlabel('t'); grid('on');
    title(sprintf('Order: %d, Cutoff freq: %dHz', order(i), 200));
end

%% add on
order = 1:2:10;
figure; hold('on');
lege = repmat("", 1, length(order));
for i = 1:length(order)
    [b, a] = butter(order(i), 0.5);
    [h, w] = freqz(b, a);
    plot(w, abs(h));
    lege(i) = sprintf('order=%d',order(i));
end
legend(lege); xlabel('\omega'); ylabel('Amplitude');
grid('on'); axis([0 pi 0 1]);
set(gca,'XTick', 0:pi/4:pi, 'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi'});
