function [J pdwTheta1 pdwTheta2] = costandgrad(Theta1,Theta2,input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels,X, y, lambda)


% Setup some useful variables
m = size(X, 1);         
J = 0;




A1=X;
A1=[ones(size(X)(2), 1)';X];
Z2=(Theta1')*A1;
A2=sigmoid(Z2);

A2=[ones(size(A2)(2), 1)';A2];
Z3=(Theta2')*A2;
A3=sigmoid(Z3);


J=-mean(sum((y.*log(A3))+((1-y).*log(1-A3))))+lambda*((sum(sum(Theta1.^2))+sum(sum(Theta2.^2)))-sum(Theta1(1, :).^2)-sum(Theta2(1, :).^2))/(2*m);

pdwA3=-((y./A3)-((1-y)./(1-A3)))/m;
pdwZ3=sigmoidGradient(Z3).*pdwA3;

pdwTheta2=A2*(pdwZ3');
pdwA2=Theta2*pdwZ3;

pdwA2=pdwA2(2:end,:);%shave off 1st row of pdwA2s

pdwZ2=sigmoidGradient(Z2).*pdwA2;
pdwTheta1=A1*(pdwZ2');

pdwTheta1+=lambda*Theta1/m;
pdwTheta2+=lambda*Theta2/m;

pdwTheta1(1, :)-=lambda*Theta1(1, :)/m;
pdwTheta2(1, :)-=lambda*Theta2(1, :)/m;




end