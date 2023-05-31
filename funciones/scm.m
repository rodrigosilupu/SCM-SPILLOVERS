function [a_hat,b_hat] = scm(Y)
%SCM Calculating synthetic control weights and an intercept.
% Input Y is N by T matrix, where each row is a pre-treatment time series.
% The first row is the only treated unit. Other rows are control units. 

[N,T] = size(Y);

Y_treated = Y(1,:)';
Y_untreated = Y(2:end,:)';

Y_demeaned = Y_treated-mean(Y_treated);
X_demeaned = Y_untreated-repmat(mean(Y_untreated),T,1);

b_initial = ones(N-1,1)/(N-1);
Q = @(b)sum((Y_demeaned-X_demeaned*b).^2); % criterion

% constraints
A_eq = ones(1,N-1);
B_eq = 1;
LB = zeros(N-1,1);

options = optimoptions('fmincon','Display','none');
b_hat = fmincon(Q,b_initial,[],[],A_eq,B_eq,LB,[],[],options);

a_hat = mean(Y_treated)-mean(Y_untreated)*b_hat;
b_hat = [0;b_hat];