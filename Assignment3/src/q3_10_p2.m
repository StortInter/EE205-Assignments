close('all'); clear; clc;

%% e
N = 40;
n = 0:(N-1);
x = 0.9 .^ n;
h = 0.5 .^ n;
x_h = conv([x x], h);
y = x_h((N+1):2*N);

figure; hold('on');
stem(n, x); stem(n, h, 'bs'); stem(n, y, 'r*');
grid('on'); legend('x', 'h', 'y'); title('N=40'); xlabel('n');


%% g
fft_x = fft(x);
fft_h = fft(h);
fft_y = fft_x .* fft_h;
y_ifft = ifft(fft_y);

figure; hold('on');
stem(n, y); stem(n, y_ifft, 'r*');
grid('on'); legend('y_conv', 'y_ifft'); title('N=40'); xlabel('n');


%% f
N = 80;
n = 0:(N-1);
x = 0.9 .^ n;
h = 0.5 .^ n;
x_h = conv([x x], h);
y = x_h((N+1):2*N);

figure; hold('on');
stem(n, x); stem(n, h, 'bs'); stem(n, y, 'r*');
grid('on'); legend('x', 'h', 'y'); title('N=80'); xlabel('n');


%% h
fft_x = fft(x);
fft_h = fft(h);
fft_y = fft_x .* fft_h;
y_ifft = ifft(fft_y);

figure; hold('on');
stem(n, y); stem(n, y_ifft, 'r*');
grid('on'); legend('y_conv', 'y_ifft'); title('N=80'); xlabel('n');
