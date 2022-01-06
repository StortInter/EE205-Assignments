close('all'); clear(); clc();

N = 32;
CP = 3;
T = 1e-6;
w_c = 100e6;
fs = 1e9;

% freq_pool = 0:1e3:w_c;
freq_pool = 1e5:1e6:10*w_c;
% freq_pool(1) = 1;
data = zeros(length(freq_pool), 100);

for i = 1:length(freq_pool)
    for j = 1:100
        x = rand(1, N);
        y = OFDM(x, CP, T, w_c, fs, -freq_pool(i)/pi/fs, false, 1, false);
        data(i, j) = norm(x - y) .^ 2;
    end
    disp(freq_pool(i));
end

data = data.';
m = mean(data);
v = var(data);
%%

figure;
semilogy(freq_pool, m, '-');
% set(gca, 'XTick', 1:3, 'XTickLabel', {'1', '2', '3'});
% axis([0.5 3.5 ylim]);
grid('on');
xlabel('Cutoff (rad/s)'); ylabel('Variance');
title('ideal LPF');
