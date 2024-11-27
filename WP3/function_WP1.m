
function xdot = function_WP1(x)
    m=1;
    l=1;
    g=9.81;
    b=0.1;
    x1=x(1);
    x2=x(2);
    u=x(3);
    x1dot= x2;
    x2dot= - ((g/l)*sin(x1)) - ((b/(m*(l^2)))* x2) + (u/(m*(l^2)));
   
    
    xdot=[x1dot, x2dot].';
end