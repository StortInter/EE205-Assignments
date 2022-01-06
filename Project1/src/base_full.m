close('all'); clear; clc;

%% basic para
f_name = 'C_01_01.wav';
N = 64;
butter_order = 4;
env_cutoff = 100;

%% load
[y, fs] = audioread(strcat('./assets/', f_name));
t = linspace(0, length(y)/fs, length(y));

% figure; hold('on');
% plot(t, y);
% axis([0 t(end) ylim]); grid('on');

%% split
f0 = 200;
f1 = 7000;
f2d = @(f) log10(f/165.4 + 1) / 0.06;
d2f = @(d) 165.4 * (10.^(0.06*d) - 1);

d_range = linspace(f2d(f0), f2d(f1), N+1);
f_range_l = d2f(d_range);
f_range = [f_range_l(1:end-1); f_range_l(2:end)].';
f_mid = diff(f_range_l)/2 +f_range_l(1:end-1);

%% init filter
butters = zeros([2*butter_order+1 size(f_range)]);
for i = 1:length(f_mid)
     [butters(:,i,1), butters(:,i,2)] = butter(butter_order, f_range(i,:)/(fs/2));
end

figure; hold('on');
for i = 1:length(f_mid)
    [h, w] = freqz(butters(:,i,1), butters(:,i,2));
    plot(w, abs(h));
end
xlabel('\omega'); ylabel('Amplitude');
grid('on'); axis([0 pi 0 1]);
set(gca, 'XTick', 0:pi/4:pi, 'XTickLabel', {'0','\pi/4','\pi/2','3\pi/4','\pi'});

%% band-pass
y_f = zeros(length(y), length(f_mid));
for i = 1:length(f_mid)
     y_f(:,i) = filter(butters(:,i,1), butters(:,i,2), y);
end

% figure; hold('on');
% for i = 1:length(f_mid)
%     plot(t, y_f(:,i));
% end

%% envelope
y_f = abs(y_f);
[LPF_b, LPF_a] = butter(butter_order, env_cutoff/(fs/2));
y_ff = filter(LPF_b, LPF_a, y_f);

% figure; hold('on');
% for i = 1:length(f_mid)
%     plot(t, y_ff(:,i));
% end
% axis([0 t(end) ylim]); grid('on');

%% freq shift
y_ffe = zeros(size(y_ff));
for i = 1:length(f_mid)
     y_ffe(:,i) = sin(2*pi*f_mid(i)*t).' .* y_ff(:,i);
end

% figure; hold('on');
% for i = 1:length(f_mid)
%     plot(t, y_ffe(:,i));
% end

%% summation
y_s = sum(y_ffe, 2);
y_s = y_s/norm(y_s)*norm(y);

% figure; hold('on');
% plot(t, y_s, t, y);

% sound(y_s, fs);
