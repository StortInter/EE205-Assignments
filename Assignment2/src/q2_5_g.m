clc; clear; close('all');

n = 0:19;
delta = [1 zeros(1,19)];
h1 = filter(1, [1, -3/5], delta);
h2_f = @(n) (3/5).^(n.*(n+1)./2);
h2 = h2_f(n);

u = ones(1,20);

s1 = filter(1, [1, -3/5], u);

s2 = ones(1, 20);
for i = 1:19
    s2(i+1) = (3/5)^i * s2(i) + u(i+1);
end

z1 = conv(h1, u);
z1 = z1(1:20);
z2 = conv(h2, u);
z2 = z2(1:20);

figure;
subplot(2,1,1); hold('on');
stem(n, s1);
stem(n, z1, '*');
title('s_1 &. z_1'); grid('on');
subplot(2,1,2); hold('on');
stem(n, s2);
stem(n, z2, '*');
title('s_2 &. z_2'); grid('on');
