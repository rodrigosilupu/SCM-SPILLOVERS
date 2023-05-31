clc
clear
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\codes\funciones')
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\bases_variables')
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\spillovers\simulacion_3\spillover_bajo_educ')
%% PARTE 1: IMPORTO DATOS
[data_1,provincias_1,~] = xlsread('BD_pobre_est_1_provincia_1.xlsx');
%% PARTE 2: CREO LA VARIABLE PROVINCIA j
provincia_1 = unique(provincias_1(2:end,1));
%% PARTE 3 GENERO LA VARIABLE PERIODO 
periodo = unique(data_1(:,1));
N = length(provincia_1);
T = 37;
S = length(periodo)-T;
%% PARTE 4 GENERO LA VARIABLE pobreza_j
pobreza_1 = reshape(data_1(:,2),T+S,N);
%%
pobreza_1 = pobreza_1'; 
%% PARTE 5, CONSTRUYO LA VARIABLE OUTCOME OBSERVADA
tratado_1 = pobreza_1(1,:);
%% PARTE 6: ME QUEDO SOLO CON LOS OUTCOMES DE LOS CONTROLES
pobreza_1(1,:) = [];
%% PARTE 7
pobreza_1 = [tratado_1;pobreza_1];
%% PARTE 8: GENERO LA MATRIZ Y DE OUTCOME
Y_1 = pobreza_1; % outcome matrix
%% PARTE 9 GEENERO LA MATRIX PRE Y POS TRATAMIENTO
Y_pre_1 = Y_1(:,1:T);
Y_post_1 = Y_1(:,T+1:end);
%% PARTE 10: CONTROL SINTÉTICO 
[a_hat_1,B_hat_1] = scm_batch(Y_pre_1);
synthetic_control_1 = a_hat_1(1)+B_hat_1(1,:)*Y_1;
%% PARTE 11: MATRIZ DE SPILLOVERS 
%A_1
% Provincia_1
ind_1 = xlsread('spillover_bajo_niv_educ_1.xlsx')
%%
A_1 = eye(N);
%%
A_1(:,ind_1 == 0) = [];
%% PARTE 12: GENERO LA MATRIZ M=(I-B)'(I-B)
M_hat_1 = (eye(N)-B_hat_1)'*(eye(N)-B_hat_1);
%% PARTE 13: GENERO EL VECTOR DE SCM PARA EL SPILLOVER
% EL MISMO QUE EL ANTERIOR SOLO QUE ESTE SE USARÁ PARA ALMACENAR EL 
% SCM CON SPILLOVER
synthetic_control_sp_1 = a_hat_1(1)+B_hat_1(1,:)*Y_1;
%% PARTE 14: treatment effect estimator
alpha1_hat_vec_1 = zeros(1,S);
%% PARTE 15: CALCULAMOS EL VECTOR SCM CON SPILLOVER 
%PROVINCIA 1
for s = 1 : 1
Y_Ts_1 = Y_1(:,T+s);
gamma_hat_1 = (A_1'*M_hat_1*A_1)\(A_1'*(eye(N)-B_hat_1)'*((eye(N)-B_hat_1)*Y_Ts_1-a_hat_1));
alpha_hat_1 = A_1*gamma_hat_1;
alpha1_hat_vec_1(s) = alpha_hat_1(1);
synthetic_control_sp_1(T+s) = Y_1(1,T+s)-alpha1_hat_vec_1(s);
end
%%
%PROVINCIA 1
for s = 1 : s
Y_Ts_1 = Y_1(:,T+s);
gamma_hat_1 = (A_1'*M_hat_1*A_1)\(A_1'*(eye(N)-B_hat_1)'*((eye(N)-B_hat_1)*Y_Ts_1-a_hat_1));
alpha_hat_1 = A_1*gamma_hat_1;
alpha1_hat_vec_1(s) = alpha_hat_1(1);
synthetic_control_sp_1(T+s) = Y_1(1,T+s)-alpha1_hat_vec_1(s);
end

%% PARTE 16: TRASPONGO 
synthetic_control_1=synthetic_control_1'
synthetic_control_sp_1=synthetic_control_sp_1'
tratado_1=tratado_1'
%%
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\synthetic_control_outputs.xlsx',synthetic_control_1,1)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_1,1)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\observado_outputs.xlsx',tratado_1,1)
%% PARTE 18: INFERENCE - TREATMENT EFFECTS
C = [1 zeros(1,N-1)];
p_value_vec_1 = zeros(1,S);
lb_vec_1 = zeros(1,S);
ub_vec_1 = zeros(1,S);
for s = 1 : S
    [p_value_1,lb_1,ub_1] = sp_andrews_te(Y_pre_1,pobreza_1(:,T+s),A_1,C,.05);
    p_value_vec_1(s) = p_value_1;
    lb_vec_1(s) = lb_1;
    ub_vec_1(s) = ub_1;
end
%% PARTE 19 INFERENCE - SPILLOVER EFFECTS
alpha_sig = .05;
spillover_test_1 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_1(s) = sp_andrews(Y_pre_1,pobreza_1(:,T+s),A_1,C,d,alpha_sig);
end

%% TEST 
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\output_tests.xlsx',lb_vec_1','lb_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\output_tests.xlsx',ub_vec_1','ub_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\output_tests.xlsx',p_value_vec_1','p_value_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\output_tests.xlsx',alpha1_hat_vec_1','alpha1_hat_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\bajo_niv_educ\1%\simulacion_3\output_tests.xlsx',spillover_test_1','sp_test_1');












