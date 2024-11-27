function ueq = sistema_di_stabilizzazione_meccanico_linear_controller(input)

    yd=input(1);
    yd_dot=input(2);
    yd_ddot=input(3);
    y=input(4);
    y_dot=input(5);
    %fprintf("STAMPA yd %f", yd)
    %fprintf("STAMPA yd_dot %f", yd_dot)
    %fprintf("STAMPA yd_ddot %f", yd_ddot)
    %fprintf("STAMPA y %f", y)
    %fprintf("STAMPA y_dot %f", y_dot)
    
    %caso estremo umax= +inf
    %Kp_alpha=540;
    %Kp_beta=72900;
    
    %caso realisto umax=300
    Kp_alpha=99.94;
    Kp_beta=2766.76;

    ulin = yd_ddot - Kp_alpha*(y_dot-yd_dot) - Kp_beta*(y-yd) ;
    
    ueq=[ulin];
end