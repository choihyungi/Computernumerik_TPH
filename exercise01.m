clear all;
close all;

% Parameters
kmax = 17;
xmin = 0.0;
xmax = 1;

% basic Values
xs = xvalues(xmax, kmax);
disp(xs);
ns_num = n_numerisch(xs);
disp("ns_num, ok");
ns_ana = n_analytisch(xs);
disp("ns_ana, ok");

% Taylor with given n values
[arctans_num, ers_num] = taylor_arctan(xs, ns_num);
[arctans_ana, ers_ana] = taylor_arctan(xs, ns_ana);
% Taylor reverse
[rev_arctans_num, rev_ers_num] = reversetaylor_arctan(xs, ns_num);
[rev_arctans_ana, rev_ers_ana] = reversetaylor_arctan(xs, ns_ana);

% Delta Näherung
[arctans_delta, ers_delta] = arctan_delta(xs, ns_num);

figure;
plot(xs, arctans_num, 'DisplayName', 'Arctan(x) via Taylor numerisch');
hold on;
plot(xs, arctans_ana, 'DisplayName', 'Arctan(x) via Taylor analytisch');
plot(xs, rev_arctans_num, 'DisplayName', 'Arctan(x) via reverse Taylor numerisch');
plot(xs, rev_arctans_ana, 'DisplayName', 'Arctan(x) via reverse Taylor analytisch');
plot(xs, arctans_delta, 'DisplayName', 'rel. Error via Taylor around 1');
lgd = legend;
hold off;

figure
plot(xs, ers_num, 'DisplayName', 'rel. Error via Taylor numerisch')
hold on;
plot(xs, ers_ana, 'DisplayName', 'rel. Error via Taylor analytisch')
plot(xs, rev_ers_num, 'DisplayName', 'rel. Error via reverse Taylor numerisch')
plot(xs, rev_ers_ana, 'DisplayName', 'rel. Error via reverse Taylor analytisch')
plot(xs, ers_delta, 'DisplayName', 'rel. Error via Taylor(1)')
lgd = legend;
hold off;