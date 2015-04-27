% Soll grafik 1: Psi(x)
% Variablen:
%	l
%	x
%	epsilon (= 1)
%	n
%	Psi(x)
% Ausgabe in PS und PDF

% Soll grafik 2: E(n, a)
% Variablen:
%	l
%	epsilon
%	n
%	E(n, a)
% Ausgabe in PS und PDF

%-----Variabeln-----
l = 10^-9;
delta = (l/100);
%x = -l*1.5 : delta : +l*1.5;
x = -l : delta : +l;
n = 1 : 5;
%n = [1, 2];

%-----Verarbeitung-----
m = 9.10938291*10^-31;		% Elektronenmasse
h = 6062606957*10^-34;		% Planck-Konstante
hQuer = h/2*pi;
E = zeros(1, length(n));
Psi = zeros(length(n), length(x));
for ln = n
E(ln) = h^2*ln^2 / (32*m*l^2);
%k = sqrt(2*m*E/(hQuer^2));
%k = ln*pi*x / (2*l);
k = pi/l * (n+1/2);
LamdaP = 1i*k;
LamdaN = -LamdaP;
%y = (exp(LamdaP(ln)*x) + (-1)^(ln+1).*exp(LamdaN(ln)*x)) ./ (2*1i^(ln+1));
if mod(ln, 2) == 0
	y = sin(ln*pi*x/(2*l));
else
	y = cos(ln*pi*x/(2*l));
end
Psi(ln,1:length(x)) = 1/sqrt(l) .* y;
end

%-----Verarbeitung gestört-----
gamma = 0.000000000;
epsilon = 5*10^-4;
El = zeros(1, length(n));
H1 = x;
PsiG = zeros(length(n), length(x));
for ln = n
%psi1_l = H1(1:length(x)).*Psi(ln, 1:length(x)) ./ (E(ln)-El(ln));
psi1_l = 1/sqrt(l) * H1(1:length(x)).*Psi(ln, 1:length(x));
PsiG(ln, 1:length(x)) = (1+1i*epsilon*gamma).*Psi(ln, 1:length(x)) ...
						+ epsilon.*psi1_l;
%PsiG(ln, 1:length(x)) = Psi(ln, 1:length(x));
end

%-----Plot grafik 1: Psi(x)-----
clf('reset')			% clear figure
hold on;
%plot(x, )		% Potentialskasten

s = zeros(1, length(n));
for ln = n
%	subplot(length(n), 1, ln)
	plot(x, Psi(ln, 1:length(x)) +ln*1e05)		% Psi

	s(ln) = sum(Psi(ln, 1:length(x)).^2.*delta);
end

figure
hold on;

sG = zeros(1, length(n));
for ln = n
%	subplot(length(n), 1, ln)
	plot(x, PsiG(ln, 1:length(x)) +ln*2e05)		% Psi

	sG(ln) = sum(abs(PsiG(ln, 1:length(x))).^2.*delta);
end

print('grafik_1_Psi', '-depsc', '-noui')
%print('grafik_1_Psi', '-dpdf', '-noui')

%-----Plot grafik 2: E(n, a)-----
% figure
% hold on;
% for ln = n
% 	plot(x, E(ln))		% Psis
% end

%print('grafik_2_Energy', '-depsc', '-noui')
%print('grafik_2_Energy', '-dpdf', '-noui')

hold off;




