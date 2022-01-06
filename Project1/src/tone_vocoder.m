function x = tone_vocoder(y, fs, N, env_cutoff, butter_order, f0, f1)
    switch nargin
        case 2
            N = 64; env_cutoff = 100; butter_order = 4; f0 = 200; f1 = 7000;
        case 3
            env_cutoff = 100; butter_order = 4;  f0 = 200; f1 = 7000;
        case 4
            butter_order = 4; f0 = 200; f1 = 7000;
        case 5
            f0 = 200; f1 = 7000;
        case 7
        otherwise
            error('Wrong nargins');
    end
    if size(y, 1) < size(y, 2)
        y = y.';
    end
    if size(y, 2) ~= 1
        y = sum(y, 2);
    end
    
    f2d = @(f) log10(f/165.4 + 1) / 0.06;
    d2f = @(d) 165.4 * (10.^(0.06*d) - 1);

    d_range = linspace(f2d(f0), f2d(f1), N+1);
    f_range_l = d2f(d_range);
    f_range = [f_range_l(1:end-1); f_range_l(2:end)].';
    f_mid = diff(f_range_l)/2 +f_range_l(1:end-1);
    
    x = zeros(size(y));
    [LPF_b, LPF_a] = butter(butter_order, env_cutoff/(fs/2));
    t = linspace(0, length(y)/fs, length(y));
    for i = 1:length(f_mid)
         [BPF_b, BPF_a] = butter(butter_order, f_range(i,:)/(fs/2));
         x = x + sin(2*pi*f_mid(i)*t).' .* filter(LPF_b, LPF_a, abs(filter(BPF_b, BPF_a, y)));
    end

    x = x / norm(x) * norm(y);
end
