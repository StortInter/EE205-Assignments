clc; clear; close('all');

load('./lineup.mat');

Ryy = conv(y, flipud(y));

figure;
plot(-6999:6999, Ryy / Ryy(7000));
axis([-6999 6999 -.4 1]);