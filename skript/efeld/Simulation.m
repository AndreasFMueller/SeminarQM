% Soll grafik 1: Psi(x)
% Variablen:
%  l
%  x
%  epsilon (= 1)
%  n
%  Psi(x)
% Ausgabe in PS und PDF

% Soll grafik 2: E(n, a)
% Variablen:
%  l
%  epsilon
%  n
%  E(n, a)
% Ausgabe in PS und PDF

%-----Variabeln-----
l = 10^-9;
xSteps = 225;
xSteps = 2000;
delta = (2*l/xSteps);
%x = -l*1.5 : delta : +l*1.5;
x = -l : delta : +l;
n = 1 : 200;
nPlot = 1 : 5;
kurvenVersatz = 1e5
%n = [1, 2];

if surpress == 1
	safe = 0
else
	safe = 1
end
surpress = 0;


%-----Verarbeitung-----
m = 9.10938291*10^-31;    % Elektronenmasse
h = 6062606957*10^-34;    % Planck-Konstante
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




%-----Verarbeitung gestoert-----
gamma = 0;
epsilon = 5*10^-5;
E1_k = zeros(1, length(n));
H1 = x * -1;
PsiG = zeros(length(n), length(x));

psi1_l = zeros(length(n), length(x));

parfor ln = n
  E1_k(ln) = dot(Psi(ln, :), H1.*Psi(ln, :));

  k = ln;
  for l = n % + ceil(l/2)
    if mod((l + k), 2) == 1
%      psi0_l = sum(~Psi(l, :).*H1.*Psi(k, :).*delta) / (E(k)-E(l));
      psi0_l = dot(Psi(l, :), H1.*Psi(k, :)) / (E(k)-E(l));
      psi1_l(ln, :) = psi1_l(ln, :) + psi0_l .* Psi(l, :);
    end
  end
end




%-----Plot grafik 1: Psi(x)-----
clf('reset')      % clear figure
hold on;

s = zeros(1, length(n));
for ln = nPlot    % ungestoerter Plot
  %plot(x, Psi(ln, :) + (ln-1)*2e05, 'Color', 'black')    % Psi
    plot(x, Psi(ln, :) +(ln-1)*kurvenVersatz, 'Color', 'blue')    % Psi

  s(ln) = sum(Psi(ln, :).^2.*delta);
end

% print('Psi_ungestoert', '-depsc', '-noui')
% print('Psi_ungestoert', '-dpdf', '-noui')

% figure
% hold on;

sG = zeros(1, length(n));
for ln = nPlot    % gestoerter Plot
  PsiG(ln, :) = (1+1i*epsilon*gamma).*Psi(ln, :) ...
                          + epsilon.*psi1_l(ln, :);
  %plot(x, PsiG(ln, 1:length(x)) + (ln-1)*2e05, 'Color', 'red')    % Psi
    plot(x, PsiG(ln, 1:length(x)) + (ln-1)*kurvenVersatz, 'Color', 'red')    % Psi

  sG(ln) = sum(PsiG(ln, :).^2.*delta);
end

% print('Psi_gestoert', '-depsc', '-noui')
if safe; print('Psi_gestoert', '-dpdf', '-noui'); end

%-----Plot grafik 2: E(n, a)-----
figure
hold on;
%epsilon = 3 *10^12
xEpsilon = 0 : epsilon / xSteps : epsilon;
for ln = nPlot    % Energie Plot
  plot(xEpsilon, E(ln) + xEpsilon*E1_k(ln))    % Psis
end

%print('Energie_gestoert', '-depsc', '-noui')
if safe; print('Energie_gestoert', '-dpdf', '-noui'); end

%----- Abstaende 0-Durchgang 100-ste Energie -----
figure
hold on;

nPlot = 100;
epsilon100 = 10^-3;


s = zeros(1, 2);
for ln = nPlot    % ungestoerter Plot
  %plot(x, Psi(ln, :) + (ln-1)*2e05, 'Color', 'black')    % Psi
    plot(x, Psi(ln, :) , 'Color', 'blue')    % Psi

  s(ln) = sum(Psi(ln, :).^2.*delta);
end

% print('Psi_ungestoert', '-depsc', '-noui')
% print('Psi_ungestoert', '-dpdf', '-noui')

% figure
% hold on;

%sG = zeros(1, 2);
for ln = nPlot    % gestoerter Plot
  PsiG(ln, :) = (1+1i*epsilon*gamma).*Psi(ln, :) ...
                          + epsilon100.*psi1_l(ln, :);
  %plot(x, PsiG(ln, 1:length(x)) + (ln-1)*2e05, 'Color', 'red')    % Psi
    plot(x, PsiG(ln, 1:length(x)), 'Color', 'red')    % Psi

%  sG(ln) = sum(PsiG(ln, :).^2.*delta);
end


for ln = 100
	signPsiG = sign(PsiG(ln, :));
	zeroA = x(find(signPsiG(:) == 0));
	
	zeroB = [];
	for i = 1:length(x)-1
		if (signPsiG(i)*signPsiG(i+1)) < 0
			d = (PsiG(ln, i)-PsiG(ln, i+1))/delta;
			zeroB = [zeroB, (x(i) + PsiG(ln, i)/d)];
	%		zeroB = [zeroB, x(i)];
		end
	end

	zero = unique(sort([zeroA, zeroB, -l, l]));
	
	dPsiG = 2*l/ln;
	diffZero = (diff(zero)-dPsiG).*1e+18;
end

plot(zero, 0, 'xb')
hold on;
%bar(zero(1:end-1)+dPsiG/2, diffZero, 1, 'y')
%bar(zero(2:end), diffZero, 1, 'y')
bar(zero(1:end-1)+diff(zero)/2, diffZero, 1, 'y')




axis([-l l -inf inf])

% print('Psi_gestoert', '-depsc', '-noui')
if safe; print('Psi_100_gestoert', '-dpdf', '-noui'); end




% figure
% hold on;
% 
% nPlot = 100;
% epsilon100 = 10^-3;
% 
% s = zeros(1, 2);
% for ln = nPlot    % ungestoerter Plot
%   % plot(x, Psi(ln, :) , 'Color', 'blue')    % Psi
% 
%   s(ln) = sum(Psi(ln, :).^2.*delta);
% end
% 
% 
% %sG = zeros(1, 2);
% for ln = nPlot    % gestoerter Plot
%   PsiG(ln, :) = (1+1i*epsilon*gamma).*Psi(ln, :)  + epsilon100.*psi1_l(ln, :);
%   % plot(x, PsiG(ln, 1:length(x)), 'Color', 'red')    % Psi
% 
%   % sG(ln) = sum(PsiG(ln, :).^2.*delta);
% end
% 
% % print('Psi_gestoert', '-depsc', '-noui')
% if safe; print('Psi_100_diff_gestoert', '-dpdf', '-noui'); end

%----- experimental -----
nPlot = [1, 13, 23, 42, 100];
nPlotSize = length(nPlot);
figure
hold on

%axis off;



%s = zeros(1, 2);
%sG = zeros(1, 2);
i = nPlotSize;
for ln = nPlot;    % ungestoerter Plot
  subplot(nPlotSize, 1, (i))
  plot(x, Psi(ln, :) , 'Color', 'blue')    % Psi
  s(ln) = sum(Psi(ln, :).^2.*delta);
  hold on
  
  % gestoert
  PsiG(ln, :) = (1+1i*epsilon*gamma).*Psi(ln, :) + epsilon.*psi1_l(ln, :);
  plot(x, PsiG(ln, 1:length(x)), 'Color', 'red')    % Psi
  
  ylabel(ln,'rot', 0)
  set(gca,'YTickLabel',{})
  if i < nPlotSize
  set(gca,'XTickLabel',{})
  end

%  sG(ln) = sum(PsiG(ln, :).^2.*delta);
  i = i-1;
end


if safe; print('Psi_SubPlots_gestoert', '-dpdf', '-noui'); end

hold off


