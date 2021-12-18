function [X_norm, mu, sigma] = normalise(X)

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

for i=1:size(X,2),
  mu(i)=mean(X(:, i));
  sigma(i)=std(X(:, i));
end;
X_norm=X_norm-mu;

for i=1:size(X,2),
  N=X_norm(:, i)/sigma(i);
  X_norm(:, i)=N;
 end;

% ============================================================

end
