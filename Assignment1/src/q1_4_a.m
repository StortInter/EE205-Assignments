clc; clear;

n = -3:3;
x1 = [zeros(1,3), 1, zeros(1,3)];
x2 = 2 .* x1;

y = @(x) sin(pi/2 .* x);

subplot(3, 1, 1);
stem(n, x1);
axis([xlim -0.2 1.2]);
xlabel('n'); ylabel('x[n]');

subplot(3, 1, 2);
stem(n, y(x1), 'b.'); hold on;
stem(n, y(x2), 'ro');
axis([xlim -0.2 1.2]);
xlabel('n'); ylabel('y[n]');
legend('y|x_1', 'y|x_2');

subplot(3, 1, 3);
stem(n, y(x1)+y(x2), 'b.'); hold on;
stem(n, y(x1+x2), 'ro');
axis([xlim -1.2 1.2]);
xlabel('n'); ylabel('y[n]');
legend('y|x_1 + y|x_2', 'y|(x_1+x_2)');
