%% FUNZIONE PER ANALISI DEL CONTROLLORE
function plotSimulationResults(simOut, stepInfo)
    % Estrai i dati dalla simulazione
    x = simOut.get('x');
    t = simOut.get('t');
    y = simOut.get('y');
    u = simOut.get('u');
    x1 = x(:, 1);
    x2 = x(:, 2);
   

    % Plot della simulazione
    figure()
    plot(t, x1, 'r', t, x2, 'b');
    xlabel('t');
    ylabel('x1 and x2');
    legend('x1', 'x2');

    % Plot dell'uscita
    figure()
    plot(t, y)
    xlabel('t');
    ylabel('y');
    legend('y');

    % Plot del controllo
    figure()
    plot(t, u)
    xlabel('t');
    ylabel('u');
    legend('u');


    % Calcola e visualizza le informazioni sulla risposta allo scalino dell'uscita
    if stepInfo == 1
       results=stepinfo(y, t);
       disp('Step Information for the Output:');
       disp(results);
    end
end