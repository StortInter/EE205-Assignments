close('all'); clear; clc;

%% load & init
f_name = 'C_01_01.wav';
[y, fs] = audioread(strcat('./assets/', f_name));
t = linspace(0, length(y)/fs, length(y));

is_save = false;
is_plot = true;

%% task-1
env_cutoff = 50;
N_pool = [1, 2, 4, 6, 8];

if is_plot
    figure;
    n = 0;
end
for N = N_pool
    x = tone_vocoder(y, fs, N, env_cutoff);
    if is_save
        audiowrite(sprintf('./results/%s_T1_TVC_%d_%d.wav', f_name, N, env_cutoff), x, fs);
    end
    if is_plot
        n = n + 1;
        subplot(length(N_pool), 1, n);
        plot(t, x); axis([0 t(end) ylim]);
%         plot((-length(y)/2:(length(y)/2-1))*(fs/length(y)), fftshift(abs(fft(x))));
        title(sprintf('T1_TVC_%d_%d', N, env_cutoff), 'Interpreter', 'none');
    end
end
error;

%% task-2
env_cutoff_pool = [20, 50, 100, 400];
N = 4;

if is_plot
    figure;
    n = 0;
end
for env_cutoff = env_cutoff_pool
    x = tone_vocoder(y, fs, N, env_cutoff);
    if is_save
        audiowrite(sprintf('./results/%s_T2_TVC_%d_%d.wav', f_name, N, env_cutoff), x, fs);
    end
    if is_plot
        n = n + 1;
        subplot(length(env_cutoff_pool), 1, n);
        plot(t, x); axis([0 t(end) ylim]);
        title(sprintf('T2_TVC_%d_%d', N, env_cutoff), 'Interpreter', 'none');
    end
end


%% ssn+y
y_ssn = ssn_gen(y, fs, -5);
if is_save
    audiowrite(sprintf('./results/%s_SSN.wav', f_name), x, fs);
end


%% task-3

env_cutoff = 50;
N_pool = [2, 4, 6, 8, 16];

if is_plot
    figure;
    n = 0;
end
for N = N_pool
    x = tone_vocoder(y_ssn, fs, N, env_cutoff);
    if is_save
        audiowrite(sprintf('./results/%s_T3_SSN_TVC_%d_%d.wav', f_name, N, env_cutoff), x, fs);
    end
    if is_plot
        n = n + 1;
        subplot(length(N_pool), 1, n);
        plot(t, x); axis([0 t(end) ylim]);
        title(sprintf('T3_SSN_TVC_%d_%d', N, env_cutoff), 'Interpreter', 'none');
    end
end


%% task-4
env_cutoff_pool = [20, 50, 100, 400];
N = 6;

if is_plot
    figure;
    n = 0;
end
for env_cutoff = env_cutoff_pool
    x = tone_vocoder(y_ssn, fs, N, env_cutoff);
    if is_save
        audiowrite(sprintf('./results/%s_T4_SSN_TVC_%d_%d.wav', f_name, N, env_cutoff), x, fs);
    end
    if is_plot
        n = n + 1;
        subplot(length(env_cutoff_pool), 1, n);
        plot(t, x); axis([0 t(end) ylim]);
        title(sprintf('T4_SSN_TVC_%d_%d', N, env_cutoff), 'Interpreter', 'none');
    end
end
