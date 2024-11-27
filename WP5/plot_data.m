function plot_data(data, text)

    y = data.y.Data;
    u = data.u.Data;
    r = data.r.Data;

    f = figure(Name=text, Units='normalized', Outerposition=[0 0 1 1]);
    set(f, Visible='on');

    subplot(3, 1, 1);    
    pl = plot(data.y.Time, y);
    set(pl, linewidth=2, Color='r');
    hold on    
    pl = plot(data.r.Time, r, Color='g', DisplayName='Target');
    set(pl, linewidth=2);
    hold off
    leg = legend('$y$', '$\sigma = r$', Interpreter='Latex');
    set(leg, fontsize=16);
    xlabel('$t$', Interpreter='Latex', FontSize=16);
    ylabel('$y$',Interpreter='Latex', FontSize=16);
    grid
    
    subplot(3, 1, 2);
    
    pl = plot(data.u.Time, u, Color='b');
    set(pl, linewidth=2);
    xlabel('$t$', Interpreter='Latex', FontSize=16)
    ylabel('$u$', Interpreter='Latex', FontSize=16)
    grid
    
    subplot(3, 1, 3);
    pl = plot(data.y.Time, y, Color='b');
    set(pl, linewidth=2);
    xlabel('$t$',Interpreter='Latex', FontSize=16)
    ylabel('$x1$',Interpreter='Latex', FontSize=16)
    grid
end
