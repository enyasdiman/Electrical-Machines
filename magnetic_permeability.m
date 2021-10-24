%Variation of inductance with magnetic permeability of the core
clear
%Dimensions of the magnetic structure
Ac = 16e-4; %Cross-sectional area of the core, square meters
Ag = 16e-4; %Air gap cross-sectional area, square meters
lc = 15e-2; %Core flux path length, m
g = 4e-4; % Air gap length, m


%Relative permeability of the core 300~90.000
N = 400; %Number of turns
mu_o = 4*pi*1e-7; %Magnetic permeability of the air gap
Rg = g/(mu_o*Ag); %Reluctance of the air gap

%Variation of core reluctance and inductance with relative permittivity
for i = 1:51
	mu_r(i) = 50 + (9000-300)*(i-1)/50;
	Rc(i) = lc/(mu_r(i)*mu_o*Ac); %Reluctance of the nucleus
	R = Rg + Rc(i); %Total reluctance
	L(i) = N*N/R; %Inductance
end

subplot(2,1,1)
plot(mu_r, Rc, 'k', 'LineWidth', 1.5)
xlabel('Relative permeability of the core')
ylabel('Reluctance of the nucleus')
subplot(2,1,2)
plot(mu_r, L, 'k', 'LineWidth', 1.5)
xlabel('Relative permeability of the core')
ylabel('Inductance')
