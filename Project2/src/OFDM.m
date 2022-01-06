function y = OFDM(x, CP, T, w_c, fs, cutoff, isFig, pilot, useH)
    if nargin == 0
        close('all');
        x = rand(1, 32); CP = 16; T = 1e-6; w_c = 100e6; fs = 1e9;
        cutoff=0.02; isFig=true; pilot = 1; useH = false;
    elseif nargin == 5
        cutoff=0.02; isFig=true; pilot = 0; useH = false;
    end

    %% iFFT / iDFT
    X = ifft(x);
    
    %% add CP
    X_CP = [X(end-CP+1:end) X];
    
    if useH
        h_n = [0.5 0.2 0.375 0.475];
        X_r_adc = conv(X_CP, h_n);
    else
        %% DAC
        X_c = reshape(repmat(X_CP, T*fs, 1), 1, []);
        t_X_c = linspace(0, length(X_c)/fs - 1/fs, length(X_c));    % non-integer end
        
        %% modulation
        X_cos = real(X_c) .* cos(w_c*t_X_c);
        X_sin = imag(X_c) .* sin(w_c*t_X_c);
        X_m = X_cos + X_sin;
        
        %% transfer
        h_n = [0.5 zeros(1, 1.5*T*fs-1) 0.4 zeros(1, 1*T*fs-1) 0.35 zeros(1, 0.5*T*fs-1) 0.3];
        X_t = conv(X_m, h_n);
        t_X_t = linspace(0, length(X_t)/fs - 1/fs, length(X_t));
        
        %% demodulation
        if cutoff < 0
            X_r_d = 2 * iLPF(X_t .* cos(w_c*t_X_t), -cutoff) + 2j * iLPF(X_t .* sin(w_c*t_X_t), -cutoff);
        else
            [b, a] = butter(5, cutoff, 'low');
            X_r_d = 2 * filter(b, a, X_t .* cos(w_c*t_X_t)) + 2j * filter(b, a, X_t .* sin(w_c*t_X_t));
        end


        %% ADC
        X_r_adc = mean(reshape(X_r_d, T*fs, length(X_r_d)/T/fs));
    end
    
    %% remove CP
    X_rCP = X_r_adc((CP+1):(CP+length(x)));
    
    %% FFT / DFT
    y = abs(fft(X_rCP));

    if pilot == 0
        return
    end

    %% calc H
    if pilot == 1
        pilot = ones(1, length(x));
    elseif pilot == 2
        pilot = randn(1, length(x));
    end

    pilot_OFDM = OFDM(pilot, CP, T, w_c, fs, cutoff, false, 0, useH);
    H_k = pilot ./ pilot_OFDM / length(pilot);

    %% de-gain
    y = y .* H_k .* length(y);


    %% figures
    if isFig
        figure; hold('on');
        stem(0:(length(x)-1), x);
        axis([-1 length(x) ylim]); grid('on'); xlabel('n');
        title('signal');

        figure; hold('on');
        stem(0:(length(X_CP)-1), real(X_CP)); stem(0:(length(X_CP)-1), imag(X_CP));
        axis([-1 length(X_CP) ylim]); grid('on');
        line([CP-0.5, CP-0.5], [100, -100], 'Color', 'magenta');
        xlabel('n'); ylabel('x[n]');
        legend('real', 'image'); title('Add CP');

        if useH
            figure;
            stem(0:(length(h_n)-1), h_n);
            axis([-0.25 length(h_n)-0.25 ylim]); grid('on');
            xlabel('n'); ylabel('h[n]');
            title('h');
        else
            figure;
            plot(t_X_c, real(X_c), t_X_c, imag(X_c));
            axis([0 t_X_c(end) ylim]); grid('on');
            xlabel('t (s)'); ylabel('X[n]');
            legend('real', 'image'); title('DAC');
    
            figure; hold('on');
            plot(t_X_c, X_cos, t_X_c, X_sin);
            axis([0 t_X_c(end) ylim]); grid('on');
            xlabel('t (s)'); ylabel('X(t)');
            legend('x\_cos', 'x\_sin'); title('modulation');

            figure; hold('on');
            plot(t_X_c, X_m);
            axis([0 t_X_c(end) ylim]); grid('on');
            xlabel('t (s)'); ylabel('X(t)');
            title('summation');
    
            figure;
            plot(linspace(0, 3*T, 3*T*fs+1), h_n, 'r');
            axis([0 3*T ylim]); grid('on');
            xlabel('t (s)');  ylabel('h(t)')
            title('Channel');
    
            figure;
            plot(t_X_t, X_t);
            axis([0 t_X_t(end) ylim]); grid('on');
            xlabel('t (s)');  ylabel('X(t)');
            title('transfer');
    
            figure;
            plot(t_X_t, real(X_r_d), t_X_t, imag(X_r_d));
            axis([0 t_X_t(end) ylim]); grid('on');
            xlabel('t (s)'); ylabel('X(t)');
            legend('real', 'image'); title('demodulation');
    
            figure; hold('on');
            stem(0:(length(X_r_adc)-1), real(X_r_adc)); stem(0:(length(X_r_adc)-1), imag(X_r_adc));
            axis([-1 length(X_r_adc) ylim]); grid('on');
            xlabel('n'); ylabel('X[n]');
            legend('real', 'image'); title('ADC');
        end

        figure; hold('on');
        stem(0:(length(X_rCP)-1), real(X_rCP)); stem(0:(length(X_rCP)-1), imag(X_rCP));
        axis([-1 length(X_rCP) ylim]); grid('on');
        xlabel('n'); ylabel('X(t)');
        legend('real', 'image'); title('remove CP');

        figure;
        stem(0:(length(H_k)-1), H_k);
        axis([-1 length(H_k) ylim]); grid('on');
        xlabel('k'); ylabel('H[k]');
        title('H');

        figure; hold('on');
        diff =  norm(x - y) .^ 2;
        stem(0:(length(x)-1), x); stem(0:(length(y)-1), y, '*');
        axis([-1 length(x) ylim]); grid('on'); xlabel('n');
        grid('on'); legend('x', 'y'); xlabel('n');
        title(sprintf('Variance = %d', diff));

        y = {y, diff};
    end
end

