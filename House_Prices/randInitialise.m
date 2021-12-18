function W = randInitialise(features)
W = zeros(features+1,1);
epsilon = 0.12;
W = rand(features+1,1) * 2 * epsilon - epsilon;

% =========================================================================

end