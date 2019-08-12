function [A3] = feedforward(Theta1,Theta2,input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X)


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