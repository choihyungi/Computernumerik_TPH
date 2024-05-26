function [arctans, ers] = delta_arctan(xs, ns)
    % Taylorapproximation of arctan around 1
    arctans = zeros(length(xs),1);
    ers = zeros(length(xs), 1);
    for k = 1 : length(xs)
        x = xs(k);
        delta = x - 1;
        arctan = pi/4;
        comp = atan(x);
        for i = 1 : ns(k)
            arctan = arctan + nglied_taylor_arctan_nearOne(delta,i);
        end
        arctans(k) = arctan;
        ers(k) = abs(arctan - comp)/comp;
    end
end