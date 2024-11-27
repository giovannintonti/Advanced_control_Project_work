function y = sistema_di_stabilizzazione_FBL_control(input)
    
    g=9.81;
    l=1;
    b=0.1;
    m=1;

    state=[input(1),input(2)]
    equivalet_input= [input(3)]
    
    x_1_state=state(1);
    x_2_state=state(2);
    
    state=[input(1),input(2),input(3)]
    ueq=[equivalet_input(1)]
    
    y= (m*(l^2))* ( +((g/l) * sin(x_1_state)) +  ((b/m*(l^2)) * x_2_state) +ueq );
end