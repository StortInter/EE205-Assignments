clc; clear; close('all');

n = 0:1000;
x = [1 zeros(1, 1000)];

b = [1 zeros(1, 999) 0.5];
a = 1;
he = filter(b, a, x);

figure;
stem(n, he, 'r'); grid('on');
