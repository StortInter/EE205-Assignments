close('all'); clear; clc;

%% a
b1 = [1 -2];
a1 = [1 3/2 1/2];

%% b
[r1, p1] = residue(b1, a1);
fprintf('r1 = \n'); disp(r1);
fprintf('p1 = \n'); disp(p1);


%% d
b2 = [3 10 5];
a2 = [1 7 16 12];

%% e
[r2, p2] = residue(b2, a2);
fprintf('r2 = \n'); disp(r2);
fprintf('p2 = \n'); disp(p2);


%% g
b3 = -4;
a3 = [1 0 -4];

%% h
[r3, p3, k3] = residue(b3, a3);
fprintf('r3 = \n'); disp(r3);
fprintf('p3 = \n'); disp(p3);
