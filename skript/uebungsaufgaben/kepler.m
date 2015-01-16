#
# kepler.m -- solving keplers equation using a perturbation approach
#

function retval = Estoerung(e, M)
	E = M * (1 + e + e^2 + e^3) + (M - M^3) * e^4;
	retval = E;
endfunction;

function retval = Eexakt(e, M)
	E = M;
	for i = 1:20
		E = M + e * sin(E);
	endfor;
	retval = E;
endfunction;

e = 0.01671123;
M = 0.3

S = zeros(21, 3);
for i = 0:20
	e = i * 0.005;
	S(i+1, 1) = e;
	S(i+1, 2) = Eexakt(e, M);
	S(i+1, 3) = Estoerung(e, M);
endfor

plot(S(:,1), S(:,2), '-', S(:,1), S(:,3), '.')
xlabel('e');
ylabel('E (radians)');
title('Loesung der Keplergleichung in Abhaengigkeit von der Exzentrizitaet');
legend('exakte Loesung', 'Stoerungsloesung');
print -deps kepler.eps
