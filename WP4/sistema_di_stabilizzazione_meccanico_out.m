
function y = sistema_di_stabilizzazione_out(input)
    g=9.81;
    l=1;
    b=0.1;
    m=1;

    state=[input(1),input(2)]
    
    x_1_state=state(1);
    x_2_state=state(2);
         
    y = x_1_state;
    
end