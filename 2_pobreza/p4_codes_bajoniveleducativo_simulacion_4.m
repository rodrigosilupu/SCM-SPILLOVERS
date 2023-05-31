clc
clear
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\codes\funciones')
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\bases_variables')
addpath('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\spillovers\simulacion_4\spillover_bajo_educ')
%% PARTE 1: IMPORTO DATOS
[data_1,provincias_1,~] = xlsread('BD_pobre_est_1_provincia_1.xlsx');
[data_7,provincias_7,~] = xlsread('BD_pobre_est_1_provincia_7.xlsx');
[data_10,provincias_10,~] = xlsread('BD_pobre_est_1_provincia_10.xlsx');
[data_16,provincias_16,~] = xlsread('BD_pobre_est_1_provincia_16.xlsx');
[data_17,provincias_17,~] = xlsread('BD_pobre_est_1_provincia_17.xlsx');
[data_18,provincias_18,~] = xlsread('BD_pobre_est_1_provincia_18.xlsx');
[data_23,provincias_23,~] = xlsread('BD_pobre_est_1_provincia_23.xlsx');
[data_26,provincias_26,~] = xlsread('BD_pobre_est_1_provincia_26.xlsx');
[data_27,provincias_27,~] = xlsread('BD_pobre_est_1_provincia_27.xlsx');
[data_38,provincias_38,~] = xlsread('BD_pobre_est_1_provincia_38.xlsx');
[data_39,provincias_39,~] = xlsread('BD_pobre_est_1_provincia_39.xlsx');
[data_41,provincias_41,~] = xlsread('BD_pobre_est_1_provincia_41.xlsx');
[data_42,provincias_42,~] = xlsread('BD_pobre_est_1_provincia_42.xlsx');
[data_44,provincias_44,~] = xlsread('BD_pobre_est_1_provincia_44.xlsx');
[data_45,provincias_45,~] = xlsread('BD_pobre_est_1_provincia_45.xlsx');
[data_55,provincias_55,~] = xlsread('BD_pobre_est_1_provincia_55.xlsx');
[data_57,provincias_57,~] = xlsread('BD_pobre_est_1_provincia_57.xlsx');
[data_65,provincias_65,~] = xlsread('BD_pobre_est_1_provincia_65.xlsx');
[data_66,provincias_66,~] = xlsread('BD_pobre_est_1_provincia_66.xlsx');
[data_71,provincias_71,~] = xlsread('BD_pobre_est_1_provincia_71.xlsx');
[data_75,provincias_75,~] = xlsread('BD_pobre_est_1_provincia_75.xlsx');
[data_76,provincias_76,~] = xlsread('BD_pobre_est_1_provincia_76.xlsx');
[data_77,provincias_77,~] = xlsread('BD_pobre_est_1_provincia_77.xlsx');
[data_78,provincias_78,~] = xlsread('BD_pobre_est_1_provincia_78.xlsx');
[data_79,provincias_79,~] = xlsread('BD_pobre_est_1_provincia_79.xlsx');
[data_80,provincias_80,~] = xlsread('BD_pobre_est_1_provincia_80.xlsx');
[data_84,provincias_84,~] = xlsread('BD_pobre_est_1_provincia_84.xlsx');
[data_86,provincias_86,~] = xlsread('BD_pobre_est_1_provincia_86.xlsx');
[data_87,provincias_87,~] = xlsread('BD_pobre_est_1_provincia_87.xlsx');
[data_88,provincias_88,~] = xlsread('BD_pobre_est_1_provincia_88.xlsx');
[data_89,provincias_89,~] = xlsread('BD_pobre_est_1_provincia_89.xlsx');
[data_91,provincias_91,~] = xlsread('BD_pobre_est_1_provincia_91.xlsx');
[data_92,provincias_92,~] = xlsread('BD_pobre_est_1_provincia_92.xlsx');
[data_95,provincias_95,~] = xlsread('BD_pobre_est_1_provincia_95.xlsx');
[data_100,provincias_100,~] = xlsread('BD_pobre_est_1_provincia_100.xlsx');
[data_104,provincias_104,~] = xlsread('BD_pobre_est_1_provincia_104.xlsx');
[data_105,provincias_105,~] = xlsread('BD_pobre_est_1_provincia_105.xlsx');
[data_106,provincias_106,~] = xlsread('BD_pobre_est_1_provincia_106.xlsx');
[data_107,provincias_107,~] = xlsread('BD_pobre_est_1_provincia_107.xlsx');
[data_108,provincias_108,~] = xlsread('BD_pobre_est_1_provincia_108.xlsx');
[data_112,provincias_112,~] = xlsread('BD_pobre_est_1_provincia_112.xlsx');
[data_119,provincias_119,~] = xlsread('BD_pobre_est_1_provincia_119.xlsx');
[data_125,provincias_125,~] = xlsread('BD_pobre_est_1_provincia_125.xlsx');
[data_129,provincias_129,~] = xlsread('BD_pobre_est_1_provincia_129.xlsx');
[data_130,provincias_130,~] = xlsread('BD_pobre_est_1_provincia_130.xlsx');
[data_133,provincias_133,~] = xlsread('BD_pobre_est_1_provincia_133.xlsx');
[data_139,provincias_139,~] = xlsread('BD_pobre_est_1_provincia_139.xlsx');
[data_140,provincias_140,~] = xlsread('BD_pobre_est_1_provincia_140.xlsx');
[data_141,provincias_141,~] = xlsread('BD_pobre_est_1_provincia_141.xlsx');
[data_144,provincias_144,~] = xlsread('BD_pobre_est_1_provincia_144.xlsx');
[data_149,provincias_149,~] = xlsread('BD_pobre_est_1_provincia_149.xlsx');
[data_150,provincias_150,~] = xlsread('BD_pobre_est_1_provincia_150.xlsx');
[data_152,provincias_152,~] = xlsread('BD_pobre_est_1_provincia_152.xlsx');
[data_153,provincias_153,~] = xlsread('BD_pobre_est_1_provincia_153.xlsx');
[data_157,provincias_157,~] = xlsread('BD_pobre_est_1_provincia_157.xlsx');
[data_158,provincias_158,~] = xlsread('BD_pobre_est_1_provincia_158.xlsx');
[data_159,provincias_159,~] = xlsread('BD_pobre_est_1_provincia_159.xlsx');
[data_162,provincias_162,~] = xlsread('BD_pobre_est_1_provincia_162.xlsx');
[data_169,provincias_169,~] = xlsread('BD_pobre_est_1_provincia_169.xlsx');

%% PARTE 2: CREO LA VARIABLE PROVINCIA j
provincia_1 = unique(provincias_1(2:end,1));
provincia_7 = unique(provincias_7(2:end,1));
provincia_10 = unique(provincias_10(2:end,1));
provincia_16 = unique(provincias_16(2:end,1));
provincia_17 = unique(provincias_17(2:end,1));
provincia_18 = unique(provincias_18(2:end,1));
provincia_23 = unique(provincias_23(2:end,1));
provincia_26 = unique(provincias_26(2:end,1));
provincia_27 = unique(provincias_27(2:end,1));
provincia_38 = unique(provincias_38(2:end,1));
provincia_39 = unique(provincias_39(2:end,1));
provincia_41 = unique(provincias_41(2:end,1));
provincia_42 = unique(provincias_42(2:end,1));
provincia_44 = unique(provincias_44(2:end,1));
provincia_45 = unique(provincias_45(2:end,1));
provincia_55 = unique(provincias_55(2:end,1));
provincia_57 = unique(provincias_57(2:end,1));
provincia_65 = unique(provincias_65(2:end,1));
provincia_66 = unique(provincias_66(2:end,1));
provincia_71 = unique(provincias_71(2:end,1));
provincia_75 = unique(provincias_75(2:end,1));
provincia_76 = unique(provincias_76(2:end,1));
provincia_77 = unique(provincias_77(2:end,1));
provincia_78 = unique(provincias_78(2:end,1));
provincia_79 = unique(provincias_79(2:end,1));
provincia_80 = unique(provincias_80(2:end,1));
provincia_84 = unique(provincias_84(2:end,1));
provincia_86 = unique(provincias_86(2:end,1));
provincia_87 = unique(provincias_87(2:end,1));
provincia_88 = unique(provincias_88(2:end,1));
provincia_89 = unique(provincias_89(2:end,1));
provincia_91 = unique(provincias_91(2:end,1));
provincia_92 = unique(provincias_92(2:end,1));
provincia_95 = unique(provincias_95(2:end,1));
provincia_100 = unique(provincias_100(2:end,1));
provincia_104 = unique(provincias_104(2:end,1));
provincia_105 = unique(provincias_105(2:end,1));
provincia_106 = unique(provincias_106(2:end,1));
provincia_107 = unique(provincias_107(2:end,1));
provincia_108 = unique(provincias_108(2:end,1));
provincia_112 = unique(provincias_112(2:end,1));
provincia_119 = unique(provincias_119(2:end,1));
provincia_125 = unique(provincias_125(2:end,1));
provincia_129 = unique(provincias_129(2:end,1));
provincia_130 = unique(provincias_130(2:end,1));
provincia_133 = unique(provincias_133(2:end,1));
provincia_139 = unique(provincias_139(2:end,1));
provincia_140 = unique(provincias_140(2:end,1));
provincia_141 = unique(provincias_141(2:end,1));
provincia_144 = unique(provincias_144(2:end,1));
provincia_149 = unique(provincias_149(2:end,1));
provincia_150 = unique(provincias_150(2:end,1));
provincia_152 = unique(provincias_152(2:end,1));
provincia_153 = unique(provincias_153(2:end,1));
provincia_157 = unique(provincias_157(2:end,1));
provincia_158 = unique(provincias_158(2:end,1));
provincia_159 = unique(provincias_159(2:end,1));
provincia_162 = unique(provincias_162(2:end,1));
provincia_169 = unique(provincias_169(2:end,1));

%% PARTE 3 GENERO LA VARIABLE PERIODO 
periodo = unique(data_1(:,1));
N = length(provincia_1);
T = 37;
S = length(periodo)-T;
%% PARTE 4 GENERO LA VARIABLE pobreza_j
pobreza_1 = reshape(data_1(:,2),T+S,N);
pobreza_7 = reshape(data_7(:,2),T+S,N);
pobreza_10 = reshape(data_10(:,2),T+S,N);
pobreza_16 = reshape(data_16(:,2),T+S,N);
pobreza_17 = reshape(data_17(:,2),T+S,N);
pobreza_18 = reshape(data_18(:,2),T+S,N);
pobreza_23 = reshape(data_23(:,2),T+S,N);
pobreza_26 = reshape(data_26(:,2),T+S,N);
pobreza_27 = reshape(data_27(:,2),T+S,N);
pobreza_38 = reshape(data_38(:,2),T+S,N);
pobreza_39 = reshape(data_39(:,2),T+S,N);
pobreza_41 = reshape(data_41(:,2),T+S,N);
pobreza_42 = reshape(data_42(:,2),T+S,N);
pobreza_44 = reshape(data_44(:,2),T+S,N);
pobreza_45 = reshape(data_45(:,2),T+S,N);
pobreza_55 = reshape(data_55(:,2),T+S,N);
pobreza_57 = reshape(data_57(:,2),T+S,N);
pobreza_65 = reshape(data_65(:,2),T+S,N);
pobreza_66 = reshape(data_66(:,2),T+S,N);
pobreza_71 = reshape(data_71(:,2),T+S,N);
pobreza_75 = reshape(data_75(:,2),T+S,N);
pobreza_76 = reshape(data_76(:,2),T+S,N);
pobreza_77 = reshape(data_77(:,2),T+S,N);
pobreza_78 = reshape(data_78(:,2),T+S,N);
pobreza_79 = reshape(data_79(:,2),T+S,N);
pobreza_80 = reshape(data_80(:,2),T+S,N);
pobreza_84 = reshape(data_84(:,2),T+S,N);
pobreza_86 = reshape(data_86(:,2),T+S,N);
pobreza_87 = reshape(data_87(:,2),T+S,N);
pobreza_88 = reshape(data_88(:,2),T+S,N);
pobreza_89 = reshape(data_89(:,2),T+S,N);
pobreza_91 = reshape(data_91(:,2),T+S,N);
pobreza_92 = reshape(data_92(:,2),T+S,N);
pobreza_95 = reshape(data_95(:,2),T+S,N);
pobreza_100 = reshape(data_100(:,2),T+S,N);
pobreza_104 = reshape(data_104(:,2),T+S,N);
pobreza_105 = reshape(data_105(:,2),T+S,N);
pobreza_106 = reshape(data_106(:,2),T+S,N);
pobreza_107 = reshape(data_107(:,2),T+S,N);
pobreza_108 = reshape(data_108(:,2),T+S,N);
pobreza_112 = reshape(data_112(:,2),T+S,N);
pobreza_119 = reshape(data_119(:,2),T+S,N);
pobreza_125 = reshape(data_125(:,2),T+S,N);
pobreza_129 = reshape(data_129(:,2),T+S,N);
pobreza_130 = reshape(data_130(:,2),T+S,N);
pobreza_133 = reshape(data_133(:,2),T+S,N);
pobreza_139 = reshape(data_139(:,2),T+S,N);
pobreza_140 = reshape(data_140(:,2),T+S,N);
pobreza_141 = reshape(data_141(:,2),T+S,N);
pobreza_144 = reshape(data_144(:,2),T+S,N);
pobreza_149 = reshape(data_149(:,2),T+S,N);
pobreza_150 = reshape(data_150(:,2),T+S,N);
pobreza_152 = reshape(data_152(:,2),T+S,N);
pobreza_153 = reshape(data_153(:,2),T+S,N);
pobreza_157 = reshape(data_157(:,2),T+S,N);
pobreza_158 = reshape(data_158(:,2),T+S,N);
pobreza_159 = reshape(data_159(:,2),T+S,N);
pobreza_162 = reshape(data_162(:,2),T+S,N);
pobreza_169 = reshape(data_169(:,2),T+S,N);

pobreza_1 = pobreza_1'; 
pobreza_7 = pobreza_7'; 
pobreza_10 = pobreza_10'; 
pobreza_16 = pobreza_16'; 
pobreza_17 = pobreza_17'; 
pobreza_18 = pobreza_18'; 
pobreza_23 = pobreza_23'; 
pobreza_26 = pobreza_26'; 
pobreza_27 = pobreza_27'; 
pobreza_38 = pobreza_38'; 
pobreza_39 = pobreza_39'; 
pobreza_41 = pobreza_41'; 
pobreza_42 = pobreza_42'; 
pobreza_44 = pobreza_44'; 
pobreza_45 = pobreza_45'; 
pobreza_55 = pobreza_55'; 
pobreza_57 = pobreza_57'; 
pobreza_65 = pobreza_65'; 
pobreza_66 = pobreza_66'; 
pobreza_71 = pobreza_71'; 
pobreza_75 = pobreza_75'; 
pobreza_76 = pobreza_76'; 
pobreza_77 = pobreza_77'; 
pobreza_78 = pobreza_78'; 
pobreza_79 = pobreza_79'; 
pobreza_80 = pobreza_80'; 
pobreza_84 = pobreza_84'; 
pobreza_86 = pobreza_86'; 
pobreza_87 = pobreza_87'; 
pobreza_88 = pobreza_88'; 
pobreza_89 = pobreza_89'; 
pobreza_91 = pobreza_91'; 
pobreza_92 = pobreza_92'; 
pobreza_95 = pobreza_95'; 
pobreza_100 = pobreza_100'; 
pobreza_104 = pobreza_104'; 
pobreza_105 = pobreza_105'; 
pobreza_106 = pobreza_106'; 
pobreza_107 = pobreza_107'; 
pobreza_108 = pobreza_108'; 
pobreza_112 = pobreza_112'; 
pobreza_119 = pobreza_119'; 
pobreza_125 = pobreza_125'; 
pobreza_129 = pobreza_129'; 
pobreza_130 = pobreza_130'; 
pobreza_133 = pobreza_133'; 
pobreza_139 = pobreza_139'; 
pobreza_140 = pobreza_140'; 
pobreza_141 = pobreza_141'; 
pobreza_144 = pobreza_144'; 
pobreza_149 = pobreza_149'; 
pobreza_150 = pobreza_150'; 
pobreza_152 = pobreza_152'; 
pobreza_153 = pobreza_153'; 
pobreza_157 = pobreza_157'; 
pobreza_158 = pobreza_158'; 
pobreza_159 = pobreza_159'; 
pobreza_162 = pobreza_162'; 
pobreza_169 = pobreza_169'; 

%% PARTE 5, CONSTRUYO LA VARIABLE OUTCOME OBSERVADA
tratado_1 = pobreza_1(1,:);
tratado_7 = pobreza_7(1,:);
tratado_10 = pobreza_10(1,:);
tratado_16 = pobreza_16(1,:);
tratado_17 = pobreza_17(1,:);
tratado_18 = pobreza_18(1,:);
tratado_23 = pobreza_23(1,:);
tratado_26 = pobreza_26(1,:);
tratado_27 = pobreza_27(1,:);
tratado_38 = pobreza_38(1,:);
tratado_39 = pobreza_39(1,:);
tratado_41 = pobreza_41(1,:);
tratado_42 = pobreza_42(1,:);
tratado_44 = pobreza_44(1,:);
tratado_45 = pobreza_45(1,:);
tratado_55 = pobreza_55(1,:);
tratado_57 = pobreza_57(1,:);
tratado_65 = pobreza_65(1,:);
tratado_66 = pobreza_66(1,:);
tratado_71 = pobreza_71(1,:);
tratado_75 = pobreza_75(1,:);
tratado_76 = pobreza_76(1,:);
tratado_77 = pobreza_77(1,:);
tratado_78 = pobreza_78(1,:);
tratado_79 = pobreza_79(1,:);
tratado_80 = pobreza_80(1,:);
tratado_84 = pobreza_84(1,:);
tratado_86 = pobreza_86(1,:);
tratado_87 = pobreza_87(1,:);
tratado_88 = pobreza_88(1,:);
tratado_89 = pobreza_89(1,:);
tratado_91 = pobreza_91(1,:);
tratado_92 = pobreza_92(1,:);
tratado_95 = pobreza_95(1,:);
tratado_100 = pobreza_100(1,:);
tratado_104 = pobreza_104(1,:);
tratado_105 = pobreza_105(1,:);
tratado_106 = pobreza_106(1,:);
tratado_107 = pobreza_107(1,:);
tratado_108 = pobreza_108(1,:);
tratado_112 = pobreza_112(1,:);
tratado_119 = pobreza_119(1,:);
tratado_125 = pobreza_125(1,:);
tratado_129 = pobreza_129(1,:);
tratado_130 = pobreza_130(1,:);
tratado_133 = pobreza_133(1,:);
tratado_139 = pobreza_139(1,:);
tratado_140 = pobreza_140(1,:);
tratado_141 = pobreza_141(1,:);
tratado_144 = pobreza_144(1,:);
tratado_149 = pobreza_149(1,:);
tratado_150 = pobreza_150(1,:);
tratado_152 = pobreza_152(1,:);
tratado_153 = pobreza_153(1,:);
tratado_157 = pobreza_157(1,:);
tratado_158 = pobreza_158(1,:);
tratado_159 = pobreza_159(1,:);
tratado_162 = pobreza_162(1,:);
tratado_169 = pobreza_169(1,:);

%% PARTE 6: ME QUEDO SOLO CON LOS OUTCOMES DE LOS CONTROLES
pobreza_1(1,:) = [];
pobreza_7(1,:) = [];
pobreza_10(1,:) = [];
pobreza_16(1,:) = [];
pobreza_17(1,:) = [];
pobreza_18(1,:) = [];
pobreza_23(1,:) = [];
pobreza_26(1,:) = [];
pobreza_27(1,:) = [];
pobreza_38(1,:) = [];
pobreza_39(1,:) = [];
pobreza_41(1,:) = [];
pobreza_42(1,:) = [];
pobreza_44(1,:) = [];
pobreza_45(1,:) = [];
pobreza_55(1,:) = [];
pobreza_57(1,:) = [];
pobreza_65(1,:) = [];
pobreza_66(1,:) = [];
pobreza_71(1,:) = [];
pobreza_75(1,:) = [];
pobreza_76(1,:) = [];
pobreza_77(1,:) = [];
pobreza_78(1,:) = [];
pobreza_79(1,:) = [];
pobreza_80(1,:) = [];
pobreza_84(1,:) = [];
pobreza_86(1,:) = [];
pobreza_87(1,:) = [];
pobreza_88(1,:) = [];
pobreza_89(1,:) = [];
pobreza_91(1,:) = [];
pobreza_92(1,:) = [];
pobreza_95(1,:) = [];
pobreza_100(1,:) = [];
pobreza_104(1,:) = [];
pobreza_105(1,:) = [];
pobreza_106(1,:) = [];
pobreza_107(1,:) = [];
pobreza_108(1,:) = [];
pobreza_112(1,:) = [];
pobreza_119(1,:) = [];
pobreza_125(1,:) = [];
pobreza_129(1,:) = [];
pobreza_130(1,:) = [];
pobreza_133(1,:) = [];
pobreza_139(1,:) = [];
pobreza_140(1,:) = [];
pobreza_141(1,:) = [];
pobreza_144(1,:) = [];
pobreza_149(1,:) = [];
pobreza_150(1,:) = [];
pobreza_152(1,:) = [];
pobreza_153(1,:) = [];
pobreza_157(1,:) = [];
pobreza_158(1,:) = [];
pobreza_159(1,:) = [];
pobreza_162(1,:) = [];
pobreza_169(1,:) = [];

%% PARTE 7
pobreza_1 = [tratado_1;pobreza_1];
pobreza_7 = [tratado_7;pobreza_7];
pobreza_10 = [tratado_10;pobreza_10];
pobreza_16 = [tratado_16;pobreza_16];
pobreza_17 = [tratado_17;pobreza_17];
pobreza_18 = [tratado_18;pobreza_18];
pobreza_23 = [tratado_23;pobreza_23];
pobreza_26 = [tratado_26;pobreza_26];
pobreza_27 = [tratado_27;pobreza_27];
pobreza_38 = [tratado_38;pobreza_38];
pobreza_39 = [tratado_39;pobreza_39];
pobreza_41 = [tratado_41;pobreza_41];
pobreza_42 = [tratado_42;pobreza_42];
pobreza_44 = [tratado_44;pobreza_44];
pobreza_45 = [tratado_45;pobreza_45];
pobreza_55 = [tratado_55;pobreza_55];
pobreza_57 = [tratado_57;pobreza_57];
pobreza_65 = [tratado_65;pobreza_65];
pobreza_66 = [tratado_66;pobreza_66];
pobreza_71 = [tratado_71;pobreza_71];
pobreza_75 = [tratado_75;pobreza_75];
pobreza_76 = [tratado_76;pobreza_76];
pobreza_77 = [tratado_77;pobreza_77];
pobreza_78 = [tratado_78;pobreza_78];
pobreza_79 = [tratado_79;pobreza_79];
pobreza_80 = [tratado_80;pobreza_80];
pobreza_84 = [tratado_84;pobreza_84];
pobreza_86 = [tratado_86;pobreza_86];
pobreza_87 = [tratado_87;pobreza_87];
pobreza_88 = [tratado_88;pobreza_88];
pobreza_89 = [tratado_89;pobreza_89];
pobreza_91 = [tratado_91;pobreza_91];
pobreza_92 = [tratado_92;pobreza_92];
pobreza_95 = [tratado_95;pobreza_95];
pobreza_100 = [tratado_100;pobreza_100];
pobreza_104 = [tratado_104;pobreza_104];
pobreza_105 = [tratado_105;pobreza_105];
pobreza_106 = [tratado_106;pobreza_106];
pobreza_107 = [tratado_107;pobreza_107];
pobreza_108 = [tratado_108;pobreza_108];
pobreza_112 = [tratado_112;pobreza_112];
pobreza_119 = [tratado_119;pobreza_119];
pobreza_125 = [tratado_125;pobreza_125];
pobreza_129 = [tratado_129;pobreza_129];
pobreza_130 = [tratado_130;pobreza_130];
pobreza_133 = [tratado_133;pobreza_133];
pobreza_139 = [tratado_139;pobreza_139];
pobreza_140 = [tratado_140;pobreza_140];
pobreza_141 = [tratado_141;pobreza_141];
pobreza_144 = [tratado_144;pobreza_144];
pobreza_149 = [tratado_149;pobreza_149];
pobreza_150 = [tratado_150;pobreza_150];
pobreza_152 = [tratado_152;pobreza_152];
pobreza_153 = [tratado_153;pobreza_153];
pobreza_157 = [tratado_157;pobreza_157];
pobreza_158 = [tratado_158;pobreza_158];
pobreza_159 = [tratado_159;pobreza_159];
pobreza_162 = [tratado_162;pobreza_162];
pobreza_169 = [tratado_169;pobreza_169];


%% PARTE 8: GENERO LA MATRIZ Y DE OUTCOME
Y_1 = pobreza_1; % outcome matrix
Y_7 = pobreza_7; % outcome matrix
Y_10 = pobreza_10; % outcome matrix
Y_16 = pobreza_16; % outcome matrix
Y_17 = pobreza_17; % outcome matrix
Y_18 = pobreza_18; % outcome matrix
Y_23 = pobreza_23; % outcome matrix
Y_26 = pobreza_26; % outcome matrix
Y_27 = pobreza_27; % outcome matrix
Y_38 = pobreza_38; % outcome matrix
Y_39 = pobreza_39; % outcome matrix
Y_41 = pobreza_41; % outcome matrix
Y_42 = pobreza_42; % outcome matrix
Y_44 = pobreza_44; % outcome matrix
Y_45 = pobreza_45; % outcome matrix
Y_55 = pobreza_55; % outcome matrix
Y_57 = pobreza_57; % outcome matrix
Y_65 = pobreza_65; % outcome matrix
Y_66 = pobreza_66; % outcome matrix
Y_71 = pobreza_71; % outcome matrix
Y_75 = pobreza_75; % outcome matrix
Y_76 = pobreza_76; % outcome matrix
Y_77 = pobreza_77; % outcome matrix
Y_78 = pobreza_78; % outcome matrix
Y_79 = pobreza_79; % outcome matrix
Y_80 = pobreza_80; % outcome matrix
Y_84 = pobreza_84; % outcome matrix
Y_86 = pobreza_86; % outcome matrix
Y_87 = pobreza_87; % outcome matrix
Y_88 = pobreza_88; % outcome matrix
Y_89 = pobreza_89; % outcome matrix
Y_91 = pobreza_91; % outcome matrix
Y_92 = pobreza_92; % outcome matrix
Y_95 = pobreza_95; % outcome matrix
Y_100 = pobreza_100; % outcome matrix
Y_104 = pobreza_104; % outcome matrix
Y_105 = pobreza_105; % outcome matrix
Y_106 = pobreza_106; % outcome matrix
Y_107 = pobreza_107; % outcome matrix
Y_108 = pobreza_108; % outcome matrix
Y_112 = pobreza_112; % outcome matrix
Y_119 = pobreza_119; % outcome matrix
Y_125 = pobreza_125; % outcome matrix
Y_129 = pobreza_129; % outcome matrix
Y_130 = pobreza_130; % outcome matrix
Y_133 = pobreza_133; % outcome matrix
Y_139 = pobreza_139; % outcome matrix
Y_140 = pobreza_140; % outcome matrix
Y_141 = pobreza_141; % outcome matrix
Y_144 = pobreza_144; % outcome matrix
Y_149 = pobreza_149; % outcome matrix
Y_150 = pobreza_150; % outcome matrix
Y_152 = pobreza_152; % outcome matrix
Y_153 = pobreza_153; % outcome matrix
Y_157 = pobreza_157; % outcome matrix
Y_158 = pobreza_158; % outcome matrix
Y_159 = pobreza_159; % outcome matrix
Y_162 = pobreza_162; % outcome matrix
Y_169 = pobreza_169; % outcome matrix

%% PARTE 9 GEENERO LA MATRIX PRE Y POS TRATAMIENTO
Y_pre_1 = Y_1(:,1:T);
Y_pre_7 = Y_7(:,1:T);
Y_pre_10 = Y_10(:,1:T);
Y_pre_16 = Y_16(:,1:T);
Y_pre_17 = Y_17(:,1:T);
Y_pre_18 = Y_18(:,1:T);
Y_pre_23 = Y_23(:,1:T);
Y_pre_26 = Y_26(:,1:T);
Y_pre_27 = Y_27(:,1:T);
Y_pre_38 = Y_38(:,1:T);
Y_pre_39 = Y_39(:,1:T);
Y_pre_41 = Y_41(:,1:T);
Y_pre_42 = Y_42(:,1:T);
Y_pre_44 = Y_44(:,1:T);
Y_pre_45 = Y_45(:,1:T);
Y_pre_55 = Y_55(:,1:T);
Y_pre_57 = Y_57(:,1:T);
Y_pre_65 = Y_65(:,1:T);
Y_pre_66 = Y_66(:,1:T);
Y_pre_71 = Y_71(:,1:T);
Y_pre_75 = Y_75(:,1:T);
Y_pre_76 = Y_76(:,1:T);
Y_pre_77 = Y_77(:,1:T);
Y_pre_78 = Y_78(:,1:T);
Y_pre_79 = Y_79(:,1:T);
Y_pre_80 = Y_80(:,1:T);
Y_pre_84 = Y_84(:,1:T);
Y_pre_86 = Y_86(:,1:T);
Y_pre_87 = Y_87(:,1:T);
Y_pre_88 = Y_88(:,1:T);
Y_pre_89 = Y_89(:,1:T);
Y_pre_91 = Y_91(:,1:T);
Y_pre_92 = Y_92(:,1:T);
Y_pre_95 = Y_95(:,1:T);
Y_pre_100 = Y_100(:,1:T);
Y_pre_104 = Y_104(:,1:T);
Y_pre_105 = Y_105(:,1:T);
Y_pre_106 = Y_106(:,1:T);
Y_pre_107 = Y_107(:,1:T);
Y_pre_108 = Y_108(:,1:T);
Y_pre_112 = Y_112(:,1:T);
Y_pre_119 = Y_119(:,1:T);
Y_pre_125 = Y_125(:,1:T);
Y_pre_129 = Y_129(:,1:T);
Y_pre_130 = Y_130(:,1:T);
Y_pre_133 = Y_133(:,1:T);
Y_pre_139 = Y_139(:,1:T);
Y_pre_140 = Y_140(:,1:T);
Y_pre_141 = Y_141(:,1:T);
Y_pre_144 = Y_144(:,1:T);
Y_pre_149 = Y_149(:,1:T);
Y_pre_150 = Y_150(:,1:T);
Y_pre_152 = Y_152(:,1:T);
Y_pre_153 = Y_153(:,1:T);
Y_pre_157 = Y_157(:,1:T);
Y_pre_158 = Y_158(:,1:T);
Y_pre_159 = Y_159(:,1:T);
Y_pre_162 = Y_162(:,1:T);
Y_pre_169 = Y_169(:,1:T);

Y_post_1 = Y_1(:,T+1:end);
Y_post_7 = Y_7(:,T+1:end);
Y_post_10 = Y_10(:,T+1:end);
Y_post_16 = Y_16(:,T+1:end);
Y_post_17 = Y_17(:,T+1:end);
Y_post_18 = Y_18(:,T+1:end);
Y_post_23 = Y_23(:,T+1:end);
Y_post_26 = Y_26(:,T+1:end);
Y_post_27 = Y_27(:,T+1:end);
Y_post_38 = Y_38(:,T+1:end);
Y_post_39 = Y_39(:,T+1:end);
Y_post_41 = Y_41(:,T+1:end);
Y_post_42 = Y_42(:,T+1:end);
Y_post_44 = Y_44(:,T+1:end);
Y_post_45 = Y_45(:,T+1:end);
Y_post_55 = Y_55(:,T+1:end);
Y_post_57 = Y_57(:,T+1:end);
Y_post_65 = Y_65(:,T+1:end);
Y_post_66 = Y_66(:,T+1:end);
Y_post_71 = Y_71(:,T+1:end);
Y_post_75 = Y_75(:,T+1:end);
Y_post_76 = Y_76(:,T+1:end);
Y_post_77 = Y_77(:,T+1:end);
Y_post_78 = Y_78(:,T+1:end);
Y_post_79 = Y_79(:,T+1:end);
Y_post_80 = Y_80(:,T+1:end);
Y_post_84 = Y_84(:,T+1:end);
Y_post_86 = Y_86(:,T+1:end);
Y_post_87 = Y_87(:,T+1:end);
Y_post_88 = Y_88(:,T+1:end);
Y_post_89 = Y_89(:,T+1:end);
Y_post_91 = Y_91(:,T+1:end);
Y_post_92 = Y_92(:,T+1:end);
Y_post_95 = Y_95(:,T+1:end);
Y_post_100 = Y_100(:,T+1:end);
Y_post_104 = Y_104(:,T+1:end);
Y_post_105 = Y_105(:,T+1:end);
Y_post_106 = Y_106(:,T+1:end);
Y_post_107 = Y_107(:,T+1:end);
Y_post_108 = Y_108(:,T+1:end);
Y_post_112 = Y_112(:,T+1:end);
Y_post_119 = Y_119(:,T+1:end);
Y_post_125 = Y_125(:,T+1:end);
Y_post_129 = Y_129(:,T+1:end);
Y_post_130 = Y_130(:,T+1:end);
Y_post_133 = Y_133(:,T+1:end);
Y_post_139 = Y_139(:,T+1:end);
Y_post_140 = Y_140(:,T+1:end);
Y_post_141 = Y_141(:,T+1:end);
Y_post_144 = Y_144(:,T+1:end);
Y_post_149 = Y_149(:,T+1:end);
Y_post_150 = Y_150(:,T+1:end);
Y_post_152 = Y_152(:,T+1:end);
Y_post_153 = Y_153(:,T+1:end);
Y_post_157 = Y_157(:,T+1:end);
Y_post_158 = Y_158(:,T+1:end);
Y_post_159 = Y_159(:,T+1:end);
Y_post_162 = Y_162(:,T+1:end);
Y_post_169 = Y_169(:,T+1:end);


%% PARTE 10: CONTROL SINTÉTICO 
[a_hat_1,B_hat_1] = scm_batch(Y_pre_1);
[a_hat_7,B_hat_7] = scm_batch(Y_pre_7);
[a_hat_10,B_hat_10] = scm_batch(Y_pre_10);
[a_hat_16,B_hat_16] = scm_batch(Y_pre_16);
[a_hat_17,B_hat_17] = scm_batch(Y_pre_17);
[a_hat_18,B_hat_18] = scm_batch(Y_pre_18);
[a_hat_23,B_hat_23] = scm_batch(Y_pre_23);
[a_hat_26,B_hat_26] = scm_batch(Y_pre_26);
[a_hat_27,B_hat_27] = scm_batch(Y_pre_27);
[a_hat_38,B_hat_38] = scm_batch(Y_pre_38);
[a_hat_39,B_hat_39] = scm_batch(Y_pre_39);
[a_hat_41,B_hat_41] = scm_batch(Y_pre_41);
[a_hat_42,B_hat_42] = scm_batch(Y_pre_42);
[a_hat_44,B_hat_44] = scm_batch(Y_pre_44);
[a_hat_45,B_hat_45] = scm_batch(Y_pre_45);
[a_hat_55,B_hat_55] = scm_batch(Y_pre_55);
[a_hat_57,B_hat_57] = scm_batch(Y_pre_57);
[a_hat_65,B_hat_65] = scm_batch(Y_pre_65);
[a_hat_66,B_hat_66] = scm_batch(Y_pre_66);
[a_hat_71,B_hat_71] = scm_batch(Y_pre_71);
[a_hat_75,B_hat_75] = scm_batch(Y_pre_75);
[a_hat_76,B_hat_76] = scm_batch(Y_pre_76);
[a_hat_77,B_hat_77] = scm_batch(Y_pre_77);
[a_hat_78,B_hat_78] = scm_batch(Y_pre_78);
[a_hat_79,B_hat_79] = scm_batch(Y_pre_79);
[a_hat_80,B_hat_80] = scm_batch(Y_pre_80);
[a_hat_84,B_hat_84] = scm_batch(Y_pre_84);
[a_hat_86,B_hat_86] = scm_batch(Y_pre_86);
[a_hat_87,B_hat_87] = scm_batch(Y_pre_87);
[a_hat_88,B_hat_88] = scm_batch(Y_pre_88);
[a_hat_89,B_hat_89] = scm_batch(Y_pre_89);
[a_hat_91,B_hat_91] = scm_batch(Y_pre_91);
[a_hat_92,B_hat_92] = scm_batch(Y_pre_92);
[a_hat_95,B_hat_95] = scm_batch(Y_pre_95);
[a_hat_100,B_hat_100] = scm_batch(Y_pre_100);
[a_hat_104,B_hat_104] = scm_batch(Y_pre_104);
[a_hat_105,B_hat_105] = scm_batch(Y_pre_105);
[a_hat_106,B_hat_106] = scm_batch(Y_pre_106);
[a_hat_107,B_hat_107] = scm_batch(Y_pre_107);
[a_hat_108,B_hat_108] = scm_batch(Y_pre_108);
[a_hat_112,B_hat_112] = scm_batch(Y_pre_112);
[a_hat_119,B_hat_119] = scm_batch(Y_pre_119);
[a_hat_125,B_hat_125] = scm_batch(Y_pre_125);
[a_hat_129,B_hat_129] = scm_batch(Y_pre_129);
[a_hat_130,B_hat_130] = scm_batch(Y_pre_130);
[a_hat_133,B_hat_133] = scm_batch(Y_pre_133);
[a_hat_139,B_hat_139] = scm_batch(Y_pre_139);
[a_hat_140,B_hat_140] = scm_batch(Y_pre_140);
[a_hat_141,B_hat_141] = scm_batch(Y_pre_141);
[a_hat_144,B_hat_144] = scm_batch(Y_pre_144);
[a_hat_149,B_hat_149] = scm_batch(Y_pre_149);
[a_hat_150,B_hat_150] = scm_batch(Y_pre_150);
[a_hat_152,B_hat_152] = scm_batch(Y_pre_152);
[a_hat_153,B_hat_153] = scm_batch(Y_pre_153);
[a_hat_157,B_hat_157] = scm_batch(Y_pre_157);
[a_hat_158,B_hat_158] = scm_batch(Y_pre_158);
[a_hat_159,B_hat_159] = scm_batch(Y_pre_159);
[a_hat_162,B_hat_162] = scm_batch(Y_pre_162);
[a_hat_169,B_hat_169] = scm_batch(Y_pre_169);


synthetic_control_1 = a_hat_1(1)+B_hat_1(1,:)*Y_1;
synthetic_control_7 = a_hat_7(1)+B_hat_7(1,:)*Y_7;
synthetic_control_10 = a_hat_10(1)+B_hat_10(1,:)*Y_10;
synthetic_control_16 = a_hat_16(1)+B_hat_16(1,:)*Y_16;
synthetic_control_17 = a_hat_17(1)+B_hat_17(1,:)*Y_17;
synthetic_control_18 = a_hat_18(1)+B_hat_18(1,:)*Y_18;
synthetic_control_23 = a_hat_23(1)+B_hat_23(1,:)*Y_23;
synthetic_control_26 = a_hat_26(1)+B_hat_26(1,:)*Y_26;
synthetic_control_27 = a_hat_27(1)+B_hat_27(1,:)*Y_27;
synthetic_control_38 = a_hat_38(1)+B_hat_38(1,:)*Y_38;
synthetic_control_39 = a_hat_39(1)+B_hat_39(1,:)*Y_39;
synthetic_control_41 = a_hat_41(1)+B_hat_41(1,:)*Y_41;
synthetic_control_42 = a_hat_42(1)+B_hat_42(1,:)*Y_42;
synthetic_control_44 = a_hat_44(1)+B_hat_44(1,:)*Y_44;
synthetic_control_45 = a_hat_45(1)+B_hat_45(1,:)*Y_45;
synthetic_control_55 = a_hat_55(1)+B_hat_55(1,:)*Y_55;
synthetic_control_57 = a_hat_57(1)+B_hat_57(1,:)*Y_57;
synthetic_control_65 = a_hat_65(1)+B_hat_65(1,:)*Y_65;
synthetic_control_66 = a_hat_66(1)+B_hat_66(1,:)*Y_66;
synthetic_control_71 = a_hat_71(1)+B_hat_71(1,:)*Y_71;
synthetic_control_75 = a_hat_75(1)+B_hat_75(1,:)*Y_75;
synthetic_control_76 = a_hat_76(1)+B_hat_76(1,:)*Y_76;
synthetic_control_77 = a_hat_77(1)+B_hat_77(1,:)*Y_77;
synthetic_control_78 = a_hat_78(1)+B_hat_78(1,:)*Y_78;
synthetic_control_79 = a_hat_79(1)+B_hat_79(1,:)*Y_79;
synthetic_control_80 = a_hat_80(1)+B_hat_80(1,:)*Y_80;
synthetic_control_84 = a_hat_84(1)+B_hat_84(1,:)*Y_84;
synthetic_control_86 = a_hat_86(1)+B_hat_86(1,:)*Y_86;
synthetic_control_87 = a_hat_87(1)+B_hat_87(1,:)*Y_87;
synthetic_control_88 = a_hat_88(1)+B_hat_88(1,:)*Y_88;
synthetic_control_89 = a_hat_89(1)+B_hat_89(1,:)*Y_89;
synthetic_control_91 = a_hat_91(1)+B_hat_91(1,:)*Y_91;
synthetic_control_92 = a_hat_92(1)+B_hat_92(1,:)*Y_92;
synthetic_control_95 = a_hat_95(1)+B_hat_95(1,:)*Y_95;
synthetic_control_100 = a_hat_100(1)+B_hat_100(1,:)*Y_100;
synthetic_control_104 = a_hat_104(1)+B_hat_104(1,:)*Y_104;
synthetic_control_105 = a_hat_105(1)+B_hat_105(1,:)*Y_105;
synthetic_control_106 = a_hat_106(1)+B_hat_106(1,:)*Y_106;
synthetic_control_107 = a_hat_107(1)+B_hat_107(1,:)*Y_107;
synthetic_control_108 = a_hat_108(1)+B_hat_108(1,:)*Y_108;
synthetic_control_112 = a_hat_112(1)+B_hat_112(1,:)*Y_112;
synthetic_control_119 = a_hat_119(1)+B_hat_119(1,:)*Y_119;
synthetic_control_125 = a_hat_125(1)+B_hat_125(1,:)*Y_125;
synthetic_control_129 = a_hat_129(1)+B_hat_129(1,:)*Y_129;
synthetic_control_130 = a_hat_130(1)+B_hat_130(1,:)*Y_130;
synthetic_control_133 = a_hat_133(1)+B_hat_133(1,:)*Y_133;
synthetic_control_139 = a_hat_139(1)+B_hat_139(1,:)*Y_139;
synthetic_control_140 = a_hat_140(1)+B_hat_140(1,:)*Y_140;
synthetic_control_141 = a_hat_141(1)+B_hat_141(1,:)*Y_141;
synthetic_control_144 = a_hat_144(1)+B_hat_144(1,:)*Y_144;
synthetic_control_149 = a_hat_149(1)+B_hat_149(1,:)*Y_149;
synthetic_control_150 = a_hat_150(1)+B_hat_150(1,:)*Y_150;
synthetic_control_152 = a_hat_152(1)+B_hat_152(1,:)*Y_152;
synthetic_control_153 = a_hat_153(1)+B_hat_153(1,:)*Y_153;
synthetic_control_157 = a_hat_157(1)+B_hat_157(1,:)*Y_157;
synthetic_control_158 = a_hat_158(1)+B_hat_158(1,:)*Y_158;
synthetic_control_159 = a_hat_159(1)+B_hat_159(1,:)*Y_159;
synthetic_control_162 = a_hat_162(1)+B_hat_162(1,:)*Y_162;
synthetic_control_169 = a_hat_169(1)+B_hat_169(1,:)*Y_169;




%% PARTE 11: MATRIZ DE SPILLOVERS 
%A_1
% Provincia_1
ind_1 = xlsread('spillover_bajo_niv_educ_1.xlsx')
A_1 = eye(N);
A_1(:,ind_1 == 0) = [];
%A_7
% Provincia_7
ind_7 = xlsread('spillover_bajo_niv_educ_7.xlsx')
A_7 = eye(N);
A_7(:,ind_7 == 0) = [];
%A_10
% Provincia_10
ind_10 = xlsread('spillover_bajo_niv_educ_10.xlsx')
A_10 = eye(N);
A_10(:,ind_10 == 0) = [];
%A_16
% Provincia_16
ind_16 = xlsread('spillover_bajo_niv_educ_16.xlsx')
A_16 = eye(N);
A_16(:,ind_16 == 0) = [];
%A_17
% Provincia_17
ind_17 = xlsread('spillover_bajo_niv_educ_17.xlsx')
A_17 = eye(N);
A_17(:,ind_17 == 0) = [];
%A_18
% Provincia_18
ind_18 = xlsread('spillover_bajo_niv_educ_18.xlsx')
A_18 = eye(N);
A_18(:,ind_18 == 0) = [];
%A_23
% Provincia_23
ind_23 = xlsread('spillover_bajo_niv_educ_23.xlsx')
A_23 = eye(N);
A_23(:,ind_23 == 0) = [];
%A_26
% Provincia_26
ind_26 = xlsread('spillover_bajo_niv_educ_26.xlsx')
A_26 = eye(N);
A_26(:,ind_26 == 0) = [];
%A_27
% Provincia_27
ind_27 = xlsread('spillover_bajo_niv_educ_27.xlsx')
A_27 = eye(N);
A_27(:,ind_27 == 0) = [];
%A_38
% Provincia_38
ind_38 = xlsread('spillover_bajo_niv_educ_38.xlsx')
A_38 = eye(N);
A_38(:,ind_38 == 0) = [];
%A_39
% Provincia_39
ind_39 = xlsread('spillover_bajo_niv_educ_39.xlsx')
A_39 = eye(N);
A_39(:,ind_39 == 0) = [];
%A_41
% Provincia_41
ind_41 = xlsread('spillover_bajo_niv_educ_41.xlsx')
A_41 = eye(N);
A_41(:,ind_41 == 0) = [];
%A_42
% Provincia_42
ind_42 = xlsread('spillover_bajo_niv_educ_42.xlsx')
A_42 = eye(N);
A_42(:,ind_42 == 0) = [];
%A_44
% Provincia_44
ind_44 = xlsread('spillover_bajo_niv_educ_44.xlsx')
A_44 = eye(N);
A_44(:,ind_44 == 0) = [];
%A_45
% Provincia_45
ind_45 = xlsread('spillover_bajo_niv_educ_45.xlsx')
A_45 = eye(N);
A_45(:,ind_45 == 0) = [];
%A_55
% Provincia_55
ind_55 = xlsread('spillover_bajo_niv_educ_55.xlsx')
A_55 = eye(N);
A_55(:,ind_55 == 0) = [];
%A_57
% Provincia_57
ind_57 = xlsread('spillover_bajo_niv_educ_57.xlsx')
A_57 = eye(N);
A_57(:,ind_57 == 0) = [];
%A_65
% Provincia_65
ind_65 = xlsread('spillover_bajo_niv_educ_65.xlsx')
A_65 = eye(N);
A_65(:,ind_65 == 0) = [];
%A_66
% Provincia_66
ind_66 = xlsread('spillover_bajo_niv_educ_66.xlsx')
A_66 = eye(N);
A_66(:,ind_66 == 0) = [];
%A_71
% Provincia_71
ind_71 = xlsread('spillover_bajo_niv_educ_71.xlsx')
A_71 = eye(N);
A_71(:,ind_71 == 0) = [];
%A_75
% Provincia_75
ind_75 = xlsread('spillover_bajo_niv_educ_75.xlsx')
A_75 = eye(N);
A_75(:,ind_75 == 0) = [];
%A_76
% Provincia_76
ind_76 = xlsread('spillover_bajo_niv_educ_76.xlsx')
A_76 = eye(N);
A_76(:,ind_76 == 0) = [];
%A_77
% Provincia_77
ind_77 = xlsread('spillover_bajo_niv_educ_77.xlsx')
A_77 = eye(N);
A_77(:,ind_77 == 0) = [];
%A_78
% Provincia_78
ind_78 = xlsread('spillover_bajo_niv_educ_78.xlsx')
A_78 = eye(N);
A_78(:,ind_78 == 0) = [];
%A_79
% Provincia_79
ind_79 = xlsread('spillover_bajo_niv_educ_79.xlsx')
A_79 = eye(N);
A_79(:,ind_79 == 0) = [];
%A_80
% Provincia_80
ind_80 = xlsread('spillover_bajo_niv_educ_80.xlsx')
A_80 = eye(N);
A_80(:,ind_80 == 0) = [];
%A_84
% Provincia_84
ind_84 = xlsread('spillover_bajo_niv_educ_84.xlsx')
A_84 = eye(N);
A_84(:,ind_84 == 0) = [];
%A_86
% Provincia_86
ind_86 = xlsread('spillover_bajo_niv_educ_86.xlsx')
A_86 = eye(N);
A_86(:,ind_86 == 0) = [];
%A_87
% Provincia_87
ind_87 = xlsread('spillover_bajo_niv_educ_87.xlsx')
A_87 = eye(N);
A_87(:,ind_87 == 0) = [];
%A_88
% Provincia_88
ind_88 = xlsread('spillover_bajo_niv_educ_88.xlsx')
A_88 = eye(N);
A_88(:,ind_88 == 0) = [];
%A_89
% Provincia_89
ind_89 = xlsread('spillover_bajo_niv_educ_89.xlsx')
A_89 = eye(N);
A_89(:,ind_89 == 0) = [];
%A_91
% Provincia_91
ind_91 = xlsread('spillover_bajo_niv_educ_91.xlsx')
A_91 = eye(N);
A_91(:,ind_91 == 0) = [];
%A_92
% Provincia_92
ind_92 = xlsread('spillover_bajo_niv_educ_92.xlsx')
A_92 = eye(N);
A_92(:,ind_92 == 0) = [];
%A_95
% Provincia_95
ind_95 = xlsread('spillover_bajo_niv_educ_95.xlsx')
A_95 = eye(N);
A_95(:,ind_95 == 0) = [];
%A_100
% Provincia_100
ind_100 = xlsread('spillover_bajo_niv_educ_100.xlsx')
A_100 = eye(N);
A_100(:,ind_100 == 0) = [];
%A_104
% Provincia_104
ind_104 = xlsread('spillover_bajo_niv_educ_104.xlsx')
A_104 = eye(N);
A_104(:,ind_104 == 0) = [];
%A_105
% Provincia_105
ind_105 = xlsread('spillover_bajo_niv_educ_105.xlsx')
A_105 = eye(N);
A_105(:,ind_105 == 0) = [];
%A_106
% Provincia_106
ind_106 = xlsread('spillover_bajo_niv_educ_106.xlsx')
A_106 = eye(N);
A_106(:,ind_106 == 0) = [];
%A_107
% Provincia_107
ind_107 = xlsread('spillover_bajo_niv_educ_107.xlsx')
A_107 = eye(N);
A_107(:,ind_107 == 0) = [];
%A_108
% Provincia_108
ind_108 = xlsread('spillover_bajo_niv_educ_108.xlsx')
A_108 = eye(N);
A_108(:,ind_108 == 0) = [];
%A_112
% Provincia_112
ind_112 = xlsread('spillover_bajo_niv_educ_112.xlsx')
A_112 = eye(N);
A_112(:,ind_112 == 0) = [];
%A_119
% Provincia_119
ind_119 = xlsread('spillover_bajo_niv_educ_119.xlsx')
A_119 = eye(N);
A_119(:,ind_119 == 0) = [];
%A_125
% Provincia_125
ind_125 = xlsread('spillover_bajo_niv_educ_125.xlsx')
A_125 = eye(N);
A_125(:,ind_125 == 0) = [];
%A_129
% Provincia_129
ind_129 = xlsread('spillover_bajo_niv_educ_129.xlsx')
A_129 = eye(N);
A_129(:,ind_129 == 0) = [];
%A_130
% Provincia_130
ind_130 = xlsread('spillover_bajo_niv_educ_130.xlsx')
A_130 = eye(N);
A_130(:,ind_130 == 0) = [];
%A_133
% Provincia_133
ind_133 = xlsread('spillover_bajo_niv_educ_133.xlsx')
A_133 = eye(N);
A_133(:,ind_133 == 0) = [];
%A_139
% Provincia_139
ind_139 = xlsread('spillover_bajo_niv_educ_139.xlsx')
A_139 = eye(N);
A_139(:,ind_139 == 0) = [];
%A_140
% Provincia_140
ind_140 = xlsread('spillover_bajo_niv_educ_140.xlsx')
A_140 = eye(N);
A_140(:,ind_140 == 0) = [];
%A_141
% Provincia_141
ind_141 = xlsread('spillover_bajo_niv_educ_141.xlsx')
A_141 = eye(N);
A_141(:,ind_141 == 0) = [];
%A_144
% Provincia_144
ind_144 = xlsread('spillover_bajo_niv_educ_144.xlsx')
A_144 = eye(N);
A_144(:,ind_144 == 0) = [];
%A_149
% Provincia_149
ind_149 = xlsread('spillover_bajo_niv_educ_149.xlsx')
A_149 = eye(N);
A_149(:,ind_149 == 0) = [];
%A_150
% Provincia_150
ind_150 = xlsread('spillover_bajo_niv_educ_150.xlsx')
A_150 = eye(N);
A_150(:,ind_150 == 0) = [];
%A_152
% Provincia_152
ind_152 = xlsread('spillover_bajo_niv_educ_152.xlsx')
A_152 = eye(N);
A_152(:,ind_152 == 0) = [];
%A_153
% Provincia_153
ind_153 = xlsread('spillover_bajo_niv_educ_153.xlsx')
A_153 = eye(N);
A_153(:,ind_153 == 0) = [];
%A_157
% Provincia_157
ind_157 = xlsread('spillover_bajo_niv_educ_157.xlsx')
A_157 = eye(N);
A_157(:,ind_157 == 0) = [];
%A_158
% Provincia_158
ind_158 = xlsread('spillover_bajo_niv_educ_158.xlsx')
A_158 = eye(N);
A_158(:,ind_158 == 0) = [];
%A_159
% Provincia_159
ind_159 = xlsread('spillover_bajo_niv_educ_159.xlsx')
A_159 = eye(N);
A_159(:,ind_159 == 0) = [];
%A_162
% Provincia_162
ind_162 = xlsread('spillover_bajo_niv_educ_162.xlsx')
A_162 = eye(N);
A_162(:,ind_162 == 0) = [];
%A_169
% Provincia_169
ind_169 = xlsread('spillover_bajo_niv_educ_169.xlsx')
A_169 = eye(N);
A_169(:,ind_169 == 0) = [];




%% PARTE 12: GENERO LA MATRIZ M=(I-B)'(I-B)

M_hat_1 = (eye(N)-B_hat_1)'*(eye(N)-B_hat_1);
M_hat_7 = (eye(N)-B_hat_7)'*(eye(N)-B_hat_7);
M_hat_10 = (eye(N)-B_hat_10)'*(eye(N)-B_hat_10);
M_hat_16 = (eye(N)-B_hat_16)'*(eye(N)-B_hat_16);
M_hat_17 = (eye(N)-B_hat_17)'*(eye(N)-B_hat_17);
M_hat_18 = (eye(N)-B_hat_18)'*(eye(N)-B_hat_18);
M_hat_23 = (eye(N)-B_hat_23)'*(eye(N)-B_hat_23);
M_hat_26 = (eye(N)-B_hat_26)'*(eye(N)-B_hat_26);
M_hat_27 = (eye(N)-B_hat_27)'*(eye(N)-B_hat_27);
M_hat_38 = (eye(N)-B_hat_38)'*(eye(N)-B_hat_38);
M_hat_39 = (eye(N)-B_hat_39)'*(eye(N)-B_hat_39);
M_hat_41 = (eye(N)-B_hat_41)'*(eye(N)-B_hat_41);
M_hat_42 = (eye(N)-B_hat_42)'*(eye(N)-B_hat_42);
M_hat_44 = (eye(N)-B_hat_44)'*(eye(N)-B_hat_44);
M_hat_45 = (eye(N)-B_hat_45)'*(eye(N)-B_hat_45);
M_hat_55 = (eye(N)-B_hat_55)'*(eye(N)-B_hat_55);
M_hat_57 = (eye(N)-B_hat_57)'*(eye(N)-B_hat_57);
M_hat_65 = (eye(N)-B_hat_65)'*(eye(N)-B_hat_65);
M_hat_66 = (eye(N)-B_hat_66)'*(eye(N)-B_hat_66);
M_hat_71 = (eye(N)-B_hat_71)'*(eye(N)-B_hat_71);
M_hat_75 = (eye(N)-B_hat_75)'*(eye(N)-B_hat_75);
M_hat_76 = (eye(N)-B_hat_76)'*(eye(N)-B_hat_76);
M_hat_77 = (eye(N)-B_hat_77)'*(eye(N)-B_hat_77);
M_hat_78 = (eye(N)-B_hat_78)'*(eye(N)-B_hat_78);
M_hat_79 = (eye(N)-B_hat_79)'*(eye(N)-B_hat_79);
M_hat_80 = (eye(N)-B_hat_80)'*(eye(N)-B_hat_80);
M_hat_84 = (eye(N)-B_hat_84)'*(eye(N)-B_hat_84);
M_hat_86 = (eye(N)-B_hat_86)'*(eye(N)-B_hat_86);
M_hat_87 = (eye(N)-B_hat_87)'*(eye(N)-B_hat_87);
M_hat_88 = (eye(N)-B_hat_88)'*(eye(N)-B_hat_88);
M_hat_89 = (eye(N)-B_hat_89)'*(eye(N)-B_hat_89);
M_hat_91 = (eye(N)-B_hat_91)'*(eye(N)-B_hat_91);
M_hat_92 = (eye(N)-B_hat_92)'*(eye(N)-B_hat_92);
M_hat_95 = (eye(N)-B_hat_95)'*(eye(N)-B_hat_95);
M_hat_100 = (eye(N)-B_hat_100)'*(eye(N)-B_hat_100);
M_hat_104 = (eye(N)-B_hat_104)'*(eye(N)-B_hat_104);
M_hat_105 = (eye(N)-B_hat_105)'*(eye(N)-B_hat_105);
M_hat_106 = (eye(N)-B_hat_106)'*(eye(N)-B_hat_106);
M_hat_107 = (eye(N)-B_hat_107)'*(eye(N)-B_hat_107);
M_hat_108 = (eye(N)-B_hat_108)'*(eye(N)-B_hat_108);
M_hat_112 = (eye(N)-B_hat_112)'*(eye(N)-B_hat_112);
M_hat_119 = (eye(N)-B_hat_119)'*(eye(N)-B_hat_119);
M_hat_125 = (eye(N)-B_hat_125)'*(eye(N)-B_hat_125);
M_hat_129 = (eye(N)-B_hat_129)'*(eye(N)-B_hat_129);
M_hat_130 = (eye(N)-B_hat_130)'*(eye(N)-B_hat_130);
M_hat_133 = (eye(N)-B_hat_133)'*(eye(N)-B_hat_133);
M_hat_139 = (eye(N)-B_hat_139)'*(eye(N)-B_hat_139);
M_hat_140 = (eye(N)-B_hat_140)'*(eye(N)-B_hat_140);
M_hat_141 = (eye(N)-B_hat_141)'*(eye(N)-B_hat_141);
M_hat_144 = (eye(N)-B_hat_144)'*(eye(N)-B_hat_144);
M_hat_149 = (eye(N)-B_hat_149)'*(eye(N)-B_hat_149);
M_hat_150 = (eye(N)-B_hat_150)'*(eye(N)-B_hat_150);
M_hat_152 = (eye(N)-B_hat_152)'*(eye(N)-B_hat_152);
M_hat_153 = (eye(N)-B_hat_153)'*(eye(N)-B_hat_153);
M_hat_157 = (eye(N)-B_hat_157)'*(eye(N)-B_hat_157);
M_hat_158 = (eye(N)-B_hat_158)'*(eye(N)-B_hat_158);
M_hat_159 = (eye(N)-B_hat_159)'*(eye(N)-B_hat_159);
M_hat_162 = (eye(N)-B_hat_162)'*(eye(N)-B_hat_162);
M_hat_169 = (eye(N)-B_hat_169)'*(eye(N)-B_hat_169);

%% PARTE 13: GENERO EL VECTOR DE SCM PARA EL SPILLOVER
% EL MISMO QUE EL ANTERIOR SOLO QUE ESTE SE USARÁ PARA ALMACENAR EL 
% SCM CON SPILLOVER
synthetic_control_sp_1 = a_hat_1(1)+B_hat_1(1,:)*Y_1;
synthetic_control_sp_7 = a_hat_7(1)+B_hat_7(1,:)*Y_7;
synthetic_control_sp_10 = a_hat_10(1)+B_hat_10(1,:)*Y_10;
synthetic_control_sp_16 = a_hat_16(1)+B_hat_16(1,:)*Y_16;
synthetic_control_sp_17 = a_hat_17(1)+B_hat_17(1,:)*Y_17;
synthetic_control_sp_18 = a_hat_18(1)+B_hat_18(1,:)*Y_18;
synthetic_control_sp_23 = a_hat_23(1)+B_hat_23(1,:)*Y_23;
synthetic_control_sp_26 = a_hat_26(1)+B_hat_26(1,:)*Y_26;
synthetic_control_sp_27 = a_hat_27(1)+B_hat_27(1,:)*Y_27;
synthetic_control_sp_38 = a_hat_38(1)+B_hat_38(1,:)*Y_38;
synthetic_control_sp_39 = a_hat_39(1)+B_hat_39(1,:)*Y_39;
synthetic_control_sp_41 = a_hat_41(1)+B_hat_41(1,:)*Y_41;
synthetic_control_sp_42 = a_hat_42(1)+B_hat_42(1,:)*Y_42;
synthetic_control_sp_44 = a_hat_44(1)+B_hat_44(1,:)*Y_44;
synthetic_control_sp_45 = a_hat_45(1)+B_hat_45(1,:)*Y_45;
synthetic_control_sp_55 = a_hat_55(1)+B_hat_55(1,:)*Y_55;
synthetic_control_sp_57 = a_hat_57(1)+B_hat_57(1,:)*Y_57;
synthetic_control_sp_65 = a_hat_65(1)+B_hat_65(1,:)*Y_65;
synthetic_control_sp_66 = a_hat_66(1)+B_hat_66(1,:)*Y_66;
synthetic_control_sp_71 = a_hat_71(1)+B_hat_71(1,:)*Y_71;
synthetic_control_sp_75 = a_hat_75(1)+B_hat_75(1,:)*Y_75;
synthetic_control_sp_76 = a_hat_76(1)+B_hat_76(1,:)*Y_76;
synthetic_control_sp_77 = a_hat_77(1)+B_hat_77(1,:)*Y_77;
synthetic_control_sp_78 = a_hat_78(1)+B_hat_78(1,:)*Y_78;
synthetic_control_sp_79 = a_hat_79(1)+B_hat_79(1,:)*Y_79;
synthetic_control_sp_80 = a_hat_80(1)+B_hat_80(1,:)*Y_80;
synthetic_control_sp_84 = a_hat_84(1)+B_hat_84(1,:)*Y_84;
synthetic_control_sp_86 = a_hat_86(1)+B_hat_86(1,:)*Y_86;
synthetic_control_sp_87 = a_hat_87(1)+B_hat_87(1,:)*Y_87;
synthetic_control_sp_88 = a_hat_88(1)+B_hat_88(1,:)*Y_88;
synthetic_control_sp_89 = a_hat_89(1)+B_hat_89(1,:)*Y_89;
synthetic_control_sp_91 = a_hat_91(1)+B_hat_91(1,:)*Y_91;
synthetic_control_sp_92 = a_hat_92(1)+B_hat_92(1,:)*Y_92;
synthetic_control_sp_95 = a_hat_95(1)+B_hat_95(1,:)*Y_95;
synthetic_control_sp_100 = a_hat_100(1)+B_hat_100(1,:)*Y_100;
synthetic_control_sp_104 = a_hat_104(1)+B_hat_104(1,:)*Y_104;
synthetic_control_sp_105 = a_hat_105(1)+B_hat_105(1,:)*Y_105;
synthetic_control_sp_106 = a_hat_106(1)+B_hat_106(1,:)*Y_106;
synthetic_control_sp_107 = a_hat_107(1)+B_hat_107(1,:)*Y_107;
synthetic_control_sp_108 = a_hat_108(1)+B_hat_108(1,:)*Y_108;
synthetic_control_sp_112 = a_hat_112(1)+B_hat_112(1,:)*Y_112;
synthetic_control_sp_119 = a_hat_119(1)+B_hat_119(1,:)*Y_119;
synthetic_control_sp_125 = a_hat_125(1)+B_hat_125(1,:)*Y_125;
synthetic_control_sp_129 = a_hat_129(1)+B_hat_129(1,:)*Y_129;
synthetic_control_sp_130 = a_hat_130(1)+B_hat_130(1,:)*Y_130;
synthetic_control_sp_133 = a_hat_133(1)+B_hat_133(1,:)*Y_133;
synthetic_control_sp_139 = a_hat_139(1)+B_hat_139(1,:)*Y_139;
synthetic_control_sp_140 = a_hat_140(1)+B_hat_140(1,:)*Y_140;
synthetic_control_sp_141 = a_hat_141(1)+B_hat_141(1,:)*Y_141;
synthetic_control_sp_144 = a_hat_144(1)+B_hat_144(1,:)*Y_144;
synthetic_control_sp_149 = a_hat_149(1)+B_hat_149(1,:)*Y_149;
synthetic_control_sp_150 = a_hat_150(1)+B_hat_150(1,:)*Y_150;
synthetic_control_sp_152 = a_hat_152(1)+B_hat_152(1,:)*Y_152;
synthetic_control_sp_153 = a_hat_153(1)+B_hat_153(1,:)*Y_153;
synthetic_control_sp_157 = a_hat_157(1)+B_hat_157(1,:)*Y_157;
synthetic_control_sp_158 = a_hat_158(1)+B_hat_158(1,:)*Y_158;
synthetic_control_sp_159 = a_hat_159(1)+B_hat_159(1,:)*Y_159;
synthetic_control_sp_162 = a_hat_162(1)+B_hat_162(1,:)*Y_162;
synthetic_control_sp_169 = a_hat_169(1)+B_hat_169(1,:)*Y_169;

%% PARTE 14: treatment effect estimator
alpha1_hat_vec_1 = zeros(1,S);
alpha1_hat_vec_7 = zeros(1,S);
alpha1_hat_vec_10 = zeros(1,S);
alpha1_hat_vec_16 = zeros(1,S);
alpha1_hat_vec_17 = zeros(1,S);
alpha1_hat_vec_18 = zeros(1,S);
alpha1_hat_vec_23 = zeros(1,S);
alpha1_hat_vec_26 = zeros(1,S);
alpha1_hat_vec_27 = zeros(1,S);
alpha1_hat_vec_38 = zeros(1,S);
alpha1_hat_vec_39 = zeros(1,S);
alpha1_hat_vec_41 = zeros(1,S);
alpha1_hat_vec_42 = zeros(1,S);
alpha1_hat_vec_44 = zeros(1,S);
alpha1_hat_vec_45 = zeros(1,S);
alpha1_hat_vec_55 = zeros(1,S);
alpha1_hat_vec_57 = zeros(1,S);
alpha1_hat_vec_65 = zeros(1,S);
alpha1_hat_vec_66 = zeros(1,S);
alpha1_hat_vec_71 = zeros(1,S);
alpha1_hat_vec_75 = zeros(1,S);
alpha1_hat_vec_76 = zeros(1,S);
alpha1_hat_vec_77 = zeros(1,S);
alpha1_hat_vec_78 = zeros(1,S);
alpha1_hat_vec_79 = zeros(1,S);
alpha1_hat_vec_80 = zeros(1,S);
alpha1_hat_vec_84 = zeros(1,S);
alpha1_hat_vec_86 = zeros(1,S);
alpha1_hat_vec_87 = zeros(1,S);
alpha1_hat_vec_88 = zeros(1,S);
alpha1_hat_vec_89 = zeros(1,S);
alpha1_hat_vec_91 = zeros(1,S);
alpha1_hat_vec_92 = zeros(1,S);
alpha1_hat_vec_95 = zeros(1,S);
alpha1_hat_vec_100 = zeros(1,S);
alpha1_hat_vec_104 = zeros(1,S);
alpha1_hat_vec_105 = zeros(1,S);
alpha1_hat_vec_106 = zeros(1,S);
alpha1_hat_vec_107 = zeros(1,S);
alpha1_hat_vec_108 = zeros(1,S);
alpha1_hat_vec_112 = zeros(1,S);
alpha1_hat_vec_119 = zeros(1,S);
alpha1_hat_vec_125 = zeros(1,S);
alpha1_hat_vec_129 = zeros(1,S);
alpha1_hat_vec_130 = zeros(1,S);
alpha1_hat_vec_133 = zeros(1,S);
alpha1_hat_vec_139 = zeros(1,S);
alpha1_hat_vec_140 = zeros(1,S);
alpha1_hat_vec_141 = zeros(1,S);
alpha1_hat_vec_144 = zeros(1,S);
alpha1_hat_vec_149 = zeros(1,S);
alpha1_hat_vec_150 = zeros(1,S);
alpha1_hat_vec_152 = zeros(1,S);
alpha1_hat_vec_153 = zeros(1,S);
alpha1_hat_vec_157 = zeros(1,S);
alpha1_hat_vec_158 = zeros(1,S);
alpha1_hat_vec_159 = zeros(1,S);
alpha1_hat_vec_162 = zeros(1,S);
alpha1_hat_vec_169 = zeros(1,S);

%% PARTE 15: CALCULAMOS EL VECTOR SCM CON SPILLOVER 
%PROVINCIA 1
for s = 1 : S
Y_Ts_1 = Y_1(:,T+s);
gamma_hat_1 = (A_1'*M_hat_1*A_1)\(A_1'*(eye(N)-B_hat_1)'*((eye(N)-B_hat_1)*Y_Ts_1-a_hat_1));
alpha_hat_1 = A_1*gamma_hat_1;
alpha1_hat_vec_1(s) = alpha_hat_1(1);
synthetic_control_sp_1(T+s) = Y_1(1,T+s)-alpha1_hat_vec_1(s);
end
%PROVINCIA 7
for s = 1 : S
Y_Ts_7 = Y_7(:,T+s);
gamma_hat_7 = (A_7'*M_hat_7*A_7)\(A_7'*(eye(N)-B_hat_7)'*((eye(N)-B_hat_7)*Y_Ts_7-a_hat_7));
alpha_hat_7 = A_7*gamma_hat_7;
alpha1_hat_vec_7(s) = alpha_hat_7(1);
synthetic_control_sp_7(T+s) = Y_7(1,T+s)-alpha1_hat_vec_7(s);
end
%PROVINCIA 10
for s = 1 : S
Y_Ts_10 = Y_10(:,T+s);
gamma_hat_10 = (A_10'*M_hat_10*A_10)\(A_10'*(eye(N)-B_hat_10)'*((eye(N)-B_hat_10)*Y_Ts_10-a_hat_10));
alpha_hat_10 = A_10*gamma_hat_10;
alpha1_hat_vec_10(s) = alpha_hat_10(1);
synthetic_control_sp_10(T+s) = Y_10(1,T+s)-alpha1_hat_vec_10(s);
end
%PROVINCIA 16
for s = 1 : S
Y_Ts_16 = Y_16(:,T+s);
gamma_hat_16 = (A_16'*M_hat_16*A_16)\(A_16'*(eye(N)-B_hat_16)'*((eye(N)-B_hat_16)*Y_Ts_16-a_hat_16));
alpha_hat_16 = A_16*gamma_hat_16;
alpha1_hat_vec_16(s) = alpha_hat_16(1);
synthetic_control_sp_16(T+s) = Y_16(1,T+s)-alpha1_hat_vec_16(s);
end
%PROVINCIA 17
for s = 1 : S
Y_Ts_17 = Y_17(:,T+s);
gamma_hat_17 = (A_17'*M_hat_17*A_17)\(A_17'*(eye(N)-B_hat_17)'*((eye(N)-B_hat_17)*Y_Ts_17-a_hat_17));
alpha_hat_17 = A_17*gamma_hat_17;
alpha1_hat_vec_17(s) = alpha_hat_17(1);
synthetic_control_sp_17(T+s) = Y_17(1,T+s)-alpha1_hat_vec_17(s);
end
%PROVINCIA 18
for s = 1 : S
Y_Ts_18 = Y_18(:,T+s);
gamma_hat_18 = (A_18'*M_hat_18*A_18)\(A_18'*(eye(N)-B_hat_18)'*((eye(N)-B_hat_18)*Y_Ts_18-a_hat_18));
alpha_hat_18 = A_18*gamma_hat_18;
alpha1_hat_vec_18(s) = alpha_hat_18(1);
synthetic_control_sp_18(T+s) = Y_18(1,T+s)-alpha1_hat_vec_18(s);
end
%PROVINCIA 23
for s = 1 : S
Y_Ts_23 = Y_23(:,T+s);
gamma_hat_23 = (A_23'*M_hat_23*A_23)\(A_23'*(eye(N)-B_hat_23)'*((eye(N)-B_hat_23)*Y_Ts_23-a_hat_23));
alpha_hat_23 = A_23*gamma_hat_23;
alpha1_hat_vec_23(s) = alpha_hat_23(1);
synthetic_control_sp_23(T+s) = Y_23(1,T+s)-alpha1_hat_vec_23(s);
end
%PROVINCIA 26
for s = 1 : S
Y_Ts_26 = Y_26(:,T+s);
gamma_hat_26 = (A_26'*M_hat_26*A_26)\(A_26'*(eye(N)-B_hat_26)'*((eye(N)-B_hat_26)*Y_Ts_26-a_hat_26));
alpha_hat_26 = A_26*gamma_hat_26;
alpha1_hat_vec_26(s) = alpha_hat_26(1);
synthetic_control_sp_26(T+s) = Y_26(1,T+s)-alpha1_hat_vec_26(s);
end
%PROVINCIA 27
for s = 1 : S
Y_Ts_27 = Y_27(:,T+s);
gamma_hat_27 = (A_27'*M_hat_27*A_27)\(A_27'*(eye(N)-B_hat_27)'*((eye(N)-B_hat_27)*Y_Ts_27-a_hat_27));
alpha_hat_27 = A_27*gamma_hat_27;
alpha1_hat_vec_27(s) = alpha_hat_27(1);
synthetic_control_sp_27(T+s) = Y_27(1,T+s)-alpha1_hat_vec_27(s);
end
%PROVINCIA 38
for s = 1 : S
Y_Ts_38 = Y_38(:,T+s);
gamma_hat_38 = (A_38'*M_hat_38*A_38)\(A_38'*(eye(N)-B_hat_38)'*((eye(N)-B_hat_38)*Y_Ts_38-a_hat_38));
alpha_hat_38 = A_38*gamma_hat_38;
alpha1_hat_vec_38(s) = alpha_hat_38(1);
synthetic_control_sp_38(T+s) = Y_38(1,T+s)-alpha1_hat_vec_38(s);
end
%PROVINCIA 39
for s = 1 : S
Y_Ts_39 = Y_39(:,T+s);
gamma_hat_39 = (A_39'*M_hat_39*A_39)\(A_39'*(eye(N)-B_hat_39)'*((eye(N)-B_hat_39)*Y_Ts_39-a_hat_39));
alpha_hat_39 = A_39*gamma_hat_39;
alpha1_hat_vec_39(s) = alpha_hat_39(1);
synthetic_control_sp_39(T+s) = Y_39(1,T+s)-alpha1_hat_vec_39(s);
end
%PROVINCIA 41
for s = 1 : S
Y_Ts_41 = Y_41(:,T+s);
gamma_hat_41 = (A_41'*M_hat_41*A_41)\(A_41'*(eye(N)-B_hat_41)'*((eye(N)-B_hat_41)*Y_Ts_41-a_hat_41));
alpha_hat_41 = A_41*gamma_hat_41;
alpha1_hat_vec_41(s) = alpha_hat_41(1);
synthetic_control_sp_41(T+s) = Y_41(1,T+s)-alpha1_hat_vec_41(s);
end
%PROVINCIA 42
for s = 1 : S
Y_Ts_42 = Y_42(:,T+s);
gamma_hat_42 = (A_42'*M_hat_42*A_42)\(A_42'*(eye(N)-B_hat_42)'*((eye(N)-B_hat_42)*Y_Ts_42-a_hat_42));
alpha_hat_42 = A_42*gamma_hat_42;
alpha1_hat_vec_42(s) = alpha_hat_42(1);
synthetic_control_sp_42(T+s) = Y_42(1,T+s)-alpha1_hat_vec_42(s);
end
%PROVINCIA 44
for s = 1 : S
Y_Ts_44 = Y_44(:,T+s);
gamma_hat_44 = (A_44'*M_hat_44*A_44)\(A_44'*(eye(N)-B_hat_44)'*((eye(N)-B_hat_44)*Y_Ts_44-a_hat_44));
alpha_hat_44 = A_44*gamma_hat_44;
alpha1_hat_vec_44(s) = alpha_hat_44(1);
synthetic_control_sp_44(T+s) = Y_44(1,T+s)-alpha1_hat_vec_44(s);
end
%PROVINCIA 45
for s = 1 : S
Y_Ts_45 = Y_45(:,T+s);
gamma_hat_45 = (A_45'*M_hat_45*A_45)\(A_45'*(eye(N)-B_hat_45)'*((eye(N)-B_hat_45)*Y_Ts_45-a_hat_45));
alpha_hat_45 = A_45*gamma_hat_45;
alpha1_hat_vec_45(s) = alpha_hat_45(1);
synthetic_control_sp_45(T+s) = Y_45(1,T+s)-alpha1_hat_vec_45(s);
end
%PROVINCIA 55
for s = 1 : S
Y_Ts_55 = Y_55(:,T+s);
gamma_hat_55 = (A_55'*M_hat_55*A_55)\(A_55'*(eye(N)-B_hat_55)'*((eye(N)-B_hat_55)*Y_Ts_55-a_hat_55));
alpha_hat_55 = A_55*gamma_hat_55;
alpha1_hat_vec_55(s) = alpha_hat_55(1);
synthetic_control_sp_55(T+s) = Y_55(1,T+s)-alpha1_hat_vec_55(s);
end
%PROVINCIA 57
for s = 1 : S
Y_Ts_57 = Y_57(:,T+s);
gamma_hat_57 = (A_57'*M_hat_57*A_57)\(A_57'*(eye(N)-B_hat_57)'*((eye(N)-B_hat_57)*Y_Ts_57-a_hat_57));
alpha_hat_57 = A_57*gamma_hat_57;
alpha1_hat_vec_57(s) = alpha_hat_57(1);
synthetic_control_sp_57(T+s) = Y_57(1,T+s)-alpha1_hat_vec_57(s);
end
%PROVINCIA 65
for s = 1 : S
Y_Ts_65 = Y_65(:,T+s);
gamma_hat_65 = (A_65'*M_hat_65*A_65)\(A_65'*(eye(N)-B_hat_65)'*((eye(N)-B_hat_65)*Y_Ts_65-a_hat_65));
alpha_hat_65 = A_65*gamma_hat_65;
alpha1_hat_vec_65(s) = alpha_hat_65(1);
synthetic_control_sp_65(T+s) = Y_65(1,T+s)-alpha1_hat_vec_65(s);
end
%PROVINCIA 66
for s = 1 : S
Y_Ts_66 = Y_66(:,T+s);
gamma_hat_66 = (A_66'*M_hat_66*A_66)\(A_66'*(eye(N)-B_hat_66)'*((eye(N)-B_hat_66)*Y_Ts_66-a_hat_66));
alpha_hat_66 = A_66*gamma_hat_66;
alpha1_hat_vec_66(s) = alpha_hat_66(1);
synthetic_control_sp_66(T+s) = Y_66(1,T+s)-alpha1_hat_vec_66(s);
end
%PROVINCIA 71
for s = 1 : S
Y_Ts_71 = Y_71(:,T+s);
gamma_hat_71 = (A_71'*M_hat_71*A_71)\(A_71'*(eye(N)-B_hat_71)'*((eye(N)-B_hat_71)*Y_Ts_71-a_hat_71));
alpha_hat_71 = A_71*gamma_hat_71;
alpha1_hat_vec_71(s) = alpha_hat_71(1);
synthetic_control_sp_71(T+s) = Y_71(1,T+s)-alpha1_hat_vec_71(s);
end
%PROVINCIA 75
for s = 1 : S
Y_Ts_75 = Y_75(:,T+s);
gamma_hat_75 = (A_75'*M_hat_75*A_75)\(A_75'*(eye(N)-B_hat_75)'*((eye(N)-B_hat_75)*Y_Ts_75-a_hat_75));
alpha_hat_75 = A_75*gamma_hat_75;
alpha1_hat_vec_75(s) = alpha_hat_75(1);
synthetic_control_sp_75(T+s) = Y_75(1,T+s)-alpha1_hat_vec_75(s);
end
%PROVINCIA 76
for s = 1 : S
Y_Ts_76 = Y_76(:,T+s);
gamma_hat_76 = (A_76'*M_hat_76*A_76)\(A_76'*(eye(N)-B_hat_76)'*((eye(N)-B_hat_76)*Y_Ts_76-a_hat_76));
alpha_hat_76 = A_76*gamma_hat_76;
alpha1_hat_vec_76(s) = alpha_hat_76(1);
synthetic_control_sp_76(T+s) = Y_76(1,T+s)-alpha1_hat_vec_76(s);
end
%PROVINCIA 77
for s = 1 : S
Y_Ts_77 = Y_77(:,T+s);
gamma_hat_77 = (A_77'*M_hat_77*A_77)\(A_77'*(eye(N)-B_hat_77)'*((eye(N)-B_hat_77)*Y_Ts_77-a_hat_77));
alpha_hat_77 = A_77*gamma_hat_77;
alpha1_hat_vec_77(s) = alpha_hat_77(1);
synthetic_control_sp_77(T+s) = Y_77(1,T+s)-alpha1_hat_vec_77(s);
end
%PROVINCIA 78
for s = 1 : S
Y_Ts_78 = Y_78(:,T+s);
gamma_hat_78 = (A_78'*M_hat_78*A_78)\(A_78'*(eye(N)-B_hat_78)'*((eye(N)-B_hat_78)*Y_Ts_78-a_hat_78));
alpha_hat_78 = A_78*gamma_hat_78;
alpha1_hat_vec_78(s) = alpha_hat_78(1);
synthetic_control_sp_78(T+s) = Y_78(1,T+s)-alpha1_hat_vec_78(s);
end
%PROVINCIA 79
for s = 1 : S
Y_Ts_79 = Y_79(:,T+s);
gamma_hat_79 = (A_79'*M_hat_79*A_79)\(A_79'*(eye(N)-B_hat_79)'*((eye(N)-B_hat_79)*Y_Ts_79-a_hat_79));
alpha_hat_79 = A_79*gamma_hat_79;
alpha1_hat_vec_79(s) = alpha_hat_79(1);
synthetic_control_sp_79(T+s) = Y_79(1,T+s)-alpha1_hat_vec_79(s);
end
%PROVINCIA 80
for s = 1 : S
Y_Ts_80 = Y_80(:,T+s);
gamma_hat_80 = (A_80'*M_hat_80*A_80)\(A_80'*(eye(N)-B_hat_80)'*((eye(N)-B_hat_80)*Y_Ts_80-a_hat_80));
alpha_hat_80 = A_80*gamma_hat_80;
alpha1_hat_vec_80(s) = alpha_hat_80(1);
synthetic_control_sp_80(T+s) = Y_80(1,T+s)-alpha1_hat_vec_80(s);
end
%PROVINCIA 84
for s = 1 : S
Y_Ts_84 = Y_84(:,T+s);
gamma_hat_84 = (A_84'*M_hat_84*A_84)\(A_84'*(eye(N)-B_hat_84)'*((eye(N)-B_hat_84)*Y_Ts_84-a_hat_84));
alpha_hat_84 = A_84*gamma_hat_84;
alpha1_hat_vec_84(s) = alpha_hat_84(1);
synthetic_control_sp_84(T+s) = Y_84(1,T+s)-alpha1_hat_vec_84(s);
end
%PROVINCIA 86
for s = 1 : S
Y_Ts_86 = Y_86(:,T+s);
gamma_hat_86 = (A_86'*M_hat_86*A_86)\(A_86'*(eye(N)-B_hat_86)'*((eye(N)-B_hat_86)*Y_Ts_86-a_hat_86));
alpha_hat_86 = A_86*gamma_hat_86;
alpha1_hat_vec_86(s) = alpha_hat_86(1);
synthetic_control_sp_86(T+s) = Y_86(1,T+s)-alpha1_hat_vec_86(s);
end
%PROVINCIA 87
for s = 1 : S
Y_Ts_87 = Y_87(:,T+s);
gamma_hat_87 = (A_87'*M_hat_87*A_87)\(A_87'*(eye(N)-B_hat_87)'*((eye(N)-B_hat_87)*Y_Ts_87-a_hat_87));
alpha_hat_87 = A_87*gamma_hat_87;
alpha1_hat_vec_87(s) = alpha_hat_87(1);
synthetic_control_sp_87(T+s) = Y_87(1,T+s)-alpha1_hat_vec_87(s);
end
%PROVINCIA 88
for s = 1 : S
Y_Ts_88 = Y_88(:,T+s);
gamma_hat_88 = (A_88'*M_hat_88*A_88)\(A_88'*(eye(N)-B_hat_88)'*((eye(N)-B_hat_88)*Y_Ts_88-a_hat_88));
alpha_hat_88 = A_88*gamma_hat_88;
alpha1_hat_vec_88(s) = alpha_hat_88(1);
synthetic_control_sp_88(T+s) = Y_88(1,T+s)-alpha1_hat_vec_88(s);
end
%PROVINCIA 89
for s = 1 : S
Y_Ts_89 = Y_89(:,T+s);
gamma_hat_89 = (A_89'*M_hat_89*A_89)\(A_89'*(eye(N)-B_hat_89)'*((eye(N)-B_hat_89)*Y_Ts_89-a_hat_89));
alpha_hat_89 = A_89*gamma_hat_89;
alpha1_hat_vec_89(s) = alpha_hat_89(1);
synthetic_control_sp_89(T+s) = Y_89(1,T+s)-alpha1_hat_vec_89(s);
end
%PROVINCIA 91
for s = 1 : S
Y_Ts_91 = Y_91(:,T+s);
gamma_hat_91 = (A_91'*M_hat_91*A_91)\(A_91'*(eye(N)-B_hat_91)'*((eye(N)-B_hat_91)*Y_Ts_91-a_hat_91));
alpha_hat_91 = A_91*gamma_hat_91;
alpha1_hat_vec_91(s) = alpha_hat_91(1);
synthetic_control_sp_91(T+s) = Y_91(1,T+s)-alpha1_hat_vec_91(s);
end
%PROVINCIA 92
for s = 1 : S
Y_Ts_92 = Y_92(:,T+s);
gamma_hat_92 = (A_92'*M_hat_92*A_92)\(A_92'*(eye(N)-B_hat_92)'*((eye(N)-B_hat_92)*Y_Ts_92-a_hat_92));
alpha_hat_92 = A_92*gamma_hat_92;
alpha1_hat_vec_92(s) = alpha_hat_92(1);
synthetic_control_sp_92(T+s) = Y_92(1,T+s)-alpha1_hat_vec_92(s);
end
%PROVINCIA 95
for s = 1 : S
Y_Ts_95 = Y_95(:,T+s);
gamma_hat_95 = (A_95'*M_hat_95*A_95)\(A_95'*(eye(N)-B_hat_95)'*((eye(N)-B_hat_95)*Y_Ts_95-a_hat_95));
alpha_hat_95 = A_95*gamma_hat_95;
alpha1_hat_vec_95(s) = alpha_hat_95(1);
synthetic_control_sp_95(T+s) = Y_95(1,T+s)-alpha1_hat_vec_95(s);
end
%PROVINCIA 100
for s = 1 : S
Y_Ts_100 = Y_100(:,T+s);
gamma_hat_100 = (A_100'*M_hat_100*A_100)\(A_100'*(eye(N)-B_hat_100)'*((eye(N)-B_hat_100)*Y_Ts_100-a_hat_100));
alpha_hat_100 = A_100*gamma_hat_100;
alpha1_hat_vec_100(s) = alpha_hat_100(1);
synthetic_control_sp_100(T+s) = Y_100(1,T+s)-alpha1_hat_vec_100(s);
end
%PROVINCIA 104
for s = 1 : S
Y_Ts_104 = Y_104(:,T+s);
gamma_hat_104 = (A_104'*M_hat_104*A_104)\(A_104'*(eye(N)-B_hat_104)'*((eye(N)-B_hat_104)*Y_Ts_104-a_hat_104));
alpha_hat_104 = A_104*gamma_hat_104;
alpha1_hat_vec_104(s) = alpha_hat_104(1);
synthetic_control_sp_104(T+s) = Y_104(1,T+s)-alpha1_hat_vec_104(s);
end
%PROVINCIA 105
for s = 1 : S
Y_Ts_105 = Y_105(:,T+s);
gamma_hat_105 = (A_105'*M_hat_105*A_105)\(A_105'*(eye(N)-B_hat_105)'*((eye(N)-B_hat_105)*Y_Ts_105-a_hat_105));
alpha_hat_105 = A_105*gamma_hat_105;
alpha1_hat_vec_105(s) = alpha_hat_105(1);
synthetic_control_sp_105(T+s) = Y_105(1,T+s)-alpha1_hat_vec_105(s);
end
%PROVINCIA 106
for s = 1 : S
Y_Ts_106 = Y_106(:,T+s);
gamma_hat_106 = (A_106'*M_hat_106*A_106)\(A_106'*(eye(N)-B_hat_106)'*((eye(N)-B_hat_106)*Y_Ts_106-a_hat_106));
alpha_hat_106 = A_106*gamma_hat_106;
alpha1_hat_vec_106(s) = alpha_hat_106(1);
synthetic_control_sp_106(T+s) = Y_106(1,T+s)-alpha1_hat_vec_106(s);
end
%PROVINCIA 107
for s = 1 : S
Y_Ts_107 = Y_107(:,T+s);
gamma_hat_107 = (A_107'*M_hat_107*A_107)\(A_107'*(eye(N)-B_hat_107)'*((eye(N)-B_hat_107)*Y_Ts_107-a_hat_107));
alpha_hat_107 = A_107*gamma_hat_107;
alpha1_hat_vec_107(s) = alpha_hat_107(1);
synthetic_control_sp_107(T+s) = Y_107(1,T+s)-alpha1_hat_vec_107(s);
end
%PROVINCIA 108
for s = 1 : S
Y_Ts_108 = Y_108(:,T+s);
gamma_hat_108 = (A_108'*M_hat_108*A_108)\(A_108'*(eye(N)-B_hat_108)'*((eye(N)-B_hat_108)*Y_Ts_108-a_hat_108));
alpha_hat_108 = A_108*gamma_hat_108;
alpha1_hat_vec_108(s) = alpha_hat_108(1);
synthetic_control_sp_108(T+s) = Y_108(1,T+s)-alpha1_hat_vec_108(s);
end
%PROVINCIA 112
for s = 1 : S
Y_Ts_112 = Y_112(:,T+s);
gamma_hat_112 = (A_112'*M_hat_112*A_112)\(A_112'*(eye(N)-B_hat_112)'*((eye(N)-B_hat_112)*Y_Ts_112-a_hat_112));
alpha_hat_112 = A_112*gamma_hat_112;
alpha1_hat_vec_112(s) = alpha_hat_112(1);
synthetic_control_sp_112(T+s) = Y_112(1,T+s)-alpha1_hat_vec_112(s);
end
%PROVINCIA 119
for s = 1 : S
Y_Ts_119 = Y_119(:,T+s);
gamma_hat_119 = (A_119'*M_hat_119*A_119)\(A_119'*(eye(N)-B_hat_119)'*((eye(N)-B_hat_119)*Y_Ts_119-a_hat_119));
alpha_hat_119 = A_119*gamma_hat_119;
alpha1_hat_vec_119(s) = alpha_hat_119(1);
synthetic_control_sp_119(T+s) = Y_119(1,T+s)-alpha1_hat_vec_119(s);
end
%PROVINCIA 125
for s = 1 : S
Y_Ts_125 = Y_125(:,T+s);
gamma_hat_125 = (A_125'*M_hat_125*A_125)\(A_125'*(eye(N)-B_hat_125)'*((eye(N)-B_hat_125)*Y_Ts_125-a_hat_125));
alpha_hat_125 = A_125*gamma_hat_125;
alpha1_hat_vec_125(s) = alpha_hat_125(1);
synthetic_control_sp_125(T+s) = Y_125(1,T+s)-alpha1_hat_vec_125(s);
end
%PROVINCIA 129
for s = 1 : S
Y_Ts_129 = Y_129(:,T+s);
gamma_hat_129 = (A_129'*M_hat_129*A_129)\(A_129'*(eye(N)-B_hat_129)'*((eye(N)-B_hat_129)*Y_Ts_129-a_hat_129));
alpha_hat_129 = A_129*gamma_hat_129;
alpha1_hat_vec_129(s) = alpha_hat_129(1);
synthetic_control_sp_129(T+s) = Y_129(1,T+s)-alpha1_hat_vec_129(s);
end
%PROVINCIA 130
for s = 1 : S
Y_Ts_130 = Y_130(:,T+s);
gamma_hat_130 = (A_130'*M_hat_130*A_130)\(A_130'*(eye(N)-B_hat_130)'*((eye(N)-B_hat_130)*Y_Ts_130-a_hat_130));
alpha_hat_130 = A_130*gamma_hat_130;
alpha1_hat_vec_130(s) = alpha_hat_130(1);
synthetic_control_sp_130(T+s) = Y_130(1,T+s)-alpha1_hat_vec_130(s);
end
%PROVINCIA 133
for s = 1 : S
Y_Ts_133 = Y_133(:,T+s);
gamma_hat_133 = (A_133'*M_hat_133*A_133)\(A_133'*(eye(N)-B_hat_133)'*((eye(N)-B_hat_133)*Y_Ts_133-a_hat_133));
alpha_hat_133 = A_133*gamma_hat_133;
alpha1_hat_vec_133(s) = alpha_hat_133(1);
synthetic_control_sp_133(T+s) = Y_133(1,T+s)-alpha1_hat_vec_133(s);
end
%PROVINCIA 139
for s = 1 : S
Y_Ts_139 = Y_139(:,T+s);
gamma_hat_139 = (A_139'*M_hat_139*A_139)\(A_139'*(eye(N)-B_hat_139)'*((eye(N)-B_hat_139)*Y_Ts_139-a_hat_139));
alpha_hat_139 = A_139*gamma_hat_139;
alpha1_hat_vec_139(s) = alpha_hat_139(1);
synthetic_control_sp_139(T+s) = Y_139(1,T+s)-alpha1_hat_vec_139(s);
end
%PROVINCIA 140
for s = 1 : S
Y_Ts_140 = Y_140(:,T+s);
gamma_hat_140 = (A_140'*M_hat_140*A_140)\(A_140'*(eye(N)-B_hat_140)'*((eye(N)-B_hat_140)*Y_Ts_140-a_hat_140));
alpha_hat_140 = A_140*gamma_hat_140;
alpha1_hat_vec_140(s) = alpha_hat_140(1);
synthetic_control_sp_140(T+s) = Y_140(1,T+s)-alpha1_hat_vec_140(s);
end
%PROVINCIA 141
for s = 1 : S
Y_Ts_141 = Y_141(:,T+s);
gamma_hat_141 = (A_141'*M_hat_141*A_141)\(A_141'*(eye(N)-B_hat_141)'*((eye(N)-B_hat_141)*Y_Ts_141-a_hat_141));
alpha_hat_141 = A_141*gamma_hat_141;
alpha1_hat_vec_141(s) = alpha_hat_141(1);
synthetic_control_sp_141(T+s) = Y_141(1,T+s)-alpha1_hat_vec_141(s);
end
%PROVINCIA 144
for s = 1 : S
Y_Ts_144 = Y_144(:,T+s);
gamma_hat_144 = (A_144'*M_hat_144*A_144)\(A_144'*(eye(N)-B_hat_144)'*((eye(N)-B_hat_144)*Y_Ts_144-a_hat_144));
alpha_hat_144 = A_144*gamma_hat_144;
alpha1_hat_vec_144(s) = alpha_hat_144(1);
synthetic_control_sp_144(T+s) = Y_144(1,T+s)-alpha1_hat_vec_144(s);
end
%PROVINCIA 149
for s = 1 : S
Y_Ts_149 = Y_149(:,T+s);
gamma_hat_149 = (A_149'*M_hat_149*A_149)\(A_149'*(eye(N)-B_hat_149)'*((eye(N)-B_hat_149)*Y_Ts_149-a_hat_149));
alpha_hat_149 = A_149*gamma_hat_149;
alpha1_hat_vec_149(s) = alpha_hat_149(1);
synthetic_control_sp_149(T+s) = Y_149(1,T+s)-alpha1_hat_vec_149(s);
end
%PROVINCIA 150
for s = 1 : S
Y_Ts_150 = Y_150(:,T+s);
gamma_hat_150 = (A_150'*M_hat_150*A_150)\(A_150'*(eye(N)-B_hat_150)'*((eye(N)-B_hat_150)*Y_Ts_150-a_hat_150));
alpha_hat_150 = A_150*gamma_hat_150;
alpha1_hat_vec_150(s) = alpha_hat_150(1);
synthetic_control_sp_150(T+s) = Y_150(1,T+s)-alpha1_hat_vec_150(s);
end
%PROVINCIA 152
for s = 1 : S
Y_Ts_152 = Y_152(:,T+s);
gamma_hat_152 = (A_152'*M_hat_152*A_152)\(A_152'*(eye(N)-B_hat_152)'*((eye(N)-B_hat_152)*Y_Ts_152-a_hat_152));
alpha_hat_152 = A_152*gamma_hat_152;
alpha1_hat_vec_152(s) = alpha_hat_152(1);
synthetic_control_sp_152(T+s) = Y_152(1,T+s)-alpha1_hat_vec_152(s);
end
%PROVINCIA 153
for s = 1 : S
Y_Ts_153 = Y_153(:,T+s);
gamma_hat_153 = (A_153'*M_hat_153*A_153)\(A_153'*(eye(N)-B_hat_153)'*((eye(N)-B_hat_153)*Y_Ts_153-a_hat_153));
alpha_hat_153 = A_153*gamma_hat_153;
alpha1_hat_vec_153(s) = alpha_hat_153(1);
synthetic_control_sp_153(T+s) = Y_153(1,T+s)-alpha1_hat_vec_153(s);
end
%PROVINCIA 157
for s = 1 : S
Y_Ts_157 = Y_157(:,T+s);
gamma_hat_157 = (A_157'*M_hat_157*A_157)\(A_157'*(eye(N)-B_hat_157)'*((eye(N)-B_hat_157)*Y_Ts_157-a_hat_157));
alpha_hat_157 = A_157*gamma_hat_157;
alpha1_hat_vec_157(s) = alpha_hat_157(1);
synthetic_control_sp_157(T+s) = Y_157(1,T+s)-alpha1_hat_vec_157(s);
end
%PROVINCIA 158
for s = 1 : S
Y_Ts_158 = Y_158(:,T+s);
gamma_hat_158 = (A_158'*M_hat_158*A_158)\(A_158'*(eye(N)-B_hat_158)'*((eye(N)-B_hat_158)*Y_Ts_158-a_hat_158));
alpha_hat_158 = A_158*gamma_hat_158;
alpha1_hat_vec_158(s) = alpha_hat_158(1);
synthetic_control_sp_158(T+s) = Y_158(1,T+s)-alpha1_hat_vec_158(s);
end
%PROVINCIA 159
for s = 1 : S
Y_Ts_159 = Y_159(:,T+s);
gamma_hat_159 = (A_159'*M_hat_159*A_159)\(A_159'*(eye(N)-B_hat_159)'*((eye(N)-B_hat_159)*Y_Ts_159-a_hat_159));
alpha_hat_159 = A_159*gamma_hat_159;
alpha1_hat_vec_159(s) = alpha_hat_159(1);
synthetic_control_sp_159(T+s) = Y_159(1,T+s)-alpha1_hat_vec_159(s);
end
%PROVINCIA 162
for s = 1 : S
Y_Ts_162 = Y_162(:,T+s);
gamma_hat_162 = (A_162'*M_hat_162*A_162)\(A_162'*(eye(N)-B_hat_162)'*((eye(N)-B_hat_162)*Y_Ts_162-a_hat_162));
alpha_hat_162 = A_162*gamma_hat_162;
alpha1_hat_vec_162(s) = alpha_hat_162(1);
synthetic_control_sp_162(T+s) = Y_162(1,T+s)-alpha1_hat_vec_162(s);
end
%PROVINCIA 169
for s = 1 : S
Y_Ts_169 = Y_169(:,T+s);
gamma_hat_169 = (A_169'*M_hat_169*A_169)\(A_169'*(eye(N)-B_hat_169)'*((eye(N)-B_hat_169)*Y_Ts_169-a_hat_169));
alpha_hat_169 = A_169*gamma_hat_169;
alpha1_hat_vec_169(s) = alpha_hat_169(1);
synthetic_control_sp_169(T+s) = Y_169(1,T+s)-alpha1_hat_vec_169(s);
end

%% PARTE 16: TRASPONGO 
synthetic_control_1=synthetic_control_1'
synthetic_control_7=synthetic_control_7'
synthetic_control_10=synthetic_control_10'
synthetic_control_16=synthetic_control_16'
synthetic_control_17=synthetic_control_17'
synthetic_control_18=synthetic_control_18'
synthetic_control_23=synthetic_control_23'
synthetic_control_26=synthetic_control_26'
synthetic_control_27=synthetic_control_27'
synthetic_control_38=synthetic_control_38'
synthetic_control_39=synthetic_control_39'
synthetic_control_41=synthetic_control_41'
synthetic_control_42=synthetic_control_42'
synthetic_control_44=synthetic_control_44'
synthetic_control_45=synthetic_control_45'
synthetic_control_55=synthetic_control_55'
synthetic_control_57=synthetic_control_57'
synthetic_control_65=synthetic_control_65'
synthetic_control_66=synthetic_control_66'
synthetic_control_71=synthetic_control_71'
synthetic_control_75=synthetic_control_75'
synthetic_control_76=synthetic_control_76'
synthetic_control_77=synthetic_control_77'
synthetic_control_78=synthetic_control_78'
synthetic_control_79=synthetic_control_79'
synthetic_control_80=synthetic_control_80'
synthetic_control_84=synthetic_control_84'
synthetic_control_86=synthetic_control_86'
synthetic_control_87=synthetic_control_87'
synthetic_control_88=synthetic_control_88'
synthetic_control_89=synthetic_control_89'
synthetic_control_91=synthetic_control_91'
synthetic_control_92=synthetic_control_92'
synthetic_control_95=synthetic_control_95'
synthetic_control_100=synthetic_control_100'
synthetic_control_104=synthetic_control_104'
synthetic_control_105=synthetic_control_105'
synthetic_control_106=synthetic_control_106'
synthetic_control_107=synthetic_control_107'
synthetic_control_108=synthetic_control_108'
synthetic_control_112=synthetic_control_112'
synthetic_control_119=synthetic_control_119'
synthetic_control_125=synthetic_control_125'
synthetic_control_129=synthetic_control_129'
synthetic_control_130=synthetic_control_130'
synthetic_control_133=synthetic_control_133'
synthetic_control_139=synthetic_control_139'
synthetic_control_140=synthetic_control_140'
synthetic_control_141=synthetic_control_141'
synthetic_control_144=synthetic_control_144'
synthetic_control_149=synthetic_control_149'
synthetic_control_150=synthetic_control_150'
synthetic_control_152=synthetic_control_152'
synthetic_control_153=synthetic_control_153'
synthetic_control_157=synthetic_control_157'
synthetic_control_158=synthetic_control_158'
synthetic_control_159=synthetic_control_159'
synthetic_control_162=synthetic_control_162'
synthetic_control_169=synthetic_control_169'

synthetic_control_sp_1=synthetic_control_sp_1'
synthetic_control_sp_7=synthetic_control_sp_7'
synthetic_control_sp_10=synthetic_control_sp_10'
synthetic_control_sp_16=synthetic_control_sp_16'
synthetic_control_sp_17=synthetic_control_sp_17'
synthetic_control_sp_18=synthetic_control_sp_18'
synthetic_control_sp_23=synthetic_control_sp_23'
synthetic_control_sp_26=synthetic_control_sp_26'
synthetic_control_sp_27=synthetic_control_sp_27'
synthetic_control_sp_38=synthetic_control_sp_38'
synthetic_control_sp_39=synthetic_control_sp_39'
synthetic_control_sp_41=synthetic_control_sp_41'
synthetic_control_sp_42=synthetic_control_sp_42'
synthetic_control_sp_44=synthetic_control_sp_44'
synthetic_control_sp_45=synthetic_control_sp_45'
synthetic_control_sp_55=synthetic_control_sp_55'
synthetic_control_sp_57=synthetic_control_sp_57'
synthetic_control_sp_65=synthetic_control_sp_65'
synthetic_control_sp_66=synthetic_control_sp_66'
synthetic_control_sp_71=synthetic_control_sp_71'
synthetic_control_sp_75=synthetic_control_sp_75'
synthetic_control_sp_76=synthetic_control_sp_76'
synthetic_control_sp_77=synthetic_control_sp_77'
synthetic_control_sp_78=synthetic_control_sp_78'
synthetic_control_sp_79=synthetic_control_sp_79'
synthetic_control_sp_80=synthetic_control_sp_80'
synthetic_control_sp_84=synthetic_control_sp_84'
synthetic_control_sp_86=synthetic_control_sp_86'
synthetic_control_sp_87=synthetic_control_sp_87'
synthetic_control_sp_88=synthetic_control_sp_88'
synthetic_control_sp_89=synthetic_control_sp_89'
synthetic_control_sp_91=synthetic_control_sp_91'
synthetic_control_sp_92=synthetic_control_sp_92'
synthetic_control_sp_95=synthetic_control_sp_95'
synthetic_control_sp_100=synthetic_control_sp_100'
synthetic_control_sp_104=synthetic_control_sp_104'
synthetic_control_sp_105=synthetic_control_sp_105'
synthetic_control_sp_106=synthetic_control_sp_106'
synthetic_control_sp_107=synthetic_control_sp_107'
synthetic_control_sp_108=synthetic_control_sp_108'
synthetic_control_sp_112=synthetic_control_sp_112'
synthetic_control_sp_119=synthetic_control_sp_119'
synthetic_control_sp_125=synthetic_control_sp_125'
synthetic_control_sp_129=synthetic_control_sp_129'
synthetic_control_sp_130=synthetic_control_sp_130'
synthetic_control_sp_133=synthetic_control_sp_133'
synthetic_control_sp_139=synthetic_control_sp_139'
synthetic_control_sp_140=synthetic_control_sp_140'
synthetic_control_sp_141=synthetic_control_sp_141'
synthetic_control_sp_144=synthetic_control_sp_144'
synthetic_control_sp_149=synthetic_control_sp_149'
synthetic_control_sp_150=synthetic_control_sp_150'
synthetic_control_sp_152=synthetic_control_sp_152'
synthetic_control_sp_153=synthetic_control_sp_153'
synthetic_control_sp_157=synthetic_control_sp_157'
synthetic_control_sp_158=synthetic_control_sp_158'
synthetic_control_sp_159=synthetic_control_sp_159'
synthetic_control_sp_162=synthetic_control_sp_162'
synthetic_control_sp_169=synthetic_control_sp_169'


tratado_1=tratado_1'
tratado_7=tratado_7'
tratado_10=tratado_10'
tratado_16=tratado_16'
tratado_17=tratado_17'
tratado_18=tratado_18'
tratado_23=tratado_23'
tratado_26=tratado_26'
tratado_27=tratado_27'
tratado_38=tratado_38'
tratado_39=tratado_39'
tratado_41=tratado_41'
tratado_42=tratado_42'
tratado_44=tratado_44'
tratado_45=tratado_45'
tratado_55=tratado_55'
tratado_57=tratado_57'
tratado_65=tratado_65'
tratado_66=tratado_66'
tratado_71=tratado_71'
tratado_75=tratado_75'
tratado_76=tratado_76'
tratado_77=tratado_77'
tratado_78=tratado_78'
tratado_79=tratado_79'
tratado_80=tratado_80'
tratado_84=tratado_84'
tratado_86=tratado_86'
tratado_87=tratado_87'
tratado_88=tratado_88'
tratado_89=tratado_89'
tratado_91=tratado_91'
tratado_92=tratado_92'
tratado_95=tratado_95'
tratado_100=tratado_100'
tratado_104=tratado_104'
tratado_105=tratado_105'
tratado_106=tratado_106'
tratado_107=tratado_107'
tratado_108=tratado_108'
tratado_112=tratado_112'
tratado_119=tratado_119'
tratado_125=tratado_125'
tratado_129=tratado_129'
tratado_130=tratado_130'
tratado_133=tratado_133'
tratado_139=tratado_139'
tratado_140=tratado_140'
tratado_141=tratado_141'
tratado_144=tratado_144'
tratado_149=tratado_149'
tratado_150=tratado_150'
tratado_152=tratado_152'
tratado_153=tratado_153'
tratado_157=tratado_157'
tratado_158=tratado_158'
tratado_159=tratado_159'
tratado_162=tratado_162'
tratado_169=tratado_169'

%% PARTE 17: EXPORTO LOS OUTPUTS
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_1,1)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_7,7)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_10,10)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_16,16)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_17,17)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_18,18)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_23,23)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_26,26)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_27,27)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_38,38)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_39,39)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_41,41)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_42,42)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_44,44)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_45,45)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_55,55)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_57,57)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_65,65)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_66,66)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_71,71)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_75,75)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_76,76)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_77,77)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_78,78)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_79,79)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_80,80)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_84,84)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_86,86)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_87,87)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_88,88)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_89,89)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_91,91)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_92,92)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_95,95)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_100,100)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_104,104)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_105,105)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_106,106)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_107,107)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_108,108)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_112,112)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_119,119)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_125,125)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_129,129)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_130,130)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_133,133)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_139,139)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_140,140)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_141,141)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_144,144)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_149,149)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_150,150)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_152,152)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_153,153)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_157,157)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_158,158)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_159,159)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_162,162)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_outputs.xlsx',synthetic_control_169,169)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_1,1)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_7,7)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_10,10)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_16,16)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_17,17)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_18,18)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_23,23)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_26,26)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_27,27)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_38,38)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_39,39)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_41,41)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_42,42)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_44,44)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_45,45)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_55,55)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_57,57)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_65,65)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_66,66)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_71,71)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_75,75)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_76,76)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_77,77)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_78,78)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_79,79)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_80,80)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_84,84)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_86,86)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_87,87)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_88,88)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_89,89)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_91,91)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_92,92)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_95,95)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_100,100)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_104,104)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_105,105)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_106,106)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_107,107)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_108,108)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_112,112)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_119,119)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_125,125)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_129,129)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_130,130)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_133,133)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_139,139)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_140,140)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_141,141)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_144,144)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_149,149)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_150,150)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_152,152)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_153,153)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_157,157)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_158,158)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_159,159)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_162,162)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\synthetic_control_spillover_outputs.xlsx',synthetic_control_sp_169,169)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_1,1)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_7,7)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_10,10)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_16,16)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_17,17)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_18,18)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_23,23)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_26,26)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_27,27)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_38,38)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_39,39)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_41,41)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_42,42)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_44,44)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_45,45)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_55,55)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_57,57)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_65,65)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_66,66)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_71,71)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_75,75)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_76,76)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_77,77)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_78,78)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_79,79)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_80,80)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_84,84)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_86,86)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_87,87)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_88,88)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_89,89)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_91,91)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_92,92)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_95,95)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_100,100)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_104,104)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_105,105)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_106,106)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_107,107)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_108,108)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_112,112)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_119,119)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_125,125)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_129,129)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_130,130)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_133,133)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_139,139)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_140,140)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_141,141)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_144,144)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_149,149)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_150,150)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_152,152)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_153,153)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_157,157)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_158,158)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_159,159)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_162,162)
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\observado_outputs.xlsx',tratado_169,169)


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
p_value_vec_7 = zeros(1,S);
lb_vec_7 = zeros(1,S);
ub_vec_7 = zeros(1,S);
for s = 1 : S
    [p_value_7,lb_7,ub_7] = sp_andrews_te(Y_pre_7,pobreza_7(:,T+s),A_7,C,.05);
    p_value_vec_7(s) = p_value_7;
    lb_vec_7(s) = lb_7;
    ub_vec_7(s) = ub_7;
end
p_value_vec_10 = zeros(1,S);
lb_vec_10 = zeros(1,S);
ub_vec_10 = zeros(1,S);
for s = 1 : S
    [p_value_10,lb_10,ub_10] = sp_andrews_te(Y_pre_10,pobreza_10(:,T+s),A_10,C,.05);
    p_value_vec_10(s) = p_value_10;
    lb_vec_10(s) = lb_10;
    ub_vec_10(s) = ub_10;
end
p_value_vec_16 = zeros(1,S);
lb_vec_16 = zeros(1,S);
ub_vec_16 = zeros(1,S);
for s = 1 : S
    [p_value_16,lb_16,ub_16] = sp_andrews_te(Y_pre_16,pobreza_16(:,T+s),A_16,C,.05);
    p_value_vec_16(s) = p_value_16;
    lb_vec_16(s) = lb_16;
    ub_vec_16(s) = ub_16;
end
p_value_vec_17 = zeros(1,S);
lb_vec_17 = zeros(1,S);
ub_vec_17 = zeros(1,S);
for s = 1 : S
    [p_value_17,lb_17,ub_17] = sp_andrews_te(Y_pre_17,pobreza_17(:,T+s),A_17,C,.05);
    p_value_vec_17(s) = p_value_17;
    lb_vec_17(s) = lb_17;
    ub_vec_17(s) = ub_17;
end
p_value_vec_18 = zeros(1,S);
lb_vec_18 = zeros(1,S);
ub_vec_18 = zeros(1,S);
for s = 1 : S
    [p_value_18,lb_18,ub_18] = sp_andrews_te(Y_pre_18,pobreza_18(:,T+s),A_18,C,.05);
    p_value_vec_18(s) = p_value_18;
    lb_vec_18(s) = lb_18;
    ub_vec_18(s) = ub_18;
end
p_value_vec_23 = zeros(1,S);
lb_vec_23 = zeros(1,S);
ub_vec_23 = zeros(1,S);
for s = 1 : S
    [p_value_23,lb_23,ub_23] = sp_andrews_te(Y_pre_23,pobreza_23(:,T+s),A_23,C,.05);
    p_value_vec_23(s) = p_value_23;
    lb_vec_23(s) = lb_23;
    ub_vec_23(s) = ub_23;
end
p_value_vec_26 = zeros(1,S);
lb_vec_26 = zeros(1,S);
ub_vec_26 = zeros(1,S);
for s = 1 : S
    [p_value_26,lb_26,ub_26] = sp_andrews_te(Y_pre_26,pobreza_26(:,T+s),A_26,C,.05);
    p_value_vec_26(s) = p_value_26;
    lb_vec_26(s) = lb_26;
    ub_vec_26(s) = ub_26;
end
p_value_vec_27 = zeros(1,S);
lb_vec_27 = zeros(1,S);
ub_vec_27 = zeros(1,S);
for s = 1 : S
    [p_value_27,lb_27,ub_27] = sp_andrews_te(Y_pre_27,pobreza_27(:,T+s),A_27,C,.05);
    p_value_vec_27(s) = p_value_27;
    lb_vec_27(s) = lb_27;
    ub_vec_27(s) = ub_27;
end
p_value_vec_38 = zeros(1,S);
lb_vec_38 = zeros(1,S);
ub_vec_38 = zeros(1,S);
for s = 1 : S
    [p_value_38,lb_38,ub_38] = sp_andrews_te(Y_pre_38,pobreza_38(:,T+s),A_38,C,.05);
    p_value_vec_38(s) = p_value_38;
    lb_vec_38(s) = lb_38;
    ub_vec_38(s) = ub_38;
end
p_value_vec_39 = zeros(1,S);
lb_vec_39 = zeros(1,S);
ub_vec_39 = zeros(1,S);
for s = 1 : S
    [p_value_39,lb_39,ub_39] = sp_andrews_te(Y_pre_39,pobreza_39(:,T+s),A_39,C,.05);
    p_value_vec_39(s) = p_value_39;
    lb_vec_39(s) = lb_39;
    ub_vec_39(s) = ub_39;
end
p_value_vec_41 = zeros(1,S);
lb_vec_41 = zeros(1,S);
ub_vec_41 = zeros(1,S);
for s = 1 : S
    [p_value_41,lb_41,ub_41] = sp_andrews_te(Y_pre_41,pobreza_41(:,T+s),A_41,C,.05);
    p_value_vec_41(s) = p_value_41;
    lb_vec_41(s) = lb_41;
    ub_vec_41(s) = ub_41;
end
p_value_vec_42 = zeros(1,S);
lb_vec_42 = zeros(1,S);
ub_vec_42 = zeros(1,S);
for s = 1 : S
    [p_value_42,lb_42,ub_42] = sp_andrews_te(Y_pre_42,pobreza_42(:,T+s),A_42,C,.05);
    p_value_vec_42(s) = p_value_42;
    lb_vec_42(s) = lb_42;
    ub_vec_42(s) = ub_42;
end
p_value_vec_44 = zeros(1,S);
lb_vec_44 = zeros(1,S);
ub_vec_44 = zeros(1,S);
for s = 1 : S
    [p_value_44,lb_44,ub_44] = sp_andrews_te(Y_pre_44,pobreza_44(:,T+s),A_44,C,.05);
    p_value_vec_44(s) = p_value_44;
    lb_vec_44(s) = lb_44;
    ub_vec_44(s) = ub_44;
end
p_value_vec_45 = zeros(1,S);
lb_vec_45 = zeros(1,S);
ub_vec_45 = zeros(1,S);
for s = 1 : S
    [p_value_45,lb_45,ub_45] = sp_andrews_te(Y_pre_45,pobreza_45(:,T+s),A_45,C,.05);
    p_value_vec_45(s) = p_value_45;
    lb_vec_45(s) = lb_45;
    ub_vec_45(s) = ub_45;
end
p_value_vec_55 = zeros(1,S);
lb_vec_55 = zeros(1,S);
ub_vec_55 = zeros(1,S);
for s = 1 : S
    [p_value_55,lb_55,ub_55] = sp_andrews_te(Y_pre_55,pobreza_55(:,T+s),A_55,C,.05);
    p_value_vec_55(s) = p_value_55;
    lb_vec_55(s) = lb_55;
    ub_vec_55(s) = ub_55;
end
p_value_vec_57 = zeros(1,S);
lb_vec_57 = zeros(1,S);
ub_vec_57 = zeros(1,S);
for s = 1 : S
    [p_value_57,lb_57,ub_57] = sp_andrews_te(Y_pre_57,pobreza_57(:,T+s),A_57,C,.05);
    p_value_vec_57(s) = p_value_57;
    lb_vec_57(s) = lb_57;
    ub_vec_57(s) = ub_57;
end
p_value_vec_65 = zeros(1,S);
lb_vec_65 = zeros(1,S);
ub_vec_65 = zeros(1,S);
for s = 1 : S
    [p_value_65,lb_65,ub_65] = sp_andrews_te(Y_pre_65,pobreza_65(:,T+s),A_65,C,.05);
    p_value_vec_65(s) = p_value_65;
    lb_vec_65(s) = lb_65;
    ub_vec_65(s) = ub_65;
end
p_value_vec_66 = zeros(1,S);
lb_vec_66 = zeros(1,S);
ub_vec_66 = zeros(1,S);
for s = 1 : S
    [p_value_66,lb_66,ub_66] = sp_andrews_te(Y_pre_66,pobreza_66(:,T+s),A_66,C,.05);
    p_value_vec_66(s) = p_value_66;
    lb_vec_66(s) = lb_66;
    ub_vec_66(s) = ub_66;
end
p_value_vec_71 = zeros(1,S);
lb_vec_71 = zeros(1,S);
ub_vec_71 = zeros(1,S);
for s = 1 : S
    [p_value_71,lb_71,ub_71] = sp_andrews_te(Y_pre_71,pobreza_71(:,T+s),A_71,C,.05);
    p_value_vec_71(s) = p_value_71;
    lb_vec_71(s) = lb_71;
    ub_vec_71(s) = ub_71;
end
p_value_vec_75 = zeros(1,S);
lb_vec_75 = zeros(1,S);
ub_vec_75 = zeros(1,S);
for s = 1 : S
    [p_value_75,lb_75,ub_75] = sp_andrews_te(Y_pre_75,pobreza_75(:,T+s),A_75,C,.05);
    p_value_vec_75(s) = p_value_75;
    lb_vec_75(s) = lb_75;
    ub_vec_75(s) = ub_75;
end
p_value_vec_76 = zeros(1,S);
lb_vec_76 = zeros(1,S);
ub_vec_76 = zeros(1,S);
for s = 1 : S
    [p_value_76,lb_76,ub_76] = sp_andrews_te(Y_pre_76,pobreza_76(:,T+s),A_76,C,.05);
    p_value_vec_76(s) = p_value_76;
    lb_vec_76(s) = lb_76;
    ub_vec_76(s) = ub_76;
end
p_value_vec_77 = zeros(1,S);
lb_vec_77 = zeros(1,S);
ub_vec_77 = zeros(1,S);
for s = 1 : S
    [p_value_77,lb_77,ub_77] = sp_andrews_te(Y_pre_77,pobreza_77(:,T+s),A_77,C,.05);
    p_value_vec_77(s) = p_value_77;
    lb_vec_77(s) = lb_77;
    ub_vec_77(s) = ub_77;
end
p_value_vec_78 = zeros(1,S);
lb_vec_78 = zeros(1,S);
ub_vec_78 = zeros(1,S);
for s = 1 : S
    [p_value_78,lb_78,ub_78] = sp_andrews_te(Y_pre_78,pobreza_78(:,T+s),A_78,C,.05);
    p_value_vec_78(s) = p_value_78;
    lb_vec_78(s) = lb_78;
    ub_vec_78(s) = ub_78;
end
p_value_vec_79 = zeros(1,S);
lb_vec_79 = zeros(1,S);
ub_vec_79 = zeros(1,S);
for s = 1 : S
    [p_value_79,lb_79,ub_79] = sp_andrews_te(Y_pre_79,pobreza_79(:,T+s),A_79,C,.05);
    p_value_vec_79(s) = p_value_79;
    lb_vec_79(s) = lb_79;
    ub_vec_79(s) = ub_79;
end
p_value_vec_80 = zeros(1,S);
lb_vec_80 = zeros(1,S);
ub_vec_80 = zeros(1,S);
for s = 1 : S
    [p_value_80,lb_80,ub_80] = sp_andrews_te(Y_pre_80,pobreza_80(:,T+s),A_80,C,.05);
    p_value_vec_80(s) = p_value_80;
    lb_vec_80(s) = lb_80;
    ub_vec_80(s) = ub_80;
end
p_value_vec_84 = zeros(1,S);
lb_vec_84 = zeros(1,S);
ub_vec_84 = zeros(1,S);
for s = 1 : S
    [p_value_84,lb_84,ub_84] = sp_andrews_te(Y_pre_84,pobreza_84(:,T+s),A_84,C,.05);
    p_value_vec_84(s) = p_value_84;
    lb_vec_84(s) = lb_84;
    ub_vec_84(s) = ub_84;
end
p_value_vec_86 = zeros(1,S);
lb_vec_86 = zeros(1,S);
ub_vec_86 = zeros(1,S);
for s = 1 : S
    [p_value_86,lb_86,ub_86] = sp_andrews_te(Y_pre_86,pobreza_86(:,T+s),A_86,C,.05);
    p_value_vec_86(s) = p_value_86;
    lb_vec_86(s) = lb_86;
    ub_vec_86(s) = ub_86;
end
p_value_vec_87 = zeros(1,S);
lb_vec_87 = zeros(1,S);
ub_vec_87 = zeros(1,S);
for s = 1 : S
    [p_value_87,lb_87,ub_87] = sp_andrews_te(Y_pre_87,pobreza_87(:,T+s),A_87,C,.05);
    p_value_vec_87(s) = p_value_87;
    lb_vec_87(s) = lb_87;
    ub_vec_87(s) = ub_87;
end
p_value_vec_88 = zeros(1,S);
lb_vec_88 = zeros(1,S);
ub_vec_88 = zeros(1,S);
for s = 1 : S
    [p_value_88,lb_88,ub_88] = sp_andrews_te(Y_pre_88,pobreza_88(:,T+s),A_88,C,.05);
    p_value_vec_88(s) = p_value_88;
    lb_vec_88(s) = lb_88;
    ub_vec_88(s) = ub_88;
end
p_value_vec_89 = zeros(1,S);
lb_vec_89 = zeros(1,S);
ub_vec_89 = zeros(1,S);
for s = 1 : S
    [p_value_89,lb_89,ub_89] = sp_andrews_te(Y_pre_89,pobreza_89(:,T+s),A_89,C,.05);
    p_value_vec_89(s) = p_value_89;
    lb_vec_89(s) = lb_89;
    ub_vec_89(s) = ub_89;
end
p_value_vec_91 = zeros(1,S);
lb_vec_91 = zeros(1,S);
ub_vec_91 = zeros(1,S);
for s = 1 : S
    [p_value_91,lb_91,ub_91] = sp_andrews_te(Y_pre_91,pobreza_91(:,T+s),A_91,C,.05);
    p_value_vec_91(s) = p_value_91;
    lb_vec_91(s) = lb_91;
    ub_vec_91(s) = ub_91;
end
p_value_vec_92 = zeros(1,S);
lb_vec_92 = zeros(1,S);
ub_vec_92 = zeros(1,S);
for s = 1 : S
    [p_value_92,lb_92,ub_92] = sp_andrews_te(Y_pre_92,pobreza_92(:,T+s),A_92,C,.05);
    p_value_vec_92(s) = p_value_92;
    lb_vec_92(s) = lb_92;
    ub_vec_92(s) = ub_92;
end
p_value_vec_95 = zeros(1,S);
lb_vec_95 = zeros(1,S);
ub_vec_95 = zeros(1,S);
for s = 1 : S
    [p_value_95,lb_95,ub_95] = sp_andrews_te(Y_pre_95,pobreza_95(:,T+s),A_95,C,.05);
    p_value_vec_95(s) = p_value_95;
    lb_vec_95(s) = lb_95;
    ub_vec_95(s) = ub_95;
end
p_value_vec_100 = zeros(1,S);
lb_vec_100 = zeros(1,S);
ub_vec_100 = zeros(1,S);
for s = 1 : S
    [p_value_100,lb_100,ub_100] = sp_andrews_te(Y_pre_100,pobreza_100(:,T+s),A_100,C,.05);
    p_value_vec_100(s) = p_value_100;
    lb_vec_100(s) = lb_100;
    ub_vec_100(s) = ub_100;
end
p_value_vec_104 = zeros(1,S);
lb_vec_104 = zeros(1,S);
ub_vec_104 = zeros(1,S);
for s = 1 : S
    [p_value_104,lb_104,ub_104] = sp_andrews_te(Y_pre_104,pobreza_104(:,T+s),A_104,C,.05);
    p_value_vec_104(s) = p_value_104;
    lb_vec_104(s) = lb_104;
    ub_vec_104(s) = ub_104;
end
p_value_vec_105 = zeros(1,S);
lb_vec_105 = zeros(1,S);
ub_vec_105 = zeros(1,S);
for s = 1 : S
    [p_value_105,lb_105,ub_105] = sp_andrews_te(Y_pre_105,pobreza_105(:,T+s),A_105,C,.05);
    p_value_vec_105(s) = p_value_105;
    lb_vec_105(s) = lb_105;
    ub_vec_105(s) = ub_105;
end
p_value_vec_106 = zeros(1,S);
lb_vec_106 = zeros(1,S);
ub_vec_106 = zeros(1,S);
for s = 1 : S
    [p_value_106,lb_106,ub_106] = sp_andrews_te(Y_pre_106,pobreza_106(:,T+s),A_106,C,.05);
    p_value_vec_106(s) = p_value_106;
    lb_vec_106(s) = lb_106;
    ub_vec_106(s) = ub_106;
end
p_value_vec_107 = zeros(1,S);
lb_vec_107 = zeros(1,S);
ub_vec_107 = zeros(1,S);
for s = 1 : S
    [p_value_107,lb_107,ub_107] = sp_andrews_te(Y_pre_107,pobreza_107(:,T+s),A_107,C,.05);
    p_value_vec_107(s) = p_value_107;
    lb_vec_107(s) = lb_107;
    ub_vec_107(s) = ub_107;
end
p_value_vec_108 = zeros(1,S);
lb_vec_108 = zeros(1,S);
ub_vec_108 = zeros(1,S);
for s = 1 : S
    [p_value_108,lb_108,ub_108] = sp_andrews_te(Y_pre_108,pobreza_108(:,T+s),A_108,C,.05);
    p_value_vec_108(s) = p_value_108;
    lb_vec_108(s) = lb_108;
    ub_vec_108(s) = ub_108;
end
p_value_vec_112 = zeros(1,S);
lb_vec_112 = zeros(1,S);
ub_vec_112 = zeros(1,S);
for s = 1 : S
    [p_value_112,lb_112,ub_112] = sp_andrews_te(Y_pre_112,pobreza_112(:,T+s),A_112,C,.05);
    p_value_vec_112(s) = p_value_112;
    lb_vec_112(s) = lb_112;
    ub_vec_112(s) = ub_112;
end
p_value_vec_119 = zeros(1,S);
lb_vec_119 = zeros(1,S);
ub_vec_119 = zeros(1,S);
for s = 1 : S
    [p_value_119,lb_119,ub_119] = sp_andrews_te(Y_pre_119,pobreza_119(:,T+s),A_119,C,.05);
    p_value_vec_119(s) = p_value_119;
    lb_vec_119(s) = lb_119;
    ub_vec_119(s) = ub_119;
end
p_value_vec_125 = zeros(1,S);
lb_vec_125 = zeros(1,S);
ub_vec_125 = zeros(1,S);
for s = 1 : S
    [p_value_125,lb_125,ub_125] = sp_andrews_te(Y_pre_125,pobreza_125(:,T+s),A_125,C,.05);
    p_value_vec_125(s) = p_value_125;
    lb_vec_125(s) = lb_125;
    ub_vec_125(s) = ub_125;
end
p_value_vec_129 = zeros(1,S);
lb_vec_129 = zeros(1,S);
ub_vec_129 = zeros(1,S);
for s = 1 : S
    [p_value_129,lb_129,ub_129] = sp_andrews_te(Y_pre_129,pobreza_129(:,T+s),A_129,C,.05);
    p_value_vec_129(s) = p_value_129;
    lb_vec_129(s) = lb_129;
    ub_vec_129(s) = ub_129;
end
p_value_vec_130 = zeros(1,S);
lb_vec_130 = zeros(1,S);
ub_vec_130 = zeros(1,S);
for s = 1 : S
    [p_value_130,lb_130,ub_130] = sp_andrews_te(Y_pre_130,pobreza_130(:,T+s),A_130,C,.05);
    p_value_vec_130(s) = p_value_130;
    lb_vec_130(s) = lb_130;
    ub_vec_130(s) = ub_130;
end
p_value_vec_133 = zeros(1,S);
lb_vec_133 = zeros(1,S);
ub_vec_133 = zeros(1,S);
for s = 1 : S
    [p_value_133,lb_133,ub_133] = sp_andrews_te(Y_pre_133,pobreza_133(:,T+s),A_133,C,.05);
    p_value_vec_133(s) = p_value_133;
    lb_vec_133(s) = lb_133;
    ub_vec_133(s) = ub_133;
end
p_value_vec_139 = zeros(1,S);
lb_vec_139 = zeros(1,S);
ub_vec_139 = zeros(1,S);
for s = 1 : S
    [p_value_139,lb_139,ub_139] = sp_andrews_te(Y_pre_139,pobreza_139(:,T+s),A_139,C,.05);
    p_value_vec_139(s) = p_value_139;
    lb_vec_139(s) = lb_139;
    ub_vec_139(s) = ub_139;
end
p_value_vec_140 = zeros(1,S);
lb_vec_140 = zeros(1,S);
ub_vec_140 = zeros(1,S);
for s = 1 : S
    [p_value_140,lb_140,ub_140] = sp_andrews_te(Y_pre_140,pobreza_140(:,T+s),A_140,C,.05);
    p_value_vec_140(s) = p_value_140;
    lb_vec_140(s) = lb_140;
    ub_vec_140(s) = ub_140;
end
p_value_vec_141 = zeros(1,S);
lb_vec_141 = zeros(1,S);
ub_vec_141 = zeros(1,S);
for s = 1 : S
    [p_value_141,lb_141,ub_141] = sp_andrews_te(Y_pre_141,pobreza_141(:,T+s),A_141,C,.05);
    p_value_vec_141(s) = p_value_141;
    lb_vec_141(s) = lb_141;
    ub_vec_141(s) = ub_141;
end
p_value_vec_144 = zeros(1,S);
lb_vec_144 = zeros(1,S);
ub_vec_144 = zeros(1,S);
for s = 1 : S
    [p_value_144,lb_144,ub_144] = sp_andrews_te(Y_pre_144,pobreza_144(:,T+s),A_144,C,.05);
    p_value_vec_144(s) = p_value_144;
    lb_vec_144(s) = lb_144;
    ub_vec_144(s) = ub_144;
end
p_value_vec_149 = zeros(1,S);
lb_vec_149 = zeros(1,S);
ub_vec_149 = zeros(1,S);
for s = 1 : S
    [p_value_149,lb_149,ub_149] = sp_andrews_te(Y_pre_149,pobreza_149(:,T+s),A_149,C,.05);
    p_value_vec_149(s) = p_value_149;
    lb_vec_149(s) = lb_149;
    ub_vec_149(s) = ub_149;
end
p_value_vec_150 = zeros(1,S);
lb_vec_150 = zeros(1,S);
ub_vec_150 = zeros(1,S);
for s = 1 : S
    [p_value_150,lb_150,ub_150] = sp_andrews_te(Y_pre_150,pobreza_150(:,T+s),A_150,C,.05);
    p_value_vec_150(s) = p_value_150;
    lb_vec_150(s) = lb_150;
    ub_vec_150(s) = ub_150;
end
p_value_vec_152 = zeros(1,S);
lb_vec_152 = zeros(1,S);
ub_vec_152 = zeros(1,S);
for s = 1 : S
    [p_value_152,lb_152,ub_152] = sp_andrews_te(Y_pre_152,pobreza_152(:,T+s),A_152,C,.05);
    p_value_vec_152(s) = p_value_152;
    lb_vec_152(s) = lb_152;
    ub_vec_152(s) = ub_152;
end
p_value_vec_153 = zeros(1,S);
lb_vec_153 = zeros(1,S);
ub_vec_153 = zeros(1,S);
for s = 1 : S
    [p_value_153,lb_153,ub_153] = sp_andrews_te(Y_pre_153,pobreza_153(:,T+s),A_153,C,.05);
    p_value_vec_153(s) = p_value_153;
    lb_vec_153(s) = lb_153;
    ub_vec_153(s) = ub_153;
end
p_value_vec_157 = zeros(1,S);
lb_vec_157 = zeros(1,S);
ub_vec_157 = zeros(1,S);
for s = 1 : S
    [p_value_157,lb_157,ub_157] = sp_andrews_te(Y_pre_157,pobreza_157(:,T+s),A_157,C,.05);
    p_value_vec_157(s) = p_value_157;
    lb_vec_157(s) = lb_157;
    ub_vec_157(s) = ub_157;
end
p_value_vec_158 = zeros(1,S);
lb_vec_158 = zeros(1,S);
ub_vec_158 = zeros(1,S);
for s = 1 : S
    [p_value_158,lb_158,ub_158] = sp_andrews_te(Y_pre_158,pobreza_158(:,T+s),A_158,C,.05);
    p_value_vec_158(s) = p_value_158;
    lb_vec_158(s) = lb_158;
    ub_vec_158(s) = ub_158;
end
p_value_vec_159 = zeros(1,S);
lb_vec_159 = zeros(1,S);
ub_vec_159 = zeros(1,S);
for s = 1 : S
    [p_value_159,lb_159,ub_159] = sp_andrews_te(Y_pre_159,pobreza_159(:,T+s),A_159,C,.05);
    p_value_vec_159(s) = p_value_159;
    lb_vec_159(s) = lb_159;
    ub_vec_159(s) = ub_159;
end
p_value_vec_162 = zeros(1,S);
lb_vec_162 = zeros(1,S);
ub_vec_162 = zeros(1,S);
for s = 1 : S
    [p_value_162,lb_162,ub_162] = sp_andrews_te(Y_pre_162,pobreza_162(:,T+s),A_162,C,.05);
    p_value_vec_162(s) = p_value_162;
    lb_vec_162(s) = lb_162;
    ub_vec_162(s) = ub_162;
end
p_value_vec_169 = zeros(1,S);
lb_vec_169 = zeros(1,S);
ub_vec_169 = zeros(1,S);
for s = 1 : S
    [p_value_169,lb_169,ub_169] = sp_andrews_te(Y_pre_169,pobreza_169(:,T+s),A_169,C,.05);
    p_value_vec_169(s) = p_value_169;
    lb_vec_169(s) = lb_169;
    ub_vec_169(s) = ub_169;
end
%% PARTE 19 INFERENCE - SPILLOVER EFFECTS
alpha_sig = .05;
spillover_test_1 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_1(s) = sp_andrews(Y_pre_1,pobreza_1(:,T+s),A_1,C,d,alpha_sig);
end
spillover_test_7 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_7(s) = sp_andrews(Y_pre_7,pobreza_7(:,T+s),A_7,C,d,alpha_sig);
end
spillover_test_10 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_10(s) = sp_andrews(Y_pre_10,pobreza_10(:,T+s),A_10,C,d,alpha_sig);
end
spillover_test_16 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_16(s) = sp_andrews(Y_pre_16,pobreza_16(:,T+s),A_16,C,d,alpha_sig);
end
spillover_test_17 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_17(s) = sp_andrews(Y_pre_17,pobreza_17(:,T+s),A_17,C,d,alpha_sig);
end
spillover_test_18 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_18(s) = sp_andrews(Y_pre_18,pobreza_18(:,T+s),A_18,C,d,alpha_sig);
end
spillover_test_23 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_23(s) = sp_andrews(Y_pre_23,pobreza_23(:,T+s),A_23,C,d,alpha_sig);
end
spillover_test_26 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_26(s) = sp_andrews(Y_pre_26,pobreza_26(:,T+s),A_26,C,d,alpha_sig);
end
spillover_test_27 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_27(s) = sp_andrews(Y_pre_27,pobreza_27(:,T+s),A_27,C,d,alpha_sig);
end
spillover_test_38 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_38(s) = sp_andrews(Y_pre_38,pobreza_38(:,T+s),A_38,C,d,alpha_sig);
end
spillover_test_39 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_39(s) = sp_andrews(Y_pre_39,pobreza_39(:,T+s),A_39,C,d,alpha_sig);
end
spillover_test_41 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_41(s) = sp_andrews(Y_pre_41,pobreza_41(:,T+s),A_41,C,d,alpha_sig);
end
spillover_test_42 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_42(s) = sp_andrews(Y_pre_42,pobreza_42(:,T+s),A_42,C,d,alpha_sig);
end
spillover_test_44 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_44(s) = sp_andrews(Y_pre_44,pobreza_44(:,T+s),A_44,C,d,alpha_sig);
end
spillover_test_45 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_45(s) = sp_andrews(Y_pre_45,pobreza_45(:,T+s),A_45,C,d,alpha_sig);
end
spillover_test_55 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_55(s) = sp_andrews(Y_pre_55,pobreza_55(:,T+s),A_55,C,d,alpha_sig);
end
spillover_test_57 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_57(s) = sp_andrews(Y_pre_57,pobreza_57(:,T+s),A_57,C,d,alpha_sig);
end
spillover_test_65 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_65(s) = sp_andrews(Y_pre_65,pobreza_65(:,T+s),A_65,C,d,alpha_sig);
end
spillover_test_66 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_66(s) = sp_andrews(Y_pre_66,pobreza_66(:,T+s),A_66,C,d,alpha_sig);
end
spillover_test_71 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_71(s) = sp_andrews(Y_pre_71,pobreza_71(:,T+s),A_71,C,d,alpha_sig);
end
spillover_test_75 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_75(s) = sp_andrews(Y_pre_75,pobreza_75(:,T+s),A_75,C,d,alpha_sig);
end
spillover_test_76 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_76(s) = sp_andrews(Y_pre_76,pobreza_76(:,T+s),A_76,C,d,alpha_sig);
end
spillover_test_77 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_77(s) = sp_andrews(Y_pre_77,pobreza_77(:,T+s),A_77,C,d,alpha_sig);
end
spillover_test_78 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_78(s) = sp_andrews(Y_pre_78,pobreza_78(:,T+s),A_78,C,d,alpha_sig);
end
spillover_test_79 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_79(s) = sp_andrews(Y_pre_79,pobreza_79(:,T+s),A_79,C,d,alpha_sig);
end
spillover_test_80 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_80(s) = sp_andrews(Y_pre_80,pobreza_80(:,T+s),A_80,C,d,alpha_sig);
end
spillover_test_84 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_84(s) = sp_andrews(Y_pre_84,pobreza_84(:,T+s),A_84,C,d,alpha_sig);
end
spillover_test_86 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_86(s) = sp_andrews(Y_pre_86,pobreza_86(:,T+s),A_86,C,d,alpha_sig);
end
spillover_test_87 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_87(s) = sp_andrews(Y_pre_87,pobreza_87(:,T+s),A_87,C,d,alpha_sig);
end
spillover_test_88 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_88(s) = sp_andrews(Y_pre_88,pobreza_88(:,T+s),A_88,C,d,alpha_sig);
end
spillover_test_89 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_89(s) = sp_andrews(Y_pre_89,pobreza_89(:,T+s),A_89,C,d,alpha_sig);
end
spillover_test_91 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_91(s) = sp_andrews(Y_pre_91,pobreza_91(:,T+s),A_91,C,d,alpha_sig);
end
spillover_test_92 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_92(s) = sp_andrews(Y_pre_92,pobreza_92(:,T+s),A_92,C,d,alpha_sig);
end
spillover_test_95 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_95(s) = sp_andrews(Y_pre_95,pobreza_95(:,T+s),A_95,C,d,alpha_sig);
end
spillover_test_100 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_100(s) = sp_andrews(Y_pre_100,pobreza_100(:,T+s),A_100,C,d,alpha_sig);
end
spillover_test_104 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_104(s) = sp_andrews(Y_pre_104,pobreza_104(:,T+s),A_104,C,d,alpha_sig);
end
spillover_test_105 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_105(s) = sp_andrews(Y_pre_105,pobreza_105(:,T+s),A_105,C,d,alpha_sig);
end
spillover_test_106 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_106(s) = sp_andrews(Y_pre_106,pobreza_106(:,T+s),A_106,C,d,alpha_sig);
end
spillover_test_107 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_107(s) = sp_andrews(Y_pre_107,pobreza_107(:,T+s),A_107,C,d,alpha_sig);
end
spillover_test_108 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_108(s) = sp_andrews(Y_pre_108,pobreza_108(:,T+s),A_108,C,d,alpha_sig);
end
spillover_test_112 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_112(s) = sp_andrews(Y_pre_112,pobreza_112(:,T+s),A_112,C,d,alpha_sig);
end
spillover_test_119 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_119(s) = sp_andrews(Y_pre_119,pobreza_119(:,T+s),A_119,C,d,alpha_sig);
end
spillover_test_125 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_125(s) = sp_andrews(Y_pre_125,pobreza_125(:,T+s),A_125,C,d,alpha_sig);
end
spillover_test_129 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_129(s) = sp_andrews(Y_pre_129,pobreza_129(:,T+s),A_129,C,d,alpha_sig);
end
spillover_test_130 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_130(s) = sp_andrews(Y_pre_130,pobreza_130(:,T+s),A_130,C,d,alpha_sig);
end
spillover_test_133 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_133(s) = sp_andrews(Y_pre_133,pobreza_133(:,T+s),A_133,C,d,alpha_sig);
end
spillover_test_139 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_139(s) = sp_andrews(Y_pre_139,pobreza_139(:,T+s),A_139,C,d,alpha_sig);
end
spillover_test_140 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_140(s) = sp_andrews(Y_pre_140,pobreza_140(:,T+s),A_140,C,d,alpha_sig);
end
spillover_test_141 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_141(s) = sp_andrews(Y_pre_141,pobreza_141(:,T+s),A_141,C,d,alpha_sig);
end
spillover_test_144 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_144(s) = sp_andrews(Y_pre_144,pobreza_144(:,T+s),A_144,C,d,alpha_sig);
end
spillover_test_149 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_149(s) = sp_andrews(Y_pre_149,pobreza_149(:,T+s),A_149,C,d,alpha_sig);
end
spillover_test_150 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_150(s) = sp_andrews(Y_pre_150,pobreza_150(:,T+s),A_150,C,d,alpha_sig);
end
spillover_test_152 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_152(s) = sp_andrews(Y_pre_152,pobreza_152(:,T+s),A_152,C,d,alpha_sig);
end
spillover_test_153 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_153(s) = sp_andrews(Y_pre_153,pobreza_153(:,T+s),A_153,C,d,alpha_sig);
end
spillover_test_157 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_157(s) = sp_andrews(Y_pre_157,pobreza_157(:,T+s),A_157,C,d,alpha_sig);
end
spillover_test_158 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_158(s) = sp_andrews(Y_pre_158,pobreza_158(:,T+s),A_158,C,d,alpha_sig);
end
spillover_test_159 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_159(s) = sp_andrews(Y_pre_159,pobreza_159(:,T+s),A_159,C,d,alpha_sig);
end
spillover_test_162 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_162(s) = sp_andrews(Y_pre_162,pobreza_162(:,T+s),A_162,C,d,alpha_sig);
end
spillover_test_169 = zeros(1,S);
for s = 1 : S
    C = [zeros(N-1,1) eye(N-1)];
    d = zeros(N-1,1);
    spillover_test_169(s) = sp_andrews(Y_pre_169,pobreza_169(:,T+s),A_169,C,d,alpha_sig);
end

%% PARTE 20 EXPORTANDO OUTPUTS DE LOS TEST
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_1','lb_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_1','ub_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_1','p_value_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_1','alpha1_hat_vec_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_1','sp_test_1');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_7','lb_vec_7');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_7','ub_vec_7');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_7','p_value_vec_7');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_7','alpha1_hat_vec_7');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_7','sp_test_7');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_10','lb_vec_10');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_10','ub_vec_10');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_10','p_value_vec_10');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_10','alpha1_hat_vec_10');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_10','sp_test_10');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_16','lb_vec_16');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_16','ub_vec_16');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_16','p_value_vec_16');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_16','alpha1_hat_vec_16');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_16','sp_test_16');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_17','lb_vec_17');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_17','ub_vec_17');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_17','p_value_vec_17');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_17','alpha1_hat_vec_17');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_17','sp_test_17');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_18','lb_vec_18');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_18','ub_vec_18');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_18','p_value_vec_18');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_18','alpha1_hat_vec_18');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_18','sp_test_18');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_23','lb_vec_23');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_23','ub_vec_23');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_23','p_value_vec_23');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_23','alpha1_hat_vec_23');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_23','sp_test_23');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_26','lb_vec_26');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_26','ub_vec_26');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_26','p_value_vec_26');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_26','alpha1_hat_vec_26');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_26','sp_test_26');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_27','lb_vec_27');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_27','ub_vec_27');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_27','p_value_vec_27');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_27','alpha1_hat_vec_27');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_27','sp_test_27');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_38','lb_vec_38');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_38','ub_vec_38');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_38','p_value_vec_38');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_38','alpha1_hat_vec_38');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_38','sp_test_38');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_39','lb_vec_39');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_39','ub_vec_39');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_39','p_value_vec_39');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_39','alpha1_hat_vec_39');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_39','sp_test_39');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_41','lb_vec_41');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_41','ub_vec_41');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_41','p_value_vec_41');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_41','alpha1_hat_vec_41');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_41','sp_test_41');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_42','lb_vec_42');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_42','ub_vec_42');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_42','p_value_vec_42');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_42','alpha1_hat_vec_42');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_42','sp_test_42');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_44','lb_vec_44');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_44','ub_vec_44');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_44','p_value_vec_44');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_44','alpha1_hat_vec_44');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_44','sp_test_44');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_45','lb_vec_45');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_45','ub_vec_45');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_45','p_value_vec_45');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_45','alpha1_hat_vec_45');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_45','sp_test_45');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_55','lb_vec_55');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_55','ub_vec_55');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_55','p_value_vec_55');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_55','alpha1_hat_vec_55');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_55','sp_test_55');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_57','lb_vec_57');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_57','ub_vec_57');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_57','p_value_vec_57');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_57','alpha1_hat_vec_57');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_57','sp_test_57');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_65','lb_vec_65');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_65','ub_vec_65');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_65','p_value_vec_65');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_65','alpha1_hat_vec_65');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_65','sp_test_65');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_66','lb_vec_66');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_66','ub_vec_66');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_66','p_value_vec_66');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_66','alpha1_hat_vec_66');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_66','sp_test_66');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_71','lb_vec_71');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_71','ub_vec_71');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_71','p_value_vec_71');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_71','alpha1_hat_vec_71');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_71','sp_test_71');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_75','lb_vec_75');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_75','ub_vec_75');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_75','p_value_vec_75');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_75','alpha1_hat_vec_75');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_75','sp_test_75');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_76','lb_vec_76');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_76','ub_vec_76');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_76','p_value_vec_76');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_76','alpha1_hat_vec_76');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_76','sp_test_76');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_77','lb_vec_77');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_77','ub_vec_77');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_77','p_value_vec_77');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_77','alpha1_hat_vec_77');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_77','sp_test_77');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_78','lb_vec_78');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_78','ub_vec_78');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_78','p_value_vec_78');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_78','alpha1_hat_vec_78');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_78','sp_test_78');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_79','lb_vec_79');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_79','ub_vec_79');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_79','p_value_vec_79');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_79','alpha1_hat_vec_79');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_79','sp_test_79');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_80','lb_vec_80');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_80','ub_vec_80');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_80','p_value_vec_80');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_80','alpha1_hat_vec_80');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_80','sp_test_80');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_84','lb_vec_84');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_84','ub_vec_84');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_84','p_value_vec_84');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_84','alpha1_hat_vec_84');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_84','sp_test_84');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_86','lb_vec_86');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_86','ub_vec_86');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_86','p_value_vec_86');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_86','alpha1_hat_vec_86');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_86','sp_test_86');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_87','lb_vec_87');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_87','ub_vec_87');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_87','p_value_vec_87');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_87','alpha1_hat_vec_87');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_87','sp_test_87');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_88','lb_vec_88');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_88','ub_vec_88');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_88','p_value_vec_88');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_88','alpha1_hat_vec_88');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_88','sp_test_88');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_89','lb_vec_89');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_89','ub_vec_89');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_89','p_value_vec_89');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_89','alpha1_hat_vec_89');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_89','sp_test_89');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_91','lb_vec_91');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_91','ub_vec_91');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_91','p_value_vec_91');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_91','alpha1_hat_vec_91');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_91','sp_test_91');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_92','lb_vec_92');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_92','ub_vec_92');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_92','p_value_vec_92');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_92','alpha1_hat_vec_92');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_92','sp_test_92');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_95','lb_vec_95');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_95','ub_vec_95');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_95','p_value_vec_95');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_95','alpha1_hat_vec_95');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_95','sp_test_95');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_100','lb_vec_100');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_100','ub_vec_100');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_100','p_value_vec_100');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_100','alpha1_hat_vec_100');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_100','sp_test_100');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_104','lb_vec_104');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_104','ub_vec_104');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_104','p_value_vec_104');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_104','alpha1_hat_vec_104');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_104','sp_test_104');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_105','lb_vec_105');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_105','ub_vec_105');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_105','p_value_vec_105');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_105','alpha1_hat_vec_105');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_105','sp_test_105');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_106','lb_vec_106');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_106','ub_vec_106');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_106','p_value_vec_106');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_106','alpha1_hat_vec_106');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_106','sp_test_106');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_107','lb_vec_107');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_107','ub_vec_107');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_107','p_value_vec_107');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_107','alpha1_hat_vec_107');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_107','sp_test_107');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_108','lb_vec_108');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_108','ub_vec_108');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_108','p_value_vec_108');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_108','alpha1_hat_vec_108');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_108','sp_test_108');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_112','lb_vec_112');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_112','ub_vec_112');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_112','p_value_vec_112');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_112','alpha1_hat_vec_112');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_112','sp_test_112');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_119','lb_vec_119');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_119','ub_vec_119');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_119','p_value_vec_119');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_119','alpha1_hat_vec_119');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_119','sp_test_119');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_125','lb_vec_125');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_125','ub_vec_125');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_125','p_value_vec_125');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_125','alpha1_hat_vec_125');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_125','sp_test_125');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_129','lb_vec_129');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_129','ub_vec_129');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_129','p_value_vec_129');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_129','alpha1_hat_vec_129');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_129','sp_test_129');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_130','lb_vec_130');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_130','ub_vec_130');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_130','p_value_vec_130');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_130','alpha1_hat_vec_130');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_130','sp_test_130');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_133','lb_vec_133');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_133','ub_vec_133');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_133','p_value_vec_133');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_133','alpha1_hat_vec_133');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_133','sp_test_133');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_139','lb_vec_139');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_139','ub_vec_139');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_139','p_value_vec_139');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_139','alpha1_hat_vec_139');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_139','sp_test_139');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_140','lb_vec_140');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_140','ub_vec_140');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_140','p_value_vec_140');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_140','alpha1_hat_vec_140');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_140','sp_test_140');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_141','lb_vec_141');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_141','ub_vec_141');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_141','p_value_vec_141');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_141','alpha1_hat_vec_141');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_141','sp_test_141');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_144','lb_vec_144');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_144','ub_vec_144');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_144','p_value_vec_144');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_144','alpha1_hat_vec_144');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_144','sp_test_144');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_149','lb_vec_149');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_149','ub_vec_149');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_149','p_value_vec_149');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_149','alpha1_hat_vec_149');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_149','sp_test_149');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_150','lb_vec_150');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_150','ub_vec_150');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_150','p_value_vec_150');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_150','alpha1_hat_vec_150');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_150','sp_test_150');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_152','lb_vec_152');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_152','ub_vec_152');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_152','p_value_vec_152');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_152','alpha1_hat_vec_152');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_152','sp_test_152');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_153','lb_vec_153');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_153','ub_vec_153');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_153','p_value_vec_153');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_153','alpha1_hat_vec_153');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_153','sp_test_153');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_157','lb_vec_157');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_157','ub_vec_157');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_157','p_value_vec_157');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_157','alpha1_hat_vec_157');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_157','sp_test_157');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_158','lb_vec_158');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_158','ub_vec_158');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_158','p_value_vec_158');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_158','alpha1_hat_vec_158');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_158','sp_test_158');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_159','lb_vec_159');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_159','ub_vec_159');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_159','p_value_vec_159');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_159','alpha1_hat_vec_159');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_159','sp_test_159');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_162','lb_vec_162');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_162','ub_vec_162');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_162','p_value_vec_162');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_162','alpha1_hat_vec_162');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_162','sp_test_162');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',lb_vec_169','lb_vec_169');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',ub_vec_169','ub_vec_169');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',p_value_vec_169','p_value_vec_169');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',alpha1_hat_vec_169','alpha1_hat_vec_169');
xlswrite('G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4\output_tests.xlsx',spillover_test_169','sp_test_169');
