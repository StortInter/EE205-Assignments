close('all'); clear; clc;

%% b - test
cal = 15;
dtfscomps = zeros(1, cal);
for i = 1:cal
    N = 2^i;
    x = 0.9 .^ (0:N-1);
    tests = 2^(cal-i);
    tic;
    for k = 1:tests
        X = dtfs(x, 0);
    end
    dtfscomps(i) = toc / tests;
end


%% c - test
fftcomps = zeros(1, cal);
for i = 1:cal
    N = 2^i;
    x = 0.9 .^ (0:N-1);
    tests = 2^(cal-i);
    tic;
    for k = 1:tests
        X = fft(x); % no need for *1/N, just a benchmark
    end
    fftcomps(i) = toc / tests;
end


%% bc - figure
figure; 
loglog(2.^(1:cal), dtfscomps); hold('on');
loglog(2.^(1:cal), fftcomps);
grid('on'); title('Time Cost');
legend('dtfs', 'fft'); xlabel('N'); ylabel('time');

%% bc - figure2
figure;
loglog(2.^(1:cal), dtfscomps ./ fftcomps);
grid('on'); title('dtfscomps / fftcomps'); xlabel('N');
