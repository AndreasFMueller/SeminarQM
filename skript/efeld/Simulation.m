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
xSteps = 100;
delta = (l/xSteps);
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
gamma = 0;
epsilon = 4*10^3;
E1_k = zeros(1, length(n));
H1 = x;
PsiG = zeros(length(n), length(x));

% for ln = n
% 	psi1_l = zeros(1, length(x));
% 
% 	E1_k(ln) = sum(~Psi(ln, :).*H1.*Psi(ln, :).*delta);
% 
% 	loopCount = 0;
% 	k = ln;
% 	if k > 1
% 		for l = 1 : ln - 1
% 			psi1_l = psi1_l + Psi(l, :).*H1.*Psi(k, :) ./ (E(k)-E(l));
% 				loopCount = loopCount + 1;
% 		end
% 	else
% 		psi1_l = psi1_l + Psi(k, :).*H1.*Psi(k, :) ./ (E(k));
% 			loopCount = loopCount + 1;
% 	end
% end

loopCount = 0;
for ln = n
	E1_k(ln) = sum(~Psi(ln, :).*H1.*Psi(ln, :).*delta);
	
	psi1_l = zeros(1, length(x));

	k = ln;
	if k > 1
		for l = 1 : k - 1
%			psi0_l = sum(~Psi(l, :).*H1.*Psi(k, :).*delta) / (E(k)-E(l));
			psi0_l = dot(Psi(l, :), H1.*Psi(k, :)) / (E(k)-E(l));
			psi1_l = psi1_l + psi0_l .* Psi(l, :);
			loopCount = loopCount + 1;
		end
	else
		psi0_l = sum(~Psi(1, :).*H1.*Psi(1, :).*delta) / (E(1)-0);
		psi1_l = psi0_l .* Psi(1, :);
		loopCount = loopCount + 1;
	end
	
	figure
	hold on;
	plot(x, psi1_l(:), 'Color', 'green')
	
	PsiG(ln, 1:length(x)) = (1+1i*epsilon*gamma).*Psi(ln, 1:length(x)) ...
													+ epsilon.*psi1_l;
end


%-----Plot grafik 1: Psi(x)-----
%clf('reset')			% clear figure
hold on;

s = zeros(1, length(n));
for ln = n		% ungestoerter Plot
	plot(x, Psi(ln, :) + (ln-1)*2e05, 'Color', 'black')		% Psi

	s(ln) = sum(Psi(ln, :).^2.*delta);
end

% print('Psi_ungestoert', '-depsc', '-noui')
% print('Psi_ungestoert', '-dpdf', '-noui')

% figure
% hold on;

sG = zeros(1, length(n));
for ln = n		% gestoerter Plot
	plot(x, PsiG(ln, 1:length(x)) + (ln-1)*2e05, 'Color', 'red')		% Psi

	sG(ln) = sum(PsiG(ln, :).^2.*delta);
end

% print('Psi_gestoert', '-depsc', '-noui')
% print('Psi_gestoert', '-dpdf', '-noui')

%-----Plot grafik 2: E(n, a)-----
figure
hold on;
xEpsilon = 0 : epsilon / xSteps : epsilon;
for ln = n		% Energie Plot
	plot(xEpsilon, E(ln) + xEpsilon*E1_k(ln))		% Psis
end

%print('grafik_2_Energy', '-depsc', '-noui')
%print('grafik_2_Energy', '-dpdf', '-noui')

hold off




