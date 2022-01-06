clc; clear; close('all');

n = 0:1000;
x = [1 zeros(1, 1000)];

a = 1;
b = [1 zeros(1, 999) 0.5];
y = filter(b, a, x);

a = [1 zeros(1, 999) 0.5];
b = 1;
z = filter(b, a, y);

figure;
subplot(3,1,1);
stem(n, x, 'r');
title('x'); grid('on');
subplot(3,1,2);
stem(n, y, 'r');
title('y'); grid('on');
subplot(3,1,3);
stem(n, z, 'r');
title('z'); grid('on');
