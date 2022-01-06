function y = diffeqn(a,x,yn1)
    y = [yn1 zeros(1, length(x))];
    for i = 2:length(y)
        y(i) = a.*y(i-1) + x(i-1);
    end
    y = y(2:end);
