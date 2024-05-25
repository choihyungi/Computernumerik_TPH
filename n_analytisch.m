function ns = n_analytisch(xs)
    % n analytisch
    % |arctan(x) - taylorreihe(arctan(x))| <= x^(2n+3)/(2n+3)
    ns = zeros(length(xs),1);
    for k = 1 :  length(xs)
        o = xs(k);
        if abs(o) <= 1
            x = abs(o);
        else
            x = abs(1/o);
        end
        n = log(100*eps/(1+x^2)) / (2*log(x)) - 1;
        ns(k) = fix(n);
    end
end