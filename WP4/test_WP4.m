clc
close all
clear all
simout=sim("sistema_di_stabilizzazione_meccanico_sm_rif_tempo_inv.slx", 'SimulationMode', 'normal');
plotSimulationResults(simout,1)

simout=sim("sistema_di_stabilizzazione_meccanico_sm.slx", 'SimulationMode', 'normal');
plotSimulationResults(simout,0)