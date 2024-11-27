function ueq = sistema_di_stabilizzazione_linear_controller_rif_tempo_inv(input)

    yd=input(1);
    y=input(2);
    y_dot=input(3);
    %fprintf("STAMPA yd %f", yd)
    %fprintf("STAMPA y %f", y)
    %fprintf("STAMPA y_dot %f", y_dot)
    
    %caso estremo umax= +inf
    %Kp_alpha=46.08;
    %Kp_beta=655.36;
    
    %caso realisto umax=300
    Kp_alpha=18.432;
    Kp_beta=104.86;

    ulin =- Kp_alpha*y_dot - Kp_beta*(y-yd) ;
    
    ueq=[ulin];
end