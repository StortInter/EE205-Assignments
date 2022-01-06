function y = diffeqn2(a,x,yn1)
    m = fliplr(diag((a .^ (0:length(x))))*triu(ones(length(x)+1))).';
    n = diag([yn1 x])*triu(ones(length(x)+1));
    y = sum(diag([yn1 x])*triu(ones(length(x)+1)) .* triu(flip(diag((a .^ (length(x):-1:0)))*ones(length(x)+1))));
    y = y(2:end);