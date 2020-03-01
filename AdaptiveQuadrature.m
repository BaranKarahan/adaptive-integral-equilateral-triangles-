function [result,finRelErr,maxPass] = AdaptiveQuadrature(h,f,err)
% Summary of this function goes here
%   Detailed explanation goes here




x1 = -(h/2);            %
x2 = x1;                %Calculates
x3 = h;                 %the points
y1 = h/2 * (sqrt(3));   %using h and
y2 = -y1;               %given shape
y3 = 0;                 %

maxSteps = 0;

integralResult = CalculateIntegral(f,x1,x2,x3,y1,y2,y3);

[result,maxPass,finRelErr] = AdaptiveQuadratureRec(f,err,integralResult,x1,x2,x3,y1,y2,y3,maxSteps);






end

