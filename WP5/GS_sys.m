function out= GS_sys(input)
    m=1;
    l=1;
    g=9.81;
    b=0.1;
    x1=input(1);
    x2=input(2);
    u=input(3);

    x1dot= x2;
    x2dot= - ((g/l)*sin(x1)) - ((b/(m*(l^2)))* x2) + (u/(m*(l^2)));
    out=[x1dot, x2dot].';
    
end