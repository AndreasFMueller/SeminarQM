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
xSteps = 225;
delta = (l/xSteps);
%x = -l*1.5 : delta : +l*1.5;
x = -l : delta : +l;
n = 1 : 200;
nPlot = 1 : 5;
kurvenVersatz = 1e5
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
gamma = 0;
epsilon = 5* 10^-4;
E1_k = zeros(1, length(n));
H1 = x;
PsiG = zeros(length(n), length(x));

loopCount = 0;
for ln = n
	E1_k(ln) = dot(Psi(ln, :), H1.*Psi(ln, :));
	
	psi1_l = zeros(1, length(x));

	k = ln;
	for l = n % + ceil(l/2)
		if l ~= k
%			psi0_l = sum(~Psi(l, :).*H1.*Psi(k, :).*delta) / (E(k)-E(l));
			psi0_l = dot(Psi(l, :), H1.*Psi(k, :)) / (E(k)-E(l));
			psi1_l = psi1_l + psi0_l .* Psi(l, :);
			loopCount = loopCount + 1;
		end
	end
	
	PsiG(ln, 1:length(x)) = (1+1i*epsilon*gamma).*Psi(ln, 1:length(x)) ...
													+ epsilon.*psi1_l;
end

%-----Plot grafik 1: Psi(x)-----
clf('reset')			% clear figure
hold on;

s = zeros(1, length(n));
for ln = nPlot		% ungestoerter Plot
	%plot(x, Psi(ln, :) + (ln-1)*2e05, 'Color', 'black')		% Psi
    plot(x, Psi(ln, :) +(ln-1)*kurvenVersatz, 'Color', 'black')		% Psi

	s(ln) = sum(Psi(ln, :).^2.*delta);
end

% print('Psi_ungestoert', '-depsc', '-noui')
% print('Psi_ungestoert', '-dpdf', '-noui')

% figure
% hold on;

sG = zeros(1, length(n));
for ln = nPlot		% gestoerter Plot
	%plot(x, PsiG(ln, 1:length(x)) + (ln-1)*2e05, 'Color', 'red')		% Psi
    plot(x, PsiG(ln, 1:length(x)) + (ln-1)*kurvenVersatz, 'Color', 'red')		% Psi

	sG(ln) = sum(PsiG(ln, :).^2.*delta);
end

% print('Psi_gestoert', '-depsc', '-noui')
print('Psi_gestoert', '-dpdf', '-noui')

%-----Plot grafik 2: E(n, a)-----
figure
hold on;
epsilon = 3 *10^12
xEpsilon = 0 : epsilon / xSteps : epsilon;
for ln = nPlot		% Energie Plot
	plot(xEpsilon, E(ln) + xEpsilon*E1_k(ln))		% Psis
end

%print('Energie_gestoert', '-depsc', '-noui')
print('Energie_gestoert', '-dpdf', '-noui')

hold off




