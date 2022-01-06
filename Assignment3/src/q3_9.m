close('all'); clear; clc;

t = linspace(0, 20, 1000);
x = cos(t);
sys = tf(1,[1 1]);

%% a
yt = lsim(sys, x, t);

figure; hold('on');
plot(t(501:end), x(501:end));
plot(t(501:end), yt(501:end));
grid('on'); legend('x(t)', 'y(t)'); xlabel('t');


%% b
x2 = sign(x);
y2t = lsim(sys, x2, t);

figure; hold('on');
plot(t(501:end), x2(501:end));
plot(t(501:end), y2t(501:end));
grid('on'); legend('x_2(t)', 'y_2(t)'); xlabel('t');

%% c
a_k = @(k) 2/(pi*k) * sin(pi/2*k)^3;
apos_k = @(k) a_k(k);
aneg_k = @(k) a_k(-k);

s1 = apos_k(1)*exp(1i*t) + aneg_k(1)*exp(-1i*t);
s2 = apos_k(2)*exp(2i*t) + aneg_k(2)*exp(-2i*t);
s3 = apos_k(3)*exp(3i*t) + aneg_k(3)*exp(-3i*t);
s4 = apos_k(4)*exp(4i*t) + aneg_k(4)*exp(-4i*t);
s5 = apos_k(5)*exp(5i*t) + aneg_k(5)*exp(-5i*t);
ssum = s1 + s2 + s3 + s4 + s5;

figure; hold('on');
plot(t(501:end), x2(501:end));
plot(t(501:end), ssum(501:end));
grid('on'); legend('x_2(t)', 'sum(s1-5)'); xlabel('t');

%% d
y1 = lsim(sys, s1, t);
y2 = lsim(sys, s2, t);
y3 = lsim(sys, s3, t);
y4 = lsim(sys, s4, t);
y5 = lsim(sys, s5, t);
yssum = y1+y2+y3+y4+y5;
y_ssum = lsim(sys, ssum, t);

figure; hold('on');
plot(t(501:end), yssum(501:end));
plot(t(501:end), y_ssum(501:end) - 0.1);
grid('on'); legend('sum(y1-5)', 'ssum->lsim - 0.1'); xlabel('t');

%% e
figure; hold('on');
plot(t(501:end), y2t(501:end));
plot(t(501:end), y_ssum(501:end));
grid('on'); legend('y_2(t)', 'yssum'); xlabel('t');

%% f
y1v = 1/(1+1i)*apos_k(1)*exp(1i*t) + 1/(1-1i)*aneg_k(1)*exp(-1i*t);
y2v = 1/(1+2i)*apos_k(2)*exp(2i*t) + 1/(1-2i)*aneg_k(2)*exp(-2i*t);
y3v = 1/(1+3i)*apos_k(3)*exp(3i*t) + 1/(1-3i)*aneg_k(3)*exp(-3i*t);
y4v = 1/(1+4i)*apos_k(4)*exp(4i*t) + 1/(1-4i)*aneg_k(4)*exp(-4i*t);
y5v = 1/(1+5i)*apos_k(5)*exp(5i*t) + 1/(1-5i)*aneg_k(5)*exp(-5i*t);


figure;
subplot(5,2,1);
plot(t(501:end), y1(501:end));
grid('on'); title('y_1'); xlabel('t');
subplot(5,2,2);
plot(t(501:end), y1v(501:end));
grid('on'); title('y_1v'); xlabel('t');
subplot(5,2,3);
plot(t(501:end), y2(501:end));
grid('on'); title('y_2'); xlabel('t');
subplot(5,2,4);
plot(t(501:end), y2v(501:end));
grid('on'); title('y_2v'); xlabel('t');
subplot(5,2,5);
plot(t(501:end), y3(501:end));
grid('on'); title('y_3'); xlabel('t');
subplot(5,2,6);
plot(t(501:end), y3v(501:end));
grid('on'); title('y_3v'); xlabel('t');
subplot(5,2,7);
plot(t(501:end), y4(501:end));
grid('on'); title('y_4'); xlabel('t');
subplot(5,2,8);
plot(t(501:end), y4v(501:end));
grid('on'); title('y_4v'); xlabel('t');
subplot(5,2,9);
plot(t(501:end), y5(501:end));
grid('on'); title('y_5'); xlabel('t');
subplot(5,2,10);
plot(t(501:end), y5v(501:end));
grid('on'); title('y_5v'); xlabel('t');
