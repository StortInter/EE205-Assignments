clc; clear; close('all');

n = 0:19;
delta = [1 zeros(1,19)];
h1 = filter(1, [1, -3/5], delta);
h2_f = @(n) (3/5).^(n.*(n+1)./2);
h2 = h2_f(n);

u = ones(1,20);

z1 = conv(h1, u);
z1 = z1(1:20);
z2 = conv(h2, u);
z2 = z2(1:20);

figure;
subplot(2,1,1);
stem(n, z1);
title('z_1'); grid('on');
subplot(2,1,2);
stem(n, z2);
title('z_2'); grid('on');
