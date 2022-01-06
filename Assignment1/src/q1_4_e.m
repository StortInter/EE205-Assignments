clc; clear;

y = @(x) x.^3;

% non linear
n = -2:2;
x1 = n;
x2 = 2 .* n;

subplot(3, 1, 1);
stem(n, x1);
xlabel('n'); ylabel('x[n]');

subplot(3, 1, 2);
stem(n, y(x1), 'b*'); hold on;
stem(n, y(x2), 'ro');
xlabel('n'); ylabel('y[n]');
legend('y|x_1', 'y|x_2');

subplot(3, 1, 3);
stem(n, y(x1)+y(x2), 'b*'); hold on;
stem(n, y(x1+x2), 'ro');
xlabel('n'); ylabel('y[n]');
legend('y|x_1 + y|x_2', 'y|(x_1+x_2)');
