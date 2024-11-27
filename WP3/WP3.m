clear all
close all
clc
%% SISTEMA LINEARIZZATO INTORNO A (pi,0)
A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;
%% PASSIAMO ALL'OSSERVATORE (WP3)

% Innanzitutto verifichiamo l'osservabilità
Wo = [C;C*A];
rank(Wo);

% Il rango è 2, di conseguenza il sistema è osservabile
K =  [92.0469   14.4179];

P = eig(A - B * K);
% Nel caso preso di esempio, i poli a ciclo chiuso del sistema sono
% posizionati in:
% P = [-7.2589 + 5.4355i, -7.2589 - 5.4355i]


% Scegliamo poli a ciclo chiuso dell'osservatore che convergano più
% velocemente del sistema a ciclo chiuso

P_obs = [-800 -900];
L = place(A.',C.',P_obs);
L=L.';



simOut = sim("simulation_control_observerLQR_NL_WP3.slx", 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults_LQR(simOut,1);

%{ ANALISI DEI RISULTATI

%}

%% Digressione sulla velocità del sistema basandosi su equipollanza piuttosto che ordine di grandezza dei poli

syms l1 l2
L = [l1; l2]
As = A-L*C
poly(As)
zita = 0.9
w = 29
l1 = w*zita*w-0.1
l2 = w^2+9.81-l1/10