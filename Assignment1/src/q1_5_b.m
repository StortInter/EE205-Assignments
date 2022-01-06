clc; clear;

a = 1;
yn1 = 0;
n = 0:30;

x1 = [1 zeros(1,30)];
x2 = ones(1,31);

y1 = diffeqn(a, x1, yn1);
y2 = diffeqn(a, x2, yn1);

subplot(2,1,1);
stem(n, y1);
axis([xlim, 0 1.1]);
xlabel('n'); ylabel('y_1[n]');
subplot(2,1,2);
stem(n, y2);
xlabel('n'); ylabel('y_2[n]');
