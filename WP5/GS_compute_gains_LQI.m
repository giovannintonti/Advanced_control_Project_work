function gains= GS_compute_gains_LQI(input)
    
    Qz = [2 0 0; 0 0.01 0; 0 0 0.5]; 
    Qv = 3e-04; 
    sigma=input(1);
    A = [0 1; -9.81*cos(sigma) -0.1];
    B = [0 ;1];
    C= [1 0];
    D = 0;
    [K,S,e] = lqi(ss(A,B,C,D),Qz,Qv); 
    gains=[K(1),K(2),K(3)];
end