clear all
close all
clc
%% Definizione del sistema e funzione per rappresentarlo in matlab come sistema non lineare
% Il sistema è descitto dalle equazioni:
% x1dot = x2 = f1(x)
% x2dot = -g/l sin(x1) -b/(ml^2) x2 + u(t)/(ml^2) = f2(x)
% y = x1

% Può essere rappresentato su matlab dalla funzione (verrà riportata in
% basso per la sintassi del matlab
%{
function xdot = WP1(x)
    m=1; -> massa della mensola
    l=1; -> lunghezza della mensola
    g=9.81; -> forza di gravità
    b=0.1; -> coefficiente di attrito
    x1=x(1);
    x2=x(2);
    u=x(3);
    x1dot= x2;
    x2dot= - ((g/l)*sin(x1)) - ((b/(m*(l^2)))* x2) + (u/(m*(l^2)));
    xdot=[x1dot, x2dot].';
    end
%}

%% Possiamo analizzare la risposta a ciclo aperto del sistema sotto diverse condizioni iniziali, considerando u=0

x1 = 0;
x2 = 0;
u=0;

simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);


%{
Nella prima situazione, partiamo direttamente dal punto di equilibrio 
stabile di conseguenza restiamo nel punto di equilibrio (0,0), 
senza oscillazioni.
%}
%%
x1=pi/2;
x2=0;
u=0;
simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%{
Nella prima situazione, partiamo direttamente dal punto di equilibrio 
stabile di conseguenza restiamo nel punto di equilibrio (0,0), 
senza oscillazioni.
%}
%%
x1=pi/2;
x2=2;
u=0;
simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%{
Nel secondo caso, partiamo da una situazione iniziale diversa per la 
posizione del pendolo, in questo caso pi\2, dato che il punto 
(0,0) è un fuoco attrattivo, il sistema tenderà a raggiungere il punto 
di equilibrio, oscillando fino a convergenza.
%}
%%
x1=pi;
x2=0;
u=0;
simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%{
Nella prima situazione, partiamo direttamente dal punto di equilibrio 
stabile di conseguenza restiamo nel punto di equilibrio (0,0), 
senza oscillazioni.
%}
%%
x1=pi;
x2=1;
u=0;
simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);


%{
Nella prima situazione, partiamo direttamente dal punto di equilibrio 
stabile di conseguenza restiamo nel punto di equilibrio (0,0), 
senza oscillazioni.
%}

%% Possiamo analizzare la risposta "a ciclo aperto" del sistema sotto diverse condizioni iniziali, considerando una u costante != 0 (NON LO SO
% SE HA SENSO FARLO)

x1=0;
x2=1;
u=2;
simOut = sim('WP1openloop.slx', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);

%{
Abbiamo un comportamento simile ai casi precedenti, con la differenza che
il punto di equilibrio è modificato, in questo caso è (0.185,0) poichè
dipende dall'ingresso di controllo
%}

%% PIANO DELLE FASI AL VARIARE DI U
close all
% Per analizzare il sistema, plottiamo il piano delle fasi per diversi
% ingressi, tra cui quello intorno al quale è stato linearizzato il
% sistema:



tspan = [0 100];  % intervallo di simulazione
x0_1 = 0;
x0_2 = 1; % condizioni iniziali
x0 = [x0_1 x0_2];

u_values = [0 , 1, 2, 3];  % Modifica questa lista con i valori desiderati

% Inizializza una cell array per memorizzare i risultati
results = cell(1, length(u_values));

% Utilizzeremo il solver 'ode45' (anche altri solver sono disponibili in Matlab)
for i = 1:length(u_values)
    u = u_values(i);
    [t, x] = ode45(@(t, x) function_ode_WP1(t, x, u), tspan, x0);
    results{i} = x;  % Salva i risultati nella cella
end

% Plot delle traiettorie nel piano delle fasi
figure();
hold on;
colors = 'bgrm';  % Colori per le diverse traiettorie
for i = 1:length(u_values)
    x = results{i};
    plot(x(:,1), x(:,2), colors(i));
end

xlabel('x1');
ylabel('x2');
legend('u = 0', 'u = 1', 'u = 2', 'u = 3');
grid on;

%{
Come notiamo, i punti di equilibrio di tipo (angolo,0) sono punti di
equilibrio stabili, in particolar modo sono fuochi attrattivi, mentre i
punti di equilibrio (pi+-angolo,0) sono punti di equilibrio instabili. Lo
stesso risultato è ottenibile attraverso lo studio del piano delle fasi per
diverse traiettorie con l'aiuto di pplane e dell'app "Phase Plane", un
pacchetto aggiuntivo di Matlab per visualizzare punti di equilibrio, le 
nukelines e le traiettorie nel piano delle fasi
%}


 
%% Analisi dei punti di equilibrio con il piano delle fasi e linarizzazione del sistema intorno al punto di equilibrio di nostro interesse
% Il sistema dinamico non lineare è descritto nella forma:

% x1dot = x2 = f1(x)
% x2dot = -g/l sin(x1) -b/(ml^2) x2 + u(t)/(ml^2) = f2(x)

% Calcoliamo i punti di equilibrio ponendo le due equazioni uguali a 0:

% x2=0
% -g/l sin(x1) -b/(ml^2) x2 + u(t)/(ml^2) = 0

% Considerando u_e = 0 otteniamo

% x2 = 0
% sin(x1)=0

% ottenendo xa = [0,0] e xb = [pi,0], a noi interessa linearizzare intorno
% a questo secondo punto di equilibrio xe=xb

% Linearizziamo il sistema applicando una trasformazione
% dello stato, considerando: z=x-xe e v=u-ue ottenendo:
% z1dot = z2 = f1(z)
% z2dot = -g/l sin(z1+xe) -b/(ml^2) z2 + v(t)/(ml^2) = f2(z)

% Di conseguenza si ottengono le Jacobiane A,B,C,D pari a:

A=[0 1; 9.81 -0.1];
B=[0; 1];
C=[1 0];
D=0;





%% VALUTARE LE PERFORMANCE CARATTERIZZANDO LA RISPOSTA DEL SISTEMA A CICLO CHIUSO (WP2)
close all
%{
Analizziamo il controllore fornito dalla traccia: $u_l=-Kz + k_r r_l$
le $K$ e il $k_r$ che otterremo durante la procedura di sintesi saranno quindi relative a questo $u_l$
alla fine dovremo riportare questo al sistema non lineare: 
$u -u_e= -K (x-x_e) + k_r (r_{nl -\pi})$
$u_e=0$, $x_e=\begin{bmatrix}\pi \\ 0\end{bmatrix}$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi + k_r (r_{nl -\pi})$
$r_{nl} = \pi$
$u=-K_1 x_1 - K_2 x_2 + K_1 \pi$ 
%}


K = [18235, 53.9];
kr=-1/(C*inv(A-B*K)*B)
r=pi
simOut = sim('simulation_v0_WP1', 'SimulationMode', 'normal');

% Chiamata alla funzione per visualizzare i risultati
plotSimulationResults(simOut);



% Ottenendo i seguenti risultati:
%{
RiseTime: 0.0094
TransientTime: 0.1266
SettlingTime: 0.1266
SettlingMin: 2.3450
SettlingMax: 4.7450
Overshoot: 50.8450
Undershoot: 0
Peak: 4.7450
PeakTime: 0.0219

Con un tempo di salita molto ridotto, ma un conseguente overshoot del 50%
della risposta con un picco assunto a 4.74, inoltre lo sforzo di controllo
arriva ad un picco di 6x10^4 ed è in generale molto elevato.
%}





%% FUNZIONE DINAMICA DEL SISTEMA ( con u variabile )

function xdot = function_ode_WP1(t, x, u)
    m = 1;
    l = 1;
    g = 9.81;
    b = 0.1;
    x1 = x(1);
    x2 = x(2);
    x1dot = x2;
    x2dot = -((g/l)*sin(x1)) - ((b/(m*(l^2)))*x2) + (u/(m*(l^2)));
    xdot = [x1dot, x2dot].';
end


