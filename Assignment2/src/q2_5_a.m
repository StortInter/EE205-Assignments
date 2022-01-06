clc; clear; close('all');


w_f = @(x) x - circshift(x, 1) - circshift(x, 2); % only work for this situation
x1 = [1 0 0 0 0 0];
x2 = [0 1 0 0 0 0];
x3 = [1 2 0 0 0 0];
nx = 0:5;

w1 = w_f(x1);
w2 = w_f(x2);
w3 = w_f(x3);

figure; 
subplot(4,1,1);
stem(nx, w1);
title('w_1'); grid('on');
subplot(4,1,2);
stem(nx, w2);
title('w_2'); grid('on');
subplot(4,1,3);
stem(nx, w3);
title('w_3'); grid('on');
subplot(4,1,4);
stem(nx, w1+2*w2);
title('w_1+2*w_2'); grid('on');

y1 = cos(x1);
y2 = cos(x2);
y3 = cos(x3);

figure; 
subplot(4,1,1);
stem(nx, y1);
title('y_1'); grid('on');
subplot(4,1,2);
stem(nx, y2);
title('y_2'); grid('on');
subplot(4,1,3);
stem(nx, y3);
title('y_3'); grid('on');
subplot(4,1,4);
stem(nx, y1+2*y2);
title('y_1+2*y_2'); grid('on');


z1 = nx .* x1;
z2 = nx .* x2;
z3 = nx .* x3;

figure; 
subplot(4,1,1);
stem(nx, z1);
title('z_1'); grid('on');
subplot(4,1,2);
stem(nx, z2);
title('z_2'); grid('on');
subplot(4,1,3);
stem(nx, z3);
title('z_3'); grid('on');
subplot(4,1,4);
stem(nx, z1+2*z2);
title('z_1+2*z_2'); grid('on');
