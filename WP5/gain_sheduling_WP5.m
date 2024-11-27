%% trovare punti di equilbirio a ciclo aperto
clear all
close all
clc
syms x1eq x2eq sigma k1 k2 b g m l ueq

eq1= x2eq
eq2= -g/(m*l^2)*sin(x1eq)-b/(m*l^2)*x2eq+ueq/(m*l^2)
eq3 = x1eq - sigma
% sigma = r
%y = r => x1 = r => x1 = sigma

eq2 = (subs(eq2,{'g','m','b','l'},[9.81,1,0.1,1]))

solution=solve([eq1==0, eq2==0, eq3==0],[x1eq,x2eq,ueq]);
x1eq=solution.x1eq
x2eq=solution.x2eq
ueq=solution.ueq
%simplyfi
%assume -> fa ssunzioni sui parametri

%% linearizzaione intorno ai punti di equilibrio a ciclo aperto
%otteniamo sistema lineare al variare dei parametri

%scrittura delle matrici jacobiane
%il comando jacobian, prende in ingresso n funzioni e costruisce matrice 
%in cui per ogni riga calcola derivata della prima funzione rispetto a
%prima variabile del secondo vettore, derivata prima funzione rispetto a
%seconda variabile del secondo vettore e così via..
syms x1 x2 sigma k1 k2 b g m l u r

eq1= x2
eq2= -g/(m*l^2)*sin(x1)-b/(m*l^2)*x2+u/(m*l^2)
eq3 = x1 - sigma

eq2 = (subs(eq2,{'g','m','b','l'},[9.81,1,0.1,1]))
J_A=jacobian([eq1,eq2],[x1,x2])
J_B=jacobian([eq1,eq2],[u])

%subs sostiuisce delle varaibili simboliche indicate tra 'z' con i valori
%scritti all'interno del vettore, in tal caso per la linearizzazione sono 
% i punti di equilibrio trovati prima
A=subs(J_A,{'x1','x2'},[x1eq, x2eq])
B=subs(J_B,{'u'},[ueq])

% Esplicitiamo u = -Kx, ovvero il ciclo chiuso, e riscriviamo la matrice
% dinamica associata
syms k1 k2
K = [k1 k2]
Acc = A-B*K
%% dobbiamo studiare il polinomio caratteristico del sistema
%per avere stabilità non ci devono essere permutazioni di segno
%usiamo equipollenza dei polinomi per avere determinate dinamiche

%calcolo polinomio caratteristico
%metodo 1
%pol=charpoly(A)
%metodo 2
%pol= [1, -trace(matrix),det(matrix)]

syms zita omega_n
pol = charpoly(Acc)

%assume serve ad aggiungere costraint
assume(pol(2)>0);
assume(pol(3)>0);

%% scelta dei parametri del polinomio


pol_des=[1 2*zita*omega_n omega_n^2]
gains=solve(pol==pol_des, [k1, k2], ReturnConditions=true)

%%
%la funzione gain calcola k_p e k_i all'interno del pol per ottenere stessi
%coefficienti di pol_des

%caso reale umax=300
zita=0.95 %prossimo a 1 per avere poche sovraelomganzione
Tr= 0.27 %tempo di salita
omega_n=2.63/Tr

%caso estremo umax=+inf
%zita=1 %prossimo a 1 per avere poche sovraelomganzione
%Tr= 0.01 %tempo di salita
%omega_n=2.70/Tr


gains.k1 = simplify(subs(gains.k1,{'omega_n'},[omega_n]))
gains.k2 = simplify(subs(gains.k2,{'omega_n','zita'},[omega_n,zita]))

%zita0.9 -> omegan=2.56/tr
%zita 0.95 -> omegan=2.3/tr



gains.k1
gains.k2
%% creazione della look up table

sigma=[-pi+pi/16:pi/16:pi]; %valore inizlia passo e valore finale 
k1_sigma=[];
k2_sigma=[];

%double ci vuole perchè nonostante con subs mettiamo valori al posto dei simbolici
%senza double mahlab lo interpreta ancora come simbolico nonostante il
%valore sostiuito
for i = sigma
    k1_sigma=[k1_sigma,double(subs(gains.k1, 'sigma', i))]
    k2_sigma=[k2_sigma,double(subs(gains.k2, 'sigma', i))]
    %vettore= [vettore, nuovo valore] è una concatenazione
end

%% vpa, arrotonda a n-esima cifra significativa
%in tal caso è usato solo per una stampa
vpa(k1_sigma)
vpa(k2_sigma)

%% simulation con calcolo esplicito dei gudagani k_i,k_p al variarare di zita e sigma
%la prima modalità è intepretre gaudagni come una funzione continua di sigma
%tale soluzione è possibile in tal caso perchè abbiamo ottenuto una forma analitica per i guadagni

standard_model = 'gain_scheduling_sm_1_gain_scheduling_WP5.slx';
open_system(standard_model);
data = sim(standard_model, 50);

plotSimulationResults(data,0)
%plotSimulationResults(data,1)
%% simulation with lookuptable
%il secono modo è la look up table, dato un certo valore ho n output
%le nostre look up table dato valore varaible di shceudling
% ci consentono di definre anche la varabile di interpolazione 
% fa automaticamente interpolazione in caso manchi entry nella tabella

lookuptable_model = 'gain_scheduling_sm_2_lookuptable_WP5.slx';
open_system(lookuptable_model);
data = sim(lookuptable_model, 50);


plotSimulationResults(data,0)
%plotSimulationResults(data,1)
%% simultaion with stateflow
%ultima modalità è state flow

stateflow_model = 'gain_scheduling_sm_3_stateflow_WP5.slx';
open_system(stateflow_model);
data = sim(stateflow_model, 50);


plotSimulationResults(data,0)
%plotSimulationResults(data,1)

%sample time sotto model explorer
