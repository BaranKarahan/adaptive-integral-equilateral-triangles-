function [result,maxSteps,relErr] = AdaptiveQuadratureRec(f,err,result,x1,x2,x3,y1,y2,y3,maxSteps)
%ADAPTATIVEQUADRATU Summary of this function goes here
%   Detailed explanation goes here

maxSteps = maxSteps +1;

interx = [x1+x2 x1+x3 x2+x3];   %Calculates
interx = interx./2;             %the intersection
intery = [y1+y2 y1+y3 y2+y3];   %points
intery = intery./2;             %


res1 = CalculateIntegral(f,x1,interx(1),interx(2),y1,intery(1),intery(2));
res2 = CalculateIntegral(f,interx(1),x2,interx(3),intery(1),y2,intery(3));
res3 = CalculateIntegral(f,interx(2),interx(3),x3,intery(2),intery(3),y3);
res4 = CalculateIntegral(f,interx(2),interx(3),interx(1),intery(2),intery(3),intery(1));
resTotal = res1 + res2 + res3 + res4;   %the sum of all approximations

relErr = abs(result - resTotal);        %difference between this step's and next step's results
recRes = [0 0 0 0 0 0 0 0 0 0 0 0];

if(abs(relErr) > err)%if so, recursively call this function
        [recRes(1),recRes(2),recRes(3)] = AdaptiveQuadratureRec(f,err/4,res1,x1,interx(1),interx(2),y1,intery(1),intery(2),maxSteps);
        [recRes(4),recRes(5),recRes(6)] = AdaptiveQuadratureRec(f,err/4,res2,interx(1),x2,interx(3),intery(1),y2,intery(3),maxSteps);
        [recRes(7),recRes(8),recRes(9)] = AdaptiveQuadratureRec(f,err/4,res3,interx(2),interx(3),x3,intery(2),intery(3),y3,maxSteps);
        [recRes(10),recRes(11),recRes(12)] = AdaptiveQuadratureRec(f,err/4,res4,interx(2),interx(3),interx(1),intery(2),intery(3),intery(1),maxSteps);
        maxSteps = max(recRes(2:3:11));                             %at the end of
        result = recRes(1) + recRes(4) + recRes(7) + recRes(10);    %the step update
        relErr = recRes(3) + recRes(6) + recRes(9) + recRes(12);    %the values
end

end

