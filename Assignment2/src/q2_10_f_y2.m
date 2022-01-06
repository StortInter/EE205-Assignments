clc; clear; close('all');

load('./lineup.mat');

Ryy2 = conv(y2, flipud(y2));

figure;
plot(-6999:6999, Ryy2 / Ryy2(7000));
axis([-6999 6999 -.4 1]);

b = 1;
a = [1 zeros(1, 500) 0.7];
z2 = filter(b, a, y2);
Rzz2 = conv(z2, flipud(z2));
% sound(z2, 8192);

figure;
subplot(2,1,1);
plot(z2); title('filtered sound');
subplot(2,1,2);
plot(-6999:6999, Rzz2 / Rzz2(7000)); title('z2 autocorrelation');
axis([-6999 6999 -.4 1]);
