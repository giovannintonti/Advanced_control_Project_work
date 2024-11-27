function gains= GS_compute_gains_PP(input)
    rif=input(1);
    zita=input(2);
    w0=input(3);
    
    sigma=rif;
    k1=w0^2 - (981*cos(sigma))/100;
    k2=2*w0*zita-0.1;


    gains=[k1,k2];
end