clc; clear; close('all');

n = 0:19;
delta = [1 zeros(1,19)];

h1 = filter(1, [1, -3/5], delta);

h2_f = @(n) (3/5).^(n.*(n+1)./2);
h2 = h2_f(n);

figure;
subplot(2,1,1);
stem(n, h1);
title('h_1'); grid('on');
subplot(2,1,2);
stem(n, h2);
title('h_2'); grid('on');
