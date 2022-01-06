close('all'); clear; clc;

%% a
X_gen = @(w) 4./(4+w.^2);


%% b
tau = 1e-2;
T = 11;
t = 0:tau:(T-tau);
N = round(T/tau);

y = exp(-2 * abs(t-5));
y(t>10) = 0;

figure;
plot(t, y); grid('on');
axis([t(1) t(end) ylim]);
title('y(t)=x(t-5)'); xlabel('t');


%% c
Y = fftshift(tau*fft(y));


%% d
w = -(pi/tau) + (0:(N-1)) * (2*pi/(N*tau));


%% e
X = exp(5i*w) .* Y;


%% f
figure;
subplot(2,1,1);
semilogy(w, abs(X)); grid('on');
axis([w(1) w(end) ylim]);
title('X Magnitude'); xlabel('\omega');
subplot(2,1,2);
plot(w, angle(X)); grid('on');
axis([w(1) w(end) ylim]);
title('X Phase'); xlabel('\omega');

X_ana = X_gen(w);

figure;
subplot(2,1,1);
semilogy(w, abs(X_ana)); grid('on');
axis([w(1) w(end) ylim]);
title('Analytical X Magnitude'); xlabel('\omega');
subplot(2,1,2);
plot(w, unwrap(angle(X_ana))); grid('on');
axis([w(1) w(end) ylim]);
title('Analytical X Phase'); xlabel('\omega');

figure;
semilogy(w, abs(X)); hold('on');
semilogy(w, abs(X_ana)); grid('on');
axis([w(1) w(end) ylim]);
xlabel('\omega'); legend('fft X', 'ana X');


%% g
figure;
subplot(2,1,1);
semilogy(w, abs(Y)); grid('on');
title('Y Magnitude'); xlabel('\omega');
subplot(2,1,2);
plot(w, unwrap(angle(Y))); grid('on');
axis([w(1) w(end) ylim]);
title('Y Phase'); xlabel('\omega');
