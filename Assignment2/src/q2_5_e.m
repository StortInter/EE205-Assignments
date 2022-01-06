clc; clear; close('all');

n = 0:19;
u = ones(1, 20);

s1 = filter(1, [1, -3/5], u);

s2 = ones(1, 20);
for i = 1:19
    s2(i+1) = (3/5)^i * s2(i) + u(i+1);
end

figure;
subplot(2,1,1);
stem(n, s1);
title('s_1'); grid('on');
subplot(2,1,2);
stem(n, s2);
title('s_2'); grid('on');
