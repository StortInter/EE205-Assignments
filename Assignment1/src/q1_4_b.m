clc; clear;

n = -5:9;
x = [zeros(1,5), ones(1,10)];
n1 = -6:8;
y = [x 0] + [0 x];

subplot(3, 1, 1);
stem(n, x);
axis([-5 9 -0.2 1.2]);
xlabel('n'); ylabel('x[n]');

subplot(3, 1, 2);
stem(n1, x);
axis([xlim -0.2 1.2]);
xlabel('n'); ylabel('x[n+1]');

subplot(3, 1, 3);
stem(-6:9, y);
axis([-6 9 -0.2 2.2]);
xlabel('n'); ylabel('y[n]');
