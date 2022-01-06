clc; clear; close('all');

load('./lineup.mat');

% sound(y, 8192);

a = [1 zeros(1, 999) 0.5];
b = 1;
z = filter(b, a, y);

figure;
subplot(2,1,1);
plot(y); title('origin sound');
subplot(2,1,2);
plot(z); title('filtered sound');

% sound(z, 8192);
