clc; clear;

n = 0:6;
% set x[n] = n
x = n;

y = @(X) log(x);

subplot(2, 1, 1);
stem(n, x);
axis([-0.5 6 ylim]);
xlabel('n'); ylabel('x[n]');

subplot(2, 1, 2);
yx = y(x);
stem(n, yx);
axis([-0.5 6 ylim]);
xlabel('n'); ylabel('y[n]');
