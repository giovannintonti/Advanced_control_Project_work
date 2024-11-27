function ueq = FL_s_v_control_law(input)

    yd=input(1);
    yd_dot=input(2);
    yd_ddot=input(3);
    y=input(4);
    y_dot=input(5);
   
    
    %caso estremo umax= +inf
    %Kp_alpha=46.08;
    %Kp_beta=655.36;
    
    %caso realisto umax=300
    Kp_alpha=18.432;
    Kp_beta=104.86;

    ulin = yd_ddot - Kp_alpha*(y_dot-yd_dot) - Kp_beta*(y-yd) ;
    
    ueq=[ulin];
end