close('all'); clear; clc;

%% c
a = [1, 2*exp(-1i*pi/3), exp(1i*pi/4), exp(-1i*pi/4), 2*exp(1i*pi/3)];

N = size(a, 2);
n = 0:20;

x = a * exp(1i*2*pi/N * (0:(N-1)).' * n);

figure;
subplot(3,1,1);
stem(n, abs(x)); axis([-1 5 -5 5]);
title('|x[n]|'); xlabel('n'); ylabel('x');
subplot(3,1,2);
stem(n, real(x)); axis([-1 5 -5 5]);
title('real(x[n])'); xlabel('n'); ylabel('x');
subplot(3,1,3);
stem(n, imag(x)); axis([-1 5 ylim])
title('imag(x[n])'); xlabel('n'); ylabel('x');


%% d
n = 0:63;

x1 = repmat(ones(1,8), 1, size(n,2)/8);
x2 = repmat([ones(1,8) zeros(1,8)], 1, size(n,2)/16);
x3 = repmat([ones(1,8) zeros(1,24)], 1, size(n,2)/32);

figure;
subplot(3,1,1);
stem(n, x1); axis([0 64 -0.1 1.1]);
title('x_1[n]'); xlabel('n'); ylabel('x');
subplot(3,1,2);
stem(n, x2); axis([0 64 -0.1 1.1]);
title('x_2[n]'); xlabel('n'); ylabel('x');
subplot(3,1,3);
stem(n, x3); axis([0 64 -0.1 1.1]);
title('x_3[n]'); xlabel('n'); ylabel('x');


%% e
a1 = repmat(1/8 * fft(ones(1,8)), 1, size(n,2)/8);
a2 = repmat(1/16 * fft([ones(1,8) zeros(1,8)]), 1, size(n,2)/16);
a3 = repmat(1/32 * fft([ones(1,8) zeros(1,24)]), 1, size(n,2)/32);

figure;
subplot(3,1,1);
stem(n, abs(a1)); axis([0 63 ylim]); grid('on');
title('|a_1|'); xlabel('k'); ylabel('a');
subplot(3,1,2);
stem(n, abs(a2)); axis([0 63 ylim]); grid('on');
title('|a_2|'); xlabel('k'); ylabel('a');
subplot(3,1,3);
stem(n, abs(a3)); axis([0 63 ylim]); grid('on');
title('|a_3|'); xlabel('k'); ylabel('a');


%% f
a3_shift = fftshift(a3);

mid = size(n,2)/2 + 1;
a3_2 = a3_shift(mid-2:mid+2);
a3_8 = a3_shift(mid-8:mid+8);
a3_12 = a3_shift(mid-12:mid+12);
a3_all = a3_shift(mid-15:mid+16);

n = 0:31;
x3_2 = a3_2 * exp(1i*2*pi/size(a3_2,2) * (-2:2).' * n);
x3_8 = a3_8 * exp(1i*2*pi/size(a3_8,2) * (-8:8).' * n);
x3_12 = a3_12 * exp(1i*2*pi/size(a3_12,2) * (-12:12).' * n);
x3_all = a3_all * exp(1i*2*pi/size(a3_all,2) * (-15:16).' * n);

figure;
subplot(4,1,1);
stem(n, real(x3_2)); grid('on'); axis([0 31 ylim]);
title('real(x_{3\_2})'); xlabel('n'); ylabel('x');
subplot(4,1,2);
stem(n, real(x3_8)); grid('on'); axis([0 31 ylim]);
title('real(x_{3\_8})'); xlabel('n'); ylabel('x');
subplot(4,1,3);
stem(n, real(x3_12)); grid('on'); axis([0 31 ylim]);
title('real(x_{3\_12})'); xlabel('n'); ylabel('x');
subplot(4,1,4);
stem(n, real(x3_all)); grid('on'); axis([0 31 ylim]);
title('real(x_{3\_all})'); xlabel('n'); ylabel('x');


%% h
n = 0:63;
figure; hold('on');
stem(n, x3);
n = 0:31;
stem(n, real(x3_2),'m^'); grid('on');
stem(n, real(x3_8),'bs'); grid('on');
stem(n, real(x3_12),'g+'); grid('on');
stem(n, real(x3_all),'r*'); grid('on');
xlabel('n'); ylabel('x');
legend('x_3', 'real(x_{3\_2})', 'real(x_{3\_8})', 'real(x_{3\_12})', 'real(x_{3\_all})')
