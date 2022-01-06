function a = dtfs(x, x_init)
    if nargin == 1
        x_init = 0;
    end
    N = size(x, 2);
    a = 1/N * x * exp(-1i * 2*pi/N * (x_init:(x_init+N-1)).' * (0:N-1));
end
