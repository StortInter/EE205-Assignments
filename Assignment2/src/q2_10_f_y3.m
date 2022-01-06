clc; clear; close('all');

load('./lineup.mat');

Ryy3 = conv(y3, flipud(y3));

figure;
plot(-6999:6999, Ryy3 / Ryy3(7000));
axis([-6999 6999 -.4 1]);

b = 1;
a = [1 zeros(1, 750) 0.75 zeros(1, 1500) 0.6];
z3 = filter(b, a, y3);

% sound(z3, 8192);

figure;
plot(z3); title('filtered sound');
