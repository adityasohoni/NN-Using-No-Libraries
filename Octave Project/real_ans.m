function r = real_ans(x1,y1,x2,y2)
  if x1==x2
    r=[1;0;0;0];
  elseif ((x2-x1)*(y2-y1))>0
    r=[0;1;0;0];  
  elseif y1==y2
    r=[0;0;1;0];
  elseif ((x2-x1)*(y2-y1))<0
    r=[0;0;0;1];
end