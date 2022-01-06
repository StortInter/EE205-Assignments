close('all'); clear; clc;

load('ctftmod.mat');

%% a
z = [dash dash dot dot];

figure;
plot(t, z); grid('on');
title('z'); xlabel('t');


%% b
[h, wout] = freqs(bf, af);

figure;
subplot(2,1,1);
semilogx(wout, abs(h)); grid('on');
axis([xlim 0 1]);
xlabel('\omega'); ylabel('Magnitude');
subplot(2,1,2);
semilogx(wout, angle(h)); grid('on');
axis([xlim -pi pi]);
xlabel('\omega'); ylabel('Phase');


%% c
ydash = lsim(bf, af, dash, t(1:length(dash)));
ydot = lsim(bf, af, dot, t(1:length(dot)));

figure;
subplot(2,1,1);
plot(t(1:length(dash)), ydash, t(1:length(dash)), dash); grid('on');
xlabel('t'); ylabel('dash'); legend('filtered', 'original')
subplot(2,1,2);
plot(t(1:length(dot)), ydot, t(1:length(dot)), dot); grid('on');
xlabel('t'); ylabel('dot'); legend('filtered', 'original')


%% d
y = dash .* cos(2*pi*f1*t(1:length(dash)));
yo = lsim(bf, af, y, t(1:length(dash)));

figure;
subplot(2,1,1);
plot(t(1:length(dash)), yo); grid('on');
xlabel('t'); title('yo');
subplot(2,1,2);
plot(t(1:length(dash)), yo, t(1:length(dash)), y); grid('on');
xlabel('t'); legend('yo', 'y');


%% f
m1 = lsim(bf, af, x .* cos(2*pi*f1*t), t);

figure;
plot(t, m1); grid('on');
title('m_1'); xlabel('t');


%% g
m2 = lsim(bf, af, x .* sin(2*pi*f2*t), t);
m3 = lsim(bf, af, x .* sin(2*pi*f1*t), t);

figure;
subplot(2,1,1);
plot(t, m2); grid('on');
title('m_2'); xlabel('t');
subplot(2,1,2);
plot(t, m3); grid('on');
title('m_3'); xlabel('t');
