clc; clear;

% not casual
n = -4:4;
x = n;

y = intersect(n, 2.*n);

subplot(2, 1, 1);
stem(n, x);
xlabel('n'); ylabel('x[n]');

subplot(2, 1, 2);
stem(n, [Inf Inf y Inf Inf]);
axis([-4 4 ylim]);
xlabel('n'); ylabel('y[n]');
