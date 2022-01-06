clc; clear;

a = 1;
yn1 = -1;
n = 0:30;

x1 = ones(1,31);
x2 = 2 .* ones(1,31);

y1 = diffeqn(a, x1, yn1);
y2 = diffeqn(a, x2, yn1);

subplot(3,1,1);
stem(n, y1);
xlabel('n'); ylabel('y_1[n]');
subplot(3,1,2);
stem(n, y2);
xlabel('n'); ylabel('y_2[n]');
subplot(3,1,3);
stem(n, 2.*y1 - y2);
xlabel('n'); ylabel('2y_1[n]-y_2[n]');
axis([xlim, -1.1 0]);
