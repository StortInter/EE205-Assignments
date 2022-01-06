clc; clear; close('all');

n = 0:1000;
x = [1 zeros(1, 1000)];

a = [1 zeros(1, 999) 0.5];
b = 1;
her = filter(b, a, x);

figure;
stem(n, her, 'r');
title('her'); grid('on');
