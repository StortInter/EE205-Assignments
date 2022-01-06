clc; clear; close('all');

%% 2_4_a
nx1 = 0:9;
x1 = [ones(1,5), zeros(1,5)];

nh1 = 0:4;
h1 = [1, -1, 3, 1, 0];
h2 = [2, 5, 4, -1, 0];

figure; 
subplot(3,1,1);
stem(nx1, x1);
title('x_1'); grid('on');
subplot(3,1,2);
stem(nh1, h1);
title('h_1'); grid('on');
subplot(3,1,3);
stem(nh1, h2);
title('h_2'); grid('on');


%% 2_4_b
y1 = conv(x1, h1);
y2 = conv(h1, x1);
ny = 0:13;

figure; 
subplot(2,1,1);
stem(ny, y1);
title('conv(x1, h1)'); grid('on');
subplot(2,1,2);
stem(ny, y2);
title('conv(h1, x1)'); grid('on');


%% 2_4_c
y1 = conv(x1, h1) + conv(x1, h2);
y2 = conv(x1, h1+h2);

figure; 
subplot(2,1,1);
stem(ny, y1);
title('conv(x1, h1) + conv(x1, h2)'); grid('on');
subplot(2,1,2);
stem(ny, y2);
title('conv(x1, h1+h2)'); grid('on');


%% 2_4_d
w = conv(x1, h1);
yd1 = conv(w, h2);

hs = conv(h1, h2);
yd2 = conv(x1, hs);
nyd = 0:17;

figure; 
subplot(2,1,1);
stem(nyd, yd1);
title('y_{d1}'); grid('on');
subplot(2,1,2);
stem(nyd, yd2);
title('y_{d2}'); grid('on');


%% 2_4_e
n0 = 2;

he1 = h1;
nhe1 = nh1;
delta_f = [0 0 1];
n_delta = [0 1 2];
he2 = conv(h1, delta_f); % h[n-2]=h[n]*delta[n-2]; n = 0:6

ye1 = conv(x1, he1);
nye1 = 0:13;
ye2 = conv(x1, he2);
nye2 = 0:15;

figure; 
subplot(4,1,1);
stem(nye1, ye1); axis([0 15 ylim])
title('y_{e1}=conv(x1, he1)'); grid('on');
subplot(4,1,3);
stem(nye2, ye2);
title('y_{e2}=conv(x1, he2)'); grid('on');

ye1 = conv(he1, x1);
nye1 = 0:13;
ye2 = conv(he2, x1);
nye2 = 0:15;

subplot(4,1,2);
stem(nye1, ye1); axis([0 15 ylim])
title('y_{e1}=conv(he1, x1)'); grid('on');
subplot(4,1,4);
stem(nye2, ye2);
title('y_{e2}=conv(he2, x1)'); grid('on');


%% 2_4_f
w = (nx1+1) .* x1;      % w: 0~9
hf2 = h1;               % hf2: 0~4
yf1 = conv(w, hf2);     % yf1: 0~13

d = [1 zeros(1,4)];
nd = 0:4;
hf1 = (nd+1) .* d;      % hf1: 0~4

hs = conv(hf1, hf2);    % hs: 0~8
yf2 = conv(x1, hs);     % yf2: 0~17

figure; 
subplot(2,1,1);
stem(0:13, yf1);
title('y_{f1}'); grid('on');
subplot(2,1,2);
stem(0:17, yf2);
title('y_{f2}'); grid('on');


%% 2_4_g
xg = [2 zeros(1,4)];
nd = 0:4;
yga = xg .^ 2;  % 0~4

hg2 = h2;
ygb = conv(xg, hg2); % 0~8

yg1 = [yga zeros(1,4)] + ygb;

d = [1 zeros(1,4)];
hg1 = d .^ 2;
hparallel = hg1 + hg2;
yg2 = conv(xg, hparallel);  % 0~8

figure; 
subplot(2,1,1);
stem(0:8, yg1);
title('y_{g1}'); grid('on');
subplot(2,1,2);
stem(0:8, yg2);
title('y_{g2}'); grid('on');
