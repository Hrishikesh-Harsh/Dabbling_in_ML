function [theta, J_all] = gradDesc(X, y, theta, alpha, num_iters)

J_all = zeros(num_iters, 1);
m= length(y);

for i = 1:num_iters

    theta=theta - (alpha/m)*(((X*theta-y)'*X)');

    J_all(i) = cost(X, y, theta);

end

end
