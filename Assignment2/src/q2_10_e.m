clc; clear; close('all');

n = 0:1000;
x = [1 zeros(1, 1000)];

b = [1 zeros(1, 999) 0.5];
a = 1;
he = filter(b, a, x);

b = 1;
a = [1 zeros(1, 999) 0.5];
her = filter(b, a, x);

hoa = conv(he, her);

figure;
subplot(3,1,1);
stem(n, he, 'r');
title('he'); grid('on');
subplot(3,1,2);
stem(n, her, 'r');
title('her'); grid('on');
subplot(3,1,3);
stem(0:2000, hoa, 'r');
title('hoa'); grid('on');
