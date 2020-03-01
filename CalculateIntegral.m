function [integralResult] = CalculateIntegral(f,x1,x2,x3,y1,y2,y3)
%approximates the integral with the given formula.
%each time finds the "h" and the center of gravity(p0) to use in formula
x0 = ( (x1 * 2) + x3) /3;
y0 = y3;


res = [f(x0,y0) f(x1,y1) f(x2,y2) f(x3,y3)];


h = 2/3 * abs(x3-x1);
h = abs(h);

restemp = 0;
restemp = restemp + ( 3 / 4 * res(1) );
    for i=2 : 4
        restemp = restemp + ( 1 / 12 * res(i) );
    end
restemp = restemp * h * h * 3 * sqrt(3) / 4;


integralResult = restemp;

end

