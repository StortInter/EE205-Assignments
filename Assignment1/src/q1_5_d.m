clc; clear;

a = 1/2;
yn11 = 0;
yn12 = 1/2;
n = 0:30;

x = ones(1,31);

y1 = diffeqn(a, x, yn11);
yy = diffeqn2(a, x, yn11);
y2 = diffeqn(a, x, yn12);

subplot(2,1,1);
stem(n, y1);
axis([xlim 0 2.2]);
xlabel('n'); ylabel('y_1[n]');
subplot(2,1,2);
stem(n, y2);
axis([xlim 0 2.2]);
xlabel('n'); ylabel('y_2[n]');
