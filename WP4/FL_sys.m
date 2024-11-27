
function next_state = FL_sys(input)
    
    g=9.81;
    l=1;
    b=0.1;
    m=1;

    state=[input(1),input(2)];
    input_sys=[input(3)];
    
    x_1_state=state(1);
    x_2_state=state(2);
    
    u=input_sys(1);

    x_1_state_dot = x_2_state;
    x_2_state_dot = -((g/l) * sin(x_1_state)) - ((b/m*(l^2)) * x_2_state) + ((1/m*(l^2)) * u); 
    
    %vettore riga
    next_state = [x_1_state_dot x_2_state_dot]';
    
end