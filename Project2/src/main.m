close('all'); clear(); clc();

%% data def
load matlab.mat
N = 32;
CP = 3;
T = 1e-6;
w_c = 100e6;
fs = 1e9;
cutoff = -1;

% x = rand(1, N);



%% OFDM
y = OFDM(x, CP, T, w_c, fs, cutoff, true, 1, false);
