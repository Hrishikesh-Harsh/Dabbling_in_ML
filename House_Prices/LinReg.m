
%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

data = load('train.txt');
X = data(:, 2:4);
y = data(:, 5);
m = length(y);


X(:,3)=2021-X(:,3);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Plotting Data ...\n');

fprintf('Plotting Prices vs Lot Area ...\n');
plotData(X(1:100,1), y(1:100));

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Plotting Prices vs Above Grade Area ...\n');
plotData(X(1:100,2), y(1:100));

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Plotting Prices vs Age of House ...\n');
plotData(X(1:100,3), y(1:100));

fprintf('Program paused. Press enter to continue.\n');
pause;



% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = normalise(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = randInitialise(3);
[theta, J_all] = gradDesc(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_all), J_all, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
fprintf('Program paused. Press enter to continue.\n');
pause;

%================Part 3: Estimating Cost====================
% Estimate the price of a house with 9500 sq-ft lot area,
% 1700 sq-ft above grade area and 21 yrs old.
t_data= load('test.txt');
X_t= t_data(:,2:4);
X_t(:,3)=2021-X_t(:,3);
for i=1:length(X_t),
  
  price =[1, (X_t(i,1)-mu(1))/sigma(1), (X_t(i,2)-mu(2))/sigma(2), (X_t(i,3)-mu(3))/sigma(3)]*theta; % 
  fprintf('Estimated price of a house with %f sq-ft lot area, %f sq-ft above grade area and %f yrs old.\n $%.2f\n',X_t(i,1), X_t(i,2), X_t(i,3), price);
endfor

fprintf('Program paused. Press enter to continue.\n');
pause;



