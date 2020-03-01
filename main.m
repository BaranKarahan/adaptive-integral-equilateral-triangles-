

h = 5;                      %height input
%f = @(x,y) 1;
%f = @(x,y) y;
%f = @(x,y) x;
%f = @(x,y) 20*x -3*y;
f = @(x,y) (x/2)*2+(y/2)*2-5;
%f = @(x,y) sin(x)*cos(y);
%f = @(x,y) (x/3)^3*(y/2)^2+x*y;
%f = @(x,y) exp(sin(x))+cos(y);

%f = @(x,y) sin(x)*2^y;
            %function input
%f = @(x,y)  sin(x)*y^2;
err = 10^-5;                %stopping error criteria input


[result,finalRelativeError,maxStep] = AdaptiveQuadrature(h,f,err);












