function gains= GS_computeLQRgains(input)
    
    Qz = [20 0; 0 0.08];
    Qv = 3e-03; 
    sigma=input(1);
    A = [0 1; -9.81*cos(sigma) -0.1];
    B = [0 ;1];
    [K,S,P] = lqr(A,B,Qz,Qv);
    gains=[K(1),K(2)];
end