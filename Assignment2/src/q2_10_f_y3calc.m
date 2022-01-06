clc; clear; close('all');

load('./lineup.mat');

i = 0;
for x = 0.7:0.01:0.8
    for y = 0:0.01:1
        b = 1;
        a = [1 zeros(1, 750) x zeros(1, 1500) y];
        z3 = filter(b, a, y3);
        i = i + 1;
        data(i, :) = [x, y, sum(abs(z3))];
    end
end

[val, pos] = min(data(:,3));
disp(data(pos,1));
disp(data(pos,2));
