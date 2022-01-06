close('all'); clear(); clc();

N = 32;
CP = 0;
T = 1e-6;
w_c = 100e6;
fs = 1e9;

data = zeros(32, 100);

for i = 1:32
    CP = i;
    for j = 1:100
        x = rand(1, N);
        y = OFDM(x, CP, T, w_c, fs, 0.02, false, 1, false);
        data(i, j) = norm(x - y) .^ 2;
    end
end

data = data.';
m = mean(data);
v = var(data);
%%

figure;
errorbar(m(1:3), v(1:3), 'o-');
set(gca, 'XTick', 1:3, 'XTickLabel', {'1', '2', '3'});
axis([0.5 3.5 ylim]);
grid('on');
xlabel('CP length'); ylabel('Variance')
