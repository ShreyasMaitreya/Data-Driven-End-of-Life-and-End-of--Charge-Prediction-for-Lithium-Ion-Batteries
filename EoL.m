function g = sigmoid(z)
    g = 1/(1+exp(-z));
end

function[J, grad] = costFuction(theta,X,Y)
    m = length(Y); %no. of training examples
    
    grad = zeros(size(theta));
    
    h =sigmoid(X*theta);
    
    J = -(1/m)*sum(Y.*log(h)+(1-Y).*log(1-h));
    
    for i = 1 : size(theta,1)
        grad(i) = (1 / m) * sum( (h - Y) .* X(:, i) );
    end
end

function p = predict(theta, X)
    m = size(X,1);
    p = round(sigmoid(X, theta));
end

function main
scatter(X,Y)
xlabel('Cycle No')
ylabel('SOH')



[m,n] = size(X);

X = [ones(m,1) X];
initial_theta = zeros(n+1, 1)

[cost, grad] = costFunction(initial_theta,X,Y);
grad(i) = (1 / m) * sum( (h - Y) .* X(:, i) );
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, Y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == Y)) * 100);
end