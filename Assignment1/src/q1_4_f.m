clc; clear;

y = @(n, x) n .* x;

% not time-invariant
n = -3:3;
x1 = n;
x2 = n-1;

subplot(2, 1, 1);
stem(n, x1, 'b*'); hold on;
stem(n, x2, 'ro');
xlabel('n'); ylabel('x[n]');
legend('x[n]', 'x[n-1]');

subplot(2, 1, 2);
stem(n, y(n, x1), 'b*'); hold on;
stem(n, y(n, x2), 'ro');
xlabel('n'); ylabel('y[n]');
legend('y|x[n]', 'y|x[n-1]');