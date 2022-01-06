function x = ssn_gen(y, fs, SNR)
    switch nargin
        case 2
            SNR = -5;
        case 3
        otherwise
            error('Wrong nargins');
    end
    if size(y, 1) < size(y, 2)
        y = y.';
    end
    if size(y, 2) ~= 1
        y = sum(y, 2);
    end
    
    [pxx, w] = periodogram(repmat(y, 10, 1), [], 512, fs);
    SSN = filter(fir2(3000, w/(fs/2), sqrt(pxx/max(pxx))), 1, 1 - 2*rand(1, length(y))).';
    x = 10^(SNR/20)*norm(SSN)/norm(y) * y + SSN;
    x = x / norm(x) * norm(y);
end
