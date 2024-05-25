clear variables;
close all;

%-----------------------------
% x Values
%-----------------------------
% Parameters
kmax = 18;
xmin = 0;
xmax = 1;

xs = xvalues(xmax, kmax);
%xs = linspace(xmin, xmax, kmax);

%-----------------------------
% minimum n Values to each x
%----------------------------
%ns_num = n_numerisch(xs);
ns_ana = n_analytisch(xs);

ns = ns_ana;
disp('ns ok')

% plot necessary n-terms
figure;
hold on;
plot(xs, ns, 'DisplayName', 'n-terms');
title('necessary n-terms for relative error < 100 eps');
xlabel('x');
ylabel('n');
legend;
hold off;

%-----------------------------
% Taylorsequence around 0
%-----------------------------
% normal direction
[arctans0, ers0] = taylor_arctan(xs, ns);
% reverse direction
[rev_arctans0, rev_ers0] = reversetaylor_arctan(xs, ns);

%plot relative Error
figure
hold on;
idx_strt = 1;
idx_end = fix(kmax*0.9);
plot(xs(idx_strt:idx_end), ers0(idx_strt:idx_end), 'DisplayName', 'normal direction');
plot(xs(idx_strt:idx_end), rev_ers0(idx_strt:idx_end), 'DisplayName', 'reverse direction');

title('relative error of Taylorapproximation(0) of ArcTan')
xlabel('x');
ylabel('relative error');
legend;
hold off;

%-----------------------------
% Taylorapprox around 1
%-----------------------------
% Delta Approx 
[arctans1, ers1] = delta_arctan(xs, ns);
% reverse Delta Approx
[rev_arctans1, rev_ers1] = reversedelta_arctan(xs, ns);

%plot relative Error to arctan(x)
figure
hold on;
idx_strt = fix(kmax*0.7);
idx_end = kmax;
plot(xs(idx_strt:idx_end), ers1(idx_strt:idx_end), 'DisplayName', 'normal direction')
plot(xs(idx_strt:idx_end), rev_ers1(idx_strt:idx_end), 'DisplayName', 'reverse direction')

title('relative error of Taylorapproximation(1) of ArcTan');
xlabel('x');
ylabel('relative error');
legend;
hold off;

%-----------------------------
% selective Taylorapprox
%-----------------------------
[arctans3,ers3] = fulltaylor_arctan(xs, ns);

%-----------------------------
% Lagrangeapprox
%-----------------------------
refmin = 0;
refmax = 1;
refpts = 300;
refs1 = linspace(refmin, refmax, refpts);
refs2 = chebishevnodes(refpts);

%[arctans4, ers4] = lagrangeapprox(xs, refs1);
[arctans5, ers5] = lagrangeapprox(xs, refs2);

figure
hold on;
idx_strt = 1;
idx_end = kmax;

plot(xs(idx_strt:idx_end), ers3(idx_strt:idx_end), "DisplayName", 'selective Taylorapproximation')
%plot(xs(idx_strt:idx_end), ers4(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation equidistant ref points')
plot(xs(idx_strt:idx_end), ers5(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation Chebishev ref points')

title('relative error of different Approximations of arctan');
xlabel('x');
ylabel('relative error');
legend;
hold off;

figure
hold on;
idx_strt = 1;
idx_end = kmax;

plot(xs(idx_strt:idx_end), arctans3(idx_strt:idx_end), "DisplayName", 'selective Taylorapproximation')
%plot(xs(idx_strt:idx_end), arctans4(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation equidistant ref points')
plot(xs(idx_strt:idx_end), arctans5(idx_strt:idx_end), "DisplayName", 'Lagrangeapproximation Chebishev ref points')
title('arctan of different Approximations');
xlabel('x');
ylabel('arctan');
legend;
hold off;