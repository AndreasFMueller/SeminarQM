global h = 6.62606957 * 10^(-34)
global hbar = h / (2 * pi)
global m = 9.10938291 * 10^(-31)
global l = 10 * 10^(-15)
global A = 390/10
global A2 = A^2
global V0 = hbar^2 * A^2 / (2 * m * l^2)

function retval = tanequation(xi)
	global A;
	#retval = zeros(1,1);
	#retval(1,1) = tan(xi(1))  - sqrt(A^2 - xi(1)^2) / xi(1);
	retval = tan(xi)  - sqrt(A^2 - xi^2) / xi;
endfunction;

function retvalue = cotequation(xi)
	global A;
	#retval = zeros(1,1);
	retvalue = -tan(xi(1))  - xi(1) / sqrt(A^2 - xi(1)^2);
endfunction;

function [xi, E, k] = symsolution(initial)
	global hbar;
	global m;
	global l;
	global V0;
	global A;
	xi = fsolve(@tanequation, initial);
	E = -V0 + hbar^2 * xi^2 / (2 * m * l^2);
	k = xi / l;
	xiprime = sqrt(A^2 - xi^2);
	printf("%10.5f,%10.5f,%10.5f,%10.5f, %f\n", xi, xi/pi, E / V0, xiprime, k);
endfunction

function [xi, E, k] = antisymsolution(initial)
	global hbar;
	global m;
	global l;
	global V0;
	xi = fsolve(@cotequation, initial);
	E = -V0 + hbar^2 * xi^2 / (2 * m * l^2);
	k = xi / l;
	printf("%10.5f,%10.5f,%10.5f, %f\n", xi, xi/pi, E / V0, k);
endfunction

printf("symmetrisch:\n");
symsolution( 0.49 * pi);
symsolution( 1.4 * pi);
symsolution( 2.4 * pi);
symsolution( 3.4 * pi);
symsolution( 4.4 * pi);
symsolution( 5.4 * pi);
symsolution( 6.4 * pi);
symsolution( 7.4 * pi);
symsolution( 8.4 * pi);
symsolution( 9.4 * pi);
symsolution(10.4 * pi);
symsolution(11.4 * pi);
symsolution(12.4 * pi);

printf("antisymmetrisch:\n");
antisymsolution( 1.1 * pi);
antisymsolution( 2.1 * pi);
antisymsolution( 3.1 * pi);
antisymsolution( 4.1 * pi);
antisymsolution( 5.1 * pi);
antisymsolution( 6.1 * pi);
antisymsolution( 7.1 * pi);
antisymsolution( 8.1 * pi);
antisymsolution( 9.1 * pi);
antisymsolution(10.1 * pi);
antisymsolution(11.1 * pi);
antisymsolution(12.1 * pi);
antisymsolution(13.1 * pi);

