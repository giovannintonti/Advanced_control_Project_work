clear all
close all
clc

%% Progettiamo un controllore migliore del precedente, considerando la linearizzazione del sistema intorno al punto di equilibrio (pi,0)
A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;
%matrice di raggiungibilità
W_R=[B A*B];
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_R)
% Il sistema è raggiungibile


%% POLE PLACEMENT DEFINENDO I POLI ARBITRARIAMENTE
%caso reale umax= 300
p=[-8 -10] % posizione desiderata dei poli 
%caso estremo umax = +inf
%p= [-100 -200]
% Proviamo pazziando noi i poli a ciclo chiuso
K=place(A,B,p)
kr=-1/(C*inv(A-B*K)*B)
%% TEST LINEARE
close all
rl = 0
simOut = sim('simulation_poleplacement_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

%% TEST NON LINEARE
close all
r=pi
simOut = sim('simulation_poleplacement_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

% Ottenendo i seguenti risultati:
%{
         RiseTime: 0.3662
    TransientTime: 0.6593
     SettlingTime: 0.6593
      SettlingMin: 2.9075
      SettlingMax: 3.1426
        Overshoot: 0.0272
       Undershoot: 0
             Peak: 3.1426
         PeakTime: 19.5859

ANALISI RISULTATI


%}

%% POLE PLACEMENT EQUIPOLLANZA DEI POLINOMI
%{
Proviamo a risolvere il problema tramite l'equipollanza dei polinomi,
dato che è un sistema del secondo ordine possiamo equiparare il polinomio
caratteristico di (A-BK), con il polinomio del secondo ordine:
s^2 + 2sξω + ω^2 = 0. 
Considerando K = [k1 k2] si ottiene:
A-BK = [0 1; 9.81-k1 -0.1-k2]
e calcolando il polinomio caratteristico:
s^2 + (0.1+k2)s + (k1-9.81)
Di conseguenza:
k1=ω^2+9.81 
k2=2ξω-0.1

Il k1, il k2 e il kr ottenuti sono relativi al controllore:
$u_l=-Kz + k_r r_l$
le $K$ e il $k_r$ che otterremo durante la procedura di sintesi saranno quindi relative a questo $u_l$
alla fine dovremo riportare questo al sistema non lineare: 
$u -u_e= -K (x-x_e) + k_r (r_{nl -\pi})$
$u_e=0$, $x_e=\begin{bmatrix}\pi \\ 0\end{bmatrix}$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi + k_r (r_{nl -\pi})$
$r_{nl} = \pi$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi$ 
%}

A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;

%matrice di raggiungibilità
W_R=[B A*B];
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_R)
% Il sistema è raggiungibile
%caso umax=300
zita = 1/sqrt(2)
w = 2.2/0.25

%caso estremo umax=+inf
%zita = 1
%w = 2.7/0.001

k1=w^2+9.81 
k2=2*zita*w-0.1
K=[k1 k2]
kr=-1/(C*inv(A-B*K)*B)

%% TEST PRELIMINARE SUL LINEARE
close all
rl = 0
simOut = sim('simulation_poleplacement_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

%% TEST SUL NON LINEARE
close all
r=pi
simOut = sim('simulation_poleplacement_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);


% Ottenendo i seguenti risultati:
%{
Step Information for the Output:
         RiseTime: 0.2312
    TransientTime: 0.6759
     SettlingTime: 0.6759
      SettlingMin: 2.8913
      SettlingMax: 3.2928
        Overshoot: 4.8085
       Undershoot: 0
             Peak: 3.2928
         PeakTime: 0.5074

ANALISI RISULTATI

Da cui notiamo che non riusciamo ad arrivare a regime, quindi rilassiamo un
pò l'overshoot
%}


%% POLE PLACEMENT CON AZIONE INTEGRALE
A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;

As=[0 1 0; 9.81 -0.1 0; 1 0 0];
Bs=[0 0; 1 0; 0 -1];

hatB=[0; 1; 0]

%matrice di raggiungibilità
W_Rs=[hatB As*hatB, As^2*hatB];
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_Rs)
% Il sistema è raggiungibile
%% POLE PLACEMENT CON AZIONE INTEGRALE DEFINENDO I POLI ARBITRARIAMENTE
ps=[-20 -40 -60] % posizione desiderata dei poli 
% Proviamo pazziando noi i poli a ciclo chiuso
K=place(As,hatB,ps)

%% TEST PRELIMINARE SUL LINEARE CON AZIONE INTEGRALE 
close all
rl = 0
simOut = sim('simulation_poleplacement_azioneintegrale_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

%% TEST SUL NON LINEARE CON AZIONE INTEGRALE
close all
r=pi
simOut = sim('simulation_poleplacement_azioneintegrale_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);


% Ottenendo i seguenti risultati:
%{
RiseTime: 0.4490
TransientTime: 0.7219
SettlingTime: 0.7219
SettlingMin: 1.9824
SettlingMax: 2.1412
Overshoot: 0.1271
Undershoot: 0
Peak: 2.1412
PeakTime: 1.2266

ANALISI RISULTATI

Da cui notiamo che non riusciamo ad arrivare a regime, quindi rilassiamo un
pò l'overshoot
%}

%% AZIONE INTEGRALE CON EQUIPOLLANZA DEI POLINOMI


A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;

As=[0 1 0; 9.81 -0.1 0; 1 0 0];
Bs=[0 0; 1 0; 0 -1];

hatB=[0; 1; 0]

%matrice di raggiungibilità
W_Rs=[hatB As*hatB, As^2*hatB];
%verifichiamo che rango sia uguale a max(n righe, n colonne) di W_R
rank(W_Rs)

% Consideriamo ξ=1 (ovvero sovraelongazione pari a 0)
% e una ω=5.4 (ottenendo rise time = 0.5)
zita = 0.9
wn = 5.4
%zita * w = 4.86
p=4860

k1=2*p*zita * wn + wn^2 + 9.81
k2=p +2*zita*wn - 0.1
ki= wn^2 * p
K=[k1 k2 ki]


%% TEST PRELIMINARE SUL LINEARE CON AZIONE INTEGRALE 
close all
rl = 0
simOut = sim('simulation_poleplacement_azioneintegrale_WP2_L', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);

%% TEST SUL NON LINEARE CON AZIONE INTEGRALE
close all
r=pi
simOut = sim('simulation_poleplacement_azioneintegrale_WP2_NL', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut,1);


% Ottenendo i seguenti risultati:
%{
RiseTime: 0.4490
TransientTime: 0.7219
SettlingTime: 0.7219
SettlingMin: 1.9824
SettlingMax: 2.1412
Overshoot: 0.1271
Undershoot: 0
Peak: 2.1412
PeakTime: 1.2266

ANALISI RISULTATI

Da cui notiamo che non riusciamo ad arrivare a regime, quindi rilassiamo un
pò l'overshoot
%}

%% LQR
% Proviamo a risolvere con un problema LQR:

% Qz -> da importanza agli stati sulla diagonale principale abbiamo: z1 e
% z2
%caso reale umax=300
Qz = [20 0; 0 0.08]
Qv = 3e-03; % Quando Qv è piccola -> non ha importanza quindi l'azione di controllo è più grande

%caso estremo umax=+inf
%Qz = [1000 0; 0 0.001]
%Qv = 1e-08;
[K,S,P] = lqr(A,B,Qz,Qv);


simOut = sim('simulation_control_LQR_WP2', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults_LQR(simOut,1);


% Ottenendo i seguenti risultati:
%{
Step Information for the Output:
         RiseTime: 0.2591
    TransientTime: 0.3923
     SettlingTime: 0.3923
      SettlingMin: 3.1063
      SettlingMax: 3.1944
        Overshoot: 1.6818
       Undershoot: 0
             Peak: 3.1944
         PeakTime: 0.5072


%}

%% LQR CON AZIONE INTEGRALE 
% Proviamo a risolvere con un problema LQR: 
clear all 
close all 
% Qz -> da importanza agli stati sulla diagonale principale abbiamo: z1 e 
% z2 
As=[0 1 0; 9.81 -0.1 0; 1 0 0]; 
Bs=[0 ; 1 ; 0 ]; 
%caso illimitato umax = +inf 
%Qz = [1000 0 0; 0 0.01 0; 0 0 1000] 
%Qv = 1e-08; % Quando Qv è piccola -> non ha importanza quindi l'azione di controllo è più grande 
 
A=[0 1; 9.81 -0.1]; 
B=[0; 1]; 
C=[1 0]; 
D=0; 
 
 % caso limitato umax = 300 
Qz = [2 0 0; 0 0.01 0; 0 0 0.5]; 
Qv = 3e-04 % Quando Qv è piccola -> non ha importanza quindi l'azione di controllo è più grande 
[K,S,e] = lqi(ss(A,B,C,D),Qz,Qv); 
%valore disturbo massimo =50

simOut = sim('simulation_control_LQR_azioneintegrale_WP2', 'SimulationMode', 'normal'); 
 
% Chiamata alla funzione per visualizzare i risultati 
plotSimulationResults_LQR(simOut,1);


