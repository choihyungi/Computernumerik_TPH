function ns = n_numerisch(xs)
    % pure Verfahrensfehler
    % Rechenfehler ignoriert
    ns = zeros(length(xs), 1);
    for k = 1 : length(xs)
        res = 1;
        o = xs(k);
        if abs(o)<=1
            x = abs(o);
        else
            x = abs(1/o);
        end
        n = -1;
        real = atan(x);
        if real == 0
            n = 0;
        else
            while res > 100*eps
                n = n+1;
                res = (x^(2*n+3)/(2*n+3))/real;
            end
        end
        ns(k) = n;
    end
end