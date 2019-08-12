epsilon_init = 0.12;
n1=100;
n2=30;
n3=4;
theta1 = rand(n1+1,n2) * 2 * epsilon_init - epsilon_init;
theta2 = rand(n2+1,n3) * 2 * epsilon_init - epsilon_init;
m=5000;
X=zeros(100,m);
y=zeros(4,m);
for i=1:m
  x1=abs(ceil(rand(1)*10));
  
  x2=abs(ceil(rand(1)*10));
  y1=abs(ceil(rand(1)*10));
  y2=abs(ceil(rand(1)*10));
  if(x1==x2 && y1==y2)
   i--;
   continue;
  endif
  X(10*(x1-1)+y1,i)=1;
  X(10*(x2-1)+y2,i)=1;
  y(:,i)=real_ans(x1,y1,x2,y2);
endfor

%gradient descent
eta=0.05;
for i=1:1000
  [J pdwTheta1 pdwTheta2] = costandgrad(theta1,theta2,n1, ...
                                   n2, ...
                                   n3,X, y, 0);
  theta1-=eta*pdwTheta1;
  theta2-=eta*pdwTheta2;
endfor
X=zeros(100,1);
y=zeros(4,1);
while(1)
 X=zeros(100,1);
 y=zeros(4,1);
 fprintf('Do u want to continue ...\n'); 
 fprintf('enter x1,y1,x2,y2 ...\n');
 x1 = input ("Enter x1");
 y1 = input ("Enter y1");
 x2 = input ("Enter x2");
 y2 = input ("Enter y2");

 X(10*(x1-1)+y1,1)=1;
 X(10*(x2-1)+y2,1)=1;
 y=real_ans(x1,y1,x2,y2)
 A3 = feedforward(theta1,theta2,n1, ...
                                   n2, ...
                                   n3, ...
                                   X)
 
  
 
 
endwhile


