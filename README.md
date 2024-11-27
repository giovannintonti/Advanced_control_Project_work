The contents of the folders linked to each Work Package for the project work of the Advanced Control course are specified below.
EXECUTING THE CODE FOR EACH WP
Each of the WPs has a live script containing the code for the simulations and calculations useful for the design and evaluation of the proposed controllers. Using the " Run Section " in each section of the live scripts it will be possible to execute the entire code contained in the section.

**WP1**

The file to open and consult is "WP1.mlx", and inside it, section by section, you can run the code by pressing " Run Section ". In particular, the sections of the file deal with:
- an analysis of the response of the open-loop system starting from different initial conditions to identify the stable and unstable equilibrium points and how the system reaches them, first with initial conditions x =[ 0,0], then with x=[pi /2,0], then with x=[pi/2,2], with x=[pi,0] and with x=[pi,1];
- a further analysis of the response of the open loop system starting from x =[ 0,1] and varying the control input;
- an analysis of the system through the phase plan by varying the control input and placing it in sequence equal to 0, 2, 4, 6;
- the construction of matrices A, B, C and D for the linearized system around the analytically identified equilibrium points;
- the analysis of the v0 controller by evaluating the goodness of the simulations, taking into account a reference equal to pi;
- the analysis of the v0 controller via closed-loop phase plan;
- the construction of the dynamic function of the system, thus designing the system of equations that describes the system addressed in the MATLAB environment.

**WP2**

The file to open and consult is "WP2.mlx", and inside it, section by section, you can run the code by pressing " Run Section ". In particular, the sections of the file deal with:
- a check on the reachability of the system, initializing the matrices A, B, C and D for this WP too;
- a pole placement using the MATLAB "place" function to identify the K and kr parameters to be used in the simulations;
- a test on the linearized system with the parameters K and kr just obtained, then simulation on the system ignoring the non-linearities and imposing r=0 as reference;
- a test on the non-linear system with the parameters K and kr just obtained, then simulation on the real system and imposing r=pi as reference;
- a pole placement through equivalence of the polynomials, then calculation of the K and kr values through evaluation of the k1 and k2 coefficients obtained starting from the imposition of desired performances through zita and w;
- a test on the linearized system with the parameters K and kr obtained through equipollence, then simulation on the system ignoring the non-linearities and imposing r=0 as reference;
- a test on the non-linear system with the parameters K and kr obtained through equipollence, then simulation on the real system and imposing r=pi as reference;
- the design of an LQR controller, with evaluation of the K parameter using the MATLAB " lqr " command and choosing Qz =[ 20 0, 0 0.08] and Qv =3e-03;
- the construction of the extended system to introduce an integral action component, thus defining As , Bs and hatB , with reachability control of the extended system;
- the design of an LQR controller with integral action, with evaluation of the K parameter using the MATLAB " lqi " command and choosing Qz =[ 2 0 0, 0 0.01 0, 0 0 0.5] and Qv =3e-04;
- a disturbance-free test on the nonlinear system with the parameters K and kr obtained via " lqi ", then simulation on the real system and imposing r=pi as reference;
- a test with a step disturbance of intensity 50 on the nonlinear system with the parameters K and kr obtained via " lqi ", then simulation on the real system and imposing r=pi as reference.

**WP3**

The file to open and consult is "WP3.mlx", and inside it, section by section, you can run the code by pressing " Run Section ". In particular, the sections of the file deal with:
- the design of an observer with an LQR-based controller, first evaluating the observability of the system, defining poles faster than the eigenvalues of A-BK, and exploiting the MATLAB "place" command to obtain the values of the parameter L;
- a test on the nonlinear system with the parameter L just obtained, then simulation on the real system with observer and LQR controller and imposing r=pi;
- the design of an observer with a controller based on LQI, first evaluating the observability of the system, defining poles faster than the eigenvalues of As-BsK , with K obtained as in the LQI case in WP2, and exploiting the MATLAB "place" command to obtain the values of the parameter L;
- a disturbance-free test on the nonlinear system with the parameter L just obtained, then simulation on the real system with observer and LQR controller with integral action and imposing r=pi;
- a test with a step disturbance of intensity 50 on the nonlinear system with the parameter L just obtained, then simulation on the real system with observer and LQR controller with integral action and imposing r=pi.

**WP4**

The file to open and consult is "WP4.mlx", and inside it, section by section, you can run the code by pressing " Run Section ". In particular, the sections of the file deal with:
- the design of a controller based on feedback linearization input/output with invariant time reference and related simulation;
- the design of a controller based on input/output feedback linearization with a time-variant reference, first consisting of a sinusoidal signal, then replaced by a ramp, with associated simulation;
- the design of a controller based on input/output feedback linearization with invariant time reference and integral action, with associated disturbance-free simulation;
- a test with a step disturbance of intensity 50 on the nonlinear system, then simulation on the real system with the newly obtained feedback linearization -based controller;
- the design of a controller based on feedback linearization input/output with variable time reference and integral action, with associated simulation without disturbance;
- a test with a step disturbance of intensity 50 on the nonlinear system, then simulation on the real system with the newly obtained feedback linearization -based controller.

**WP5**

The file to open and consult is "WP5.mlx", and inside it, section by section, you can run the code by pressing " Run Section ". In particular, the sections of the file deal with:
- the identification of the state variables and the control action expressed as a function of the sigma scheduling variable;
- the linearization of the system around the equilibrium points and the identification of the Jacobian as a function of sigma;
LQR_activate flag =0 starting from the characteristic polynomial sI -A+BK and imposing the desired performances via zita and w, to then evaluate k1_sigma and k2_sigma;
- a test on the non-linear system evaluating the gains as continuous functions of the scheduling variable, with an invariant time reference;
- a test on the non-linear system obtaining the gains through the look-up table , with an invariant time reference;
- 3 tests on the non-linear system with a time variant reference consisting of a sinusoidal signal, respectively calculating the gains as continuous functions of the scheduling variable, then obtaining them via look-up table , and finally using a model based on StateFlow ;
- a test on the non-linear system by evaluating the gains as continuous functions of the scheduling variable, with invariant time reference, but obtaining the values of K through resolution of the LQR optimization problem (setting the LQR_activate flag =1), and not through equivalence;
- a test on the nonlinear system with a time-variant reference consisting of a sinusoidal signal and evaluating the gains as continuous functions of the scheduling variable, with K obtained via LQR;
- a test on the nonlinear system without disturbances evaluating the gains as continuous functions of the scheduling variable, with invariant time reference, but obtaining the values of K via LQR with integral action;
- a test with a step disturbance of intensity 50 on the nonlinear system evaluating the gains as continuous functions of the scheduling variable, with invariant time reference, but obtaining the K values via LQR with integral action;
- a test on the nonlinear system with a time-variant reference consisting of a sinusoidal signal without disturbances and evaluating the gains as continuous functions of the scheduling variable, with K obtained via LQI;
- a test on the nonlinear system with a time-variant reference consisting of a sinusoidal signal with sinusoidal disturbance and evaluating the gains as continuous functions of the scheduling variable, with K obtained via LQI.

**CONTENTS OF THE SIMULINK FILES USED**

As regards the simulations referred to for each WP, they are based on the following simulink files :
- for WP1
	- " open_loop " for the open loop simulation of the original system;
	- "closed_loop_v0" for closed loop simulation of the system with the v0 controller;
- for WP2
	- " PP_s_inv_L " for the closed-loop simulation of the linearized system with controller obtained through pole placement, with invariant time reference;
	- " PP_s_inv_NL " for the closed-loop simulation of the nonlinear system with controller obtained through pole placement, with invariant time reference;
	- " LQR_s_inv " for the closed-loop simulation of the nonlinear system with controller obtained via LQR, with invariant time reference;
	- " LQR_s_inv_int " for the closed-loop simulation of the nonlinear system with controller obtained through LQR with integral action, with invariant time reference;
- for WP3
	- " OBS_s_inv " for the closed-loop simulation of the nonlinear system with observer and controller obtained via LQR, with invariant time reference;
	- " OBS_s_inv_int " for the closed-loop simulation of the nonlinear system with observer and controller obtained via LQR with integral action, with invariant time reference;
- for WP4
	- " FL_s_inv " for the closed-loop simulation of the nonlinear system with controller obtained through feedback linearization , with invariant time reference;
	- " FL_s_v_sine " for the closed-loop simulation of the nonlinear system with controller obtained through feedback linearization , with a time-variant reference consisting of a sine;
	- " FL_s_v_rampa " for the closed-loop simulation of the nonlinear system with controller obtained through feedback linearization , with a varying time reference consisting of a ramp;
	- " FL_s_inv_int " for the closed-loop simulation of the nonlinear system with controller obtained via feedback linearization with integral action, with invariant time reference;
	- " FL_s_v_sine_int " for the closed-loop simulation of the nonlinear system with controller obtained through feedback linearization with integral action, with a time-variant reference consisting of a sine;
	- " FL_s_v_rampa_int " for the closed-loop simulation of the nonlinear system with controller obtained through feedback linearization with integral action, with a varying time reference consisting of a ramp;
- for WP5
	- " GS_s_inv_function " for the closed-loop simulation of the nonlinear system with gain scheduling and parameters obtained as functions of the scheduling variable, with invariant time reference;
	- " GS_s_inv_lookuptable " for the closed-loop simulation of the nonlinear system with gain scheduling and parameters obtained through the look-up table , with invariant time reference;
	- " GS_s_v_sine_function " for the closed-loop simulation of the nonlinear system with gain scheduling and parameters obtained as functions of the scheduling variable, with a variant time reference consisting of a sinusoidal signal;
	- " GS_s_v_seno_lookuptable " for the closed-loop simulation of the nonlinear system with gain scheduling and parameters obtained through the look-up table , with a time-variant reference consisting of a sinusoidal signal;
	- " GS_s_v_sine_stateflow " for the closed-loop simulation of the nonlinear system with gain scheduling and parameters obtained through a StateFlow chart , with a time-variant reference consisting of a sinusoidal signal;
	- " GS_LQI_inv_function " for the closed-loop simulation of the nonlinear system with gain scheduling based on LQI controller and parameters obtained as functions of the scheduling variable, with invariant time reference;
	- " GS_LQI_v_sine_function " for the closed-loop simulation of the nonlinear system with gain scheduling based on the LQI controller and parameters obtained as functions of the scheduling variable, with a variant time reference consisting of a sinusoidal signal.

**MATLAB FUNCTIONS DESIGNED AND USED**

The MATLAB functions written and used within the code of each WP are described below:
- for WP1
	- " plotSimulationResults ", given the output of a simulation and the step response information of the system, plots the states, the control effort, the output and the comparison between output and reference, as well as displaying the information of system step response;
	- "function_WP1", given the system state vector, evaluates the new state reached by the system according to the system model;
- for WP2
	- the same functions as WP1;
- for WP3
	- the same functions as WP1;
	- " plotDifferences ", given the output of a simulation in which both the true and observed states are stored, makes a plot of the comparison between the true and observed states;
- for WP4
	- " plotSimulationResults " as in WP1;
	- " FL_FBL_control ", given the state vector and the equivalent input, computes the control input to provide to the system;
	- " FL_s_inv_control_law ", given the output, the desired output, and their derivatives up to the second derivative, computes the equivalent input for the case with invariant time reference;
	- " FL_s_inv_control_law_int ", given the output, the desired output, and their derivatives up to the second derivative, computes the equivalent input for the case with invariant time reference with integral action ;
	- " FL_s_v_control_law ", given the output, the desired output, and their derivatives up to the second derivative, computes the equivalent input for the case with variant time reference;
	- " FL_s_v_control_law_int ", given the output, the desired output, and their derivatives up to the second derivative, computes the equivalent input for the case with variant time reference;
	- " FL_sys ", given the control input and states, computes the next system state according to the system model;
	- " FL_sys_out ", given the states, computes the system output according to the system model;
- for WP5
	- " GS_compute_gains_LQR ", given the scheduling variable, computes the K parameter via LQR;
	- " GS_compute_gains_LQI ", given the scheduling variable, computes the parameter K via LQI;
	- " GS_compute_gains_PP ", given the reference and the parameters zita and omega, computes the parameter K via equivalence of the polynomials;
	- " GS_sys ", given the control input and states, computes the next system state according to the system model;
	- " plotSimulationResults " as in WP1.
