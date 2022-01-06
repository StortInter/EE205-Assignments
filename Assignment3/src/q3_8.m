close('all'); clear; clc;

%% a
a1 = [1 -0.8]; b1 = 1;
a2 = [1 0.8]; b2 = 1;


%% b
n = 1024;
[h1, w1] = freqz(b1, a1, n, 'whole');
[h2, w2] = freqz(b2, a2, n, 'whole');

subplot(2,1,1);
plot(w1, abs(h1)); grid('on');
set(gca,'xlim',[0,2.*pi], 'xtick',0:pi/2:2*pi, 'XTickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi'});
title('Frequency Response of System 1'); xlabel('\omega'); ylabel('amplitude');
subplot(2,1,2);
plot(w2, abs(h2)); grid('on');
set(gca,'xlim',[0,2.*pi], 'xtick',0:pi/2:2*pi, 'XTickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi'});
title('Frequency Response of System 2'); xlabel('\omega'); ylabel('amplitude');

%% c
k = 0:19;
a_x = [0 3/4 zeros(1,7) -1/2 0 -1/2 zeros(1,7) 3/4];

figure;
stem(k, a_x); grid('on'); axis([0 19 ylim]);
title('a_k'); xlabel('\omega_k=(2\pi/20)k'); ylabel('a')


%% d
x_20 = 20 * ifft(a_x);
x = repmat(x_20, 1, 6);
n = -20:99;

figure;
stem(n, x); grid('on');
xlabel('n'); ylabel('x');


%% e
y1 = filter(b1, a1, x);
y2 = filter(b2, a2, x);

figure;
subplot(2,1,1);
stem(n, y1); grid('on'); axis([0 99 ylim]);
title('y_1'); xlabel('n'); ylabel('y');
subplot(2,1,2);
stem(n, y2); grid('on'); axis([0 99 ylim]);
title('y_2'); xlabel('n'); ylabel('y');


%% f
n = 0:19;
y1_20 = y1(20:39);
y2_20 = y2(20:39);
a_y1 = 1/20 * fft(y1_20);
a_y2 = 1/20 * fft(y2_20);

figure;
subplot(2,1,1);
stem(n, abs(a_y1)); grid('on'); axis([0 19 ylim]);
title('a_y_1'); xlabel('\omega_k=(2\pi/20)k'); ylabel('a');
subplot(2,1,2);
stem(n, abs(a_y2)); grid('on'); axis([0 19 ylim]);
title('a_y_2'); xlabel('\omega_k=(2\pi/20)k'); ylabel('a');
