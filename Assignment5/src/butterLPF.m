function y_f = butterLPF(y, fs, order, cutoff)
    [b, a] = butter(order, cutoff/(fs/2));
    y_f = filter(b, a, y);
end
