
global graficas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\GRAFICAS_TRATADO_CONTROL"
use "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\BD_BaseFinalBalanceada.dta", clear
keep NombreProvincia provincia periodo CORTEAL1 P_mujeresPEAO educ_persona PEAO_inf ingreso_peao Edadjefe densidad tiempo_cs miembros porc_alimentos indicedecriminalidad year
keep if year==2019
collapse (mean) P_mujeresPEAO educ_persona PEAO_inf ingreso_peao Edadjefe densidad tiempo_cs miembros porc_alimentos indicedecriminalidad, by(provincia)

foreach var in P_mujeresPEAO educ_persona PEAO_inf ingreso_peao Edadjefe densidad tiempo_cs miembros porc_alimentos indicedecriminalidad {
egen mean_`var'=mean(`var')
}



gen d_P_mujeresPEAO=(P_mujeresPEAO>mean_P_mujeresPEAO)
gen d_educ_persona=(educ_persona<mean_educ_persona)
gen d_PEAO_inf=(PEAO_inf>mean_PEAO_inf)
gen d_ingreso_peao=(ingreso_peao<mean_ingreso_peao)
gen d_Edadjefe=(Edadjefe>mean_Edadjefe)
gen d_densidad=(densidad>mean_densidad)
gen d_tiempo_cs=(tiempo_cs>mean_tiempo_cs)
gen d_miembros=(miembros>mean_miembros)
gen d_porc_alimentos=(porc_alimentos>mean_porc_alimentos)
gen d_indicedecriminalidad=(indicedecriminalidad>mean_indicedecriminalidad)
keep provincia d_* 
save "$graficas\d_spillovers.dta", replace




cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
collapse (mean) ingreso_peao pobre peao PEAO_f PEAO_inf, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}

* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white) 
graph export "$graficas\pobre_promedio.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio.png", replace






************* POR TIPO: 
*Grafico 2: criminalidad 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_indicedecriminalidad==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_criminalidad_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_criminalidad_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_criminalidad_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_criminalidad_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_criminalidad_1.png", replace



************* POR TIPO: 
*Grafico 2: criminalidad 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_indicedecriminalidad==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_criminalidad_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_criminalidad_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_criminalidad_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_criminalidad_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_criminalidad_0.png", replace



************* POR TIPO: 
*Grafico 2: densidad 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_miembros==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_densidad_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_densidad_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_densidad_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_densidad_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_densidad_1.png", replace



************* POR TIPO: 
*Grafico 2: densidad 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_miembros==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_densidad_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_densidad_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_densidad_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_densidad_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_densidad_0.png", replace




************* POR TIPO: 
*Grafico 2: edad jefe 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_Edadjefe==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_edad_jefe_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_edad_jefe_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_edad_jefe_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_edad_jefe_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_edad_jefe_1.png", replace



************* POR TIPO: 
*Grafico 2: edad_jefe 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_Edadjefe==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_edad_jefe_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_edad_jefe_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_edad_jefe_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_edad_jefe_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_edad_jefe_0.png", replace



************* POR TIPO: 
*Grafico 2: mujeres 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_P_mujeresPEAO==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_mujeres_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_mujeres_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_mujeres_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_mujeres_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_mujeres_1.png", replace



************* POR TIPO: 
*Grafico 2: mujeres 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_P_mujeresPEAO==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_mujeres_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_mujeres_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_mujeres_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_mujeres_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_mujeres_0.png", replace



************* POR TIPO: 
*Grafico 2: niv_educ 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_educ_persona==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_niv_educ_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_niv_educ_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_niv_educ_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_niv_educ_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_niv_educ_1.png", replace



************* POR TIPO: 
*Grafico 2: niv_educ 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_educ_persona==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_niv_educ_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) , xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_niv_educ_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_niv_educ_0.png", replace
*peao
graph twoway ///
(scatter peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_niv_educ_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_niv_educ_0.png", replace



************* POR TIPO: 
*Grafico 2: ingreso_peao 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_ingreso_peao==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_ingreso_peao_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_ingreso_peao_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_ingreso_peao_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_ingreso_peao_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_ingreso_peao_1.png", replace



************* POR TIPO: 
*Grafico 2: ingreso_peao 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_ingreso_peao==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_ingreso_peao_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_ingreso_peao_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_ingreso_peao_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_ingreso_peao_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_ingreso_peao_0.png", replace






************* POR TIPO: 
*Grafico 2: informalidad 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_PEAO_inf==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_informalidad_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_informalidad_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_informalidad_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_informalidad_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_informalidad_1.png", replace



************* POR TIPO: 
*Grafico 2: informalidad 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_PEAO_inf==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_informalidad_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_informalidad_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_informalidad_0.png", replace
*peao
graph twoway ///
(scatter peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_informalidad_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_informalidad_0.png", replace






************* POR TIPO: 
*Grafico 2: alimentos 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_porc_alimentos==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_alimentos_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_alimentos_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_alimentos_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_alimentos_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_alimentos_1.png", replace



************* POR TIPO: 
*Grafico 2: alimentos 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_porc_alimentos==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_alimentos_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_alimentos_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_alimentos_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_alimentos_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_alimentos_0.png", replace






************* POR TIPO: 
*Grafico 2: densidad_g 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_densidad==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)), xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_densidad_g_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) , xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_densidad_g_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) , xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_densidad_g_1.png", replace
*peao
graph twoway ///
(scatter peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) , xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_densidad_g_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao1 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) , xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_densidad_g_1.png", replace



************* POR TIPO: 
*Grafico 2: densidad_g 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_densidad==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_densidad_g_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_densidad_g_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_densidad_g_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_densidad_g_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_densidad_g_0.png", replace






************* POR TIPO: 
*Grafico 2: tiempo_cs 1
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_tiempo_cs==1
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_tiempo_cs_1.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_tiempo_cs_1.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_tiempo_cs_1.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_tiempo_cs_1.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_tiempo_cs_1.png", replace



************* POR TIPO: 
*Grafico 2: tiempo_cs 0
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use "BD_BaseFinalBalanceada.dta", clear
xtset provincia periodo
gen group=(CORTEAL1=="TRATADO")
tab provincia group
rename P_Pobreza pobre 
rename PEAO peao
xtset provincia periodo
keep  ingreso_peao pobre peao PEAO_f PEAO_inf provincia group periodo
merge m:1 provincia using "$graficas\d_spillovers.dta", nogen 
keep if d_tiempo_cs==0
collapse (mean) PEAO_f PEAO_inf ingreso_peao peao pobre, by (group periodo)
quietly: reshape wide PEAO_f PEAO_inf ingreso_peao peao pobre, i(periodo) j(group)
lab var periodo "Trimestre"
foreach v in PEAO_f PEAO_inf ingreso_peao peao pobre {
lab var `v'0 "Grupo de Control"
lab var `v'1 "Grupo de Tratamiento"
}
* pobre 
graph twoway ///
(scatter pobre0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line pobre1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("% de incidencia de pobreza ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\pobre_promedio_tiempo_cs_0.png", replace
*PEAO_f
graph twoway ///
(scatter PEAO_f0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_f1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO formal", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_f_promedio_tiempo_cs_0.png", replace
*PEAO_inf
graph twoway ///
(scatter PEAO_inf0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line PEAO_inf1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO informal ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\PEAO_inf_promedio_tiempo_cs_0.png", replace
*peao
graph twoway ///
(scatter peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("PEAO ", size(*0.8)) graphregion(color(white)) bgcolor(white)
graph export "$graficas\peao_promedio_tiempo_cs_0.png", replace
*ingreso_peao
graph twoway ///
(scatter ingreso_peao0 periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line ingreso_peao1 periodo, connect(direct) lcolor(black)), ///
xtitle("Trimestres") xlabel(1(1)44, grid labsize(*0.6)) xline(37, lcolor(black)) ytitle("Ingresos de la PEAO ", size(*0.8))  graphregion(color(white)) bgcolor(white)
graph export "$graficas\ingreso_peao_promedio_tiempo_cs_0.png", replace













