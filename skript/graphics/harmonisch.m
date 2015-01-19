#
# harmonisch.m -- 
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

s = zeros(401,11);

N = zeros(10);

for n = 1:10
	N(n) = 2^n * sqrt(factorial(n) / factorial(2 * n))
endfor;

for i = (-200:200)
	x = i * 0.1
	s(201 + i, 1) = x;
	for n = 1:10
		s(201 + i, 1 + n) = N(n) * hermitepoly(n, x) * exp(-(x / 2)^2);
	endfor;
endfor

s


