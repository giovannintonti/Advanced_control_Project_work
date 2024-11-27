function plotDifferences(simOut)
   
    x = simOut.get('x');
    xhat = simOut.get('xhat');
    t= simOut.get('t');
    x1 = x(:, 1);
    x2 = x(:, 2);
    x1hat = xhat(:,1);
    x2hat = xhat(:,2);
   

    % Plot della differenza tra x1hat e x1
    figure()
    plot(t, x1, 'r', t, x1hat, 'b');
    xlabel('t');
    ylabel('x1 and x1hat');
    legend('x1', 'x1hat');

   % Plot della differenza tra x2hat e x2
    figure()
    plot(t, x2, 'r', t, x2hat, 'b');
    xlabel('t');
    ylabel('x2 and x2hat');
    legend('x2', 'x2hat');
end