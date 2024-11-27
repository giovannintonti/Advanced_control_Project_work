function ueq = FL_s_inv_control_law_int(input)

    yd=input(1);
    y=input(2);
    y_dot=input(3);
    e_int=input(4);
    
    %caso estremo umax= +inf
    %Kp_alpha=46.08;
    %Kp_beta=655.36;
    
    %caso realisto umax=300
    Kp_alpha=18.432;
    Kp_beta=104.86;
    ki=input(5);

    ulin =- Kp_alpha*y_dot - Kp_beta*(y-yd) - ki*(e_int);
    
    ueq=[ulin];
end