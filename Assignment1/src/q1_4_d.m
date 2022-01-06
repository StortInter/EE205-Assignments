clc; clear;

y = @(x) sin(pi/2 .* x);

n = -4:4;
x = n;

subplot(2, 1, 1);
stem(n, x);
xlabel('n'); ylabel('x[n]');

subplot(2, 1, 2);
stem(n, y(x));
axis([xlim -1.2 1.2]);
xlabel('n'); ylabel('y[n]');
