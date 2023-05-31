global pobre "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza"
global cuadro "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\cuadros"
cd "$pobre"

** Alimentos simulacion 1 
foreach j of numlist 18	26	84	169 {
import excel "$pobre\alimentos\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\alimentos\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\alimentos\1%/simulacion_1\sp_alimentos_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\alimentos\1%/simulacion_1\sp_alimentos_simulacion_1_provincia_18.dta", clear 
foreach j of numlist 26	84 169 {
append using "$pobre\alimentos\1%/simulacion_1\sp_alimentos_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="alimentos"
order  spillover simulacion provincia
save "$cuadro\sp_alimentos_simulacion_1.dta", replace



** Alimentos simulacion 2 
foreach j of numlist 18	26	78	80	144	169 {
import excel "$pobre\alimentos\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\alimentos\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\alimentos\1%/simulacion_2\sp_alimentos_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\alimentos\1%/simulacion_2\sp_alimentos_simulacion_2_provincia_18.dta", clear 
foreach j of numlist 26	78	80	144	169  {
append using "$pobre\alimentos\1%/simulacion_2\sp_alimentos_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="alimentos"
order  spillover simulacion provincia
save "$cuadro\sp_alimentos_simulacion_2.dta", replace





** Alimentos simulacion 3 
foreach j of numlist 18	26	78	80	144	169 {
import excel "$pobre\alimentos\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\alimentos\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\alimentos\1%/simulacion_3\sp_alimentos_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\alimentos\1%/simulacion_3\sp_alimentos_simulacion_3_provincia_18.dta", clear 
foreach j of numlist 26	78	80	144	169  {
append using "$pobre\alimentos\1%/simulacion_3\sp_alimentos_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="alimentos"
order  spillover simulacion provincia
save "$cuadro\sp_alimentos_simulacion_3.dta", replace






** Alimentos simulacion 4 
foreach j of numlist 18	26	79	80	84	125	144	169  {
import excel "$pobre\alimentos\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\alimentos\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\alimentos\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\alimentos\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\alimentos\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\alimentos\1%/simulacion_4\sp_alimentos_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\alimentos\1%/simulacion_4\sp_alimentos_simulacion_4_provincia_18.dta", clear 
foreach j of numlist 26	79	80	84	125	144	169   {
append using "$pobre\alimentos\1%/simulacion_4\sp_alimentos_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="alimentos"
order  spillover simulacion provincia
save "$cuadro\sp_alimentos_simulacion_4.dta", replace






** bajo_ingreso simulacion 1 
foreach j of numlist 17	26	91	169 {
import excel "$pobre\bajo_ingreso\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_ingreso\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_ingreso\1%/simulacion_1\sp_bajo_ingreso_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\bajo_ingreso\1%/simulacion_1\sp_bajo_ingreso_simulacion_1_provincia_17.dta", clear 
foreach j of numlist 26	91	169 {
append using "$pobre\bajo_ingreso\1%/simulacion_1\sp_bajo_ingreso_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="bajo_ingreso"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_ingreso_simulacion_1.dta", replace




** bajo_ingreso simulacion 2 
foreach j of numlist 10	39	79	80	91	144	169 {
import excel "$pobre\bajo_ingreso\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_ingreso\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_ingreso\1%/simulacion_2\sp_bajo_ingreso_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\bajo_ingreso\1%/simulacion_2\sp_bajo_ingreso_simulacion_2_provincia_10.dta", clear 
foreach j of numlist 39	79	80	91	144	169 {
append using "$pobre\bajo_ingreso\1%/simulacion_2\sp_bajo_ingreso_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="bajo_ingreso"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_ingreso_simulacion_2.dta", replace





** bajo_ingreso simulacion 3 
foreach j of numlist 10	18	39	79	80	84	91	144	169 {
import excel "$pobre\bajo_ingreso\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_ingreso\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_ingreso\1%/simulacion_3\sp_bajo_ingreso_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\bajo_ingreso\1%/simulacion_3\sp_bajo_ingreso_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 18	39	79	80	84	91	144	169 {
append using "$pobre\bajo_ingreso\1%/simulacion_3\sp_bajo_ingreso_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="bajo_ingreso"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_ingreso_simulacion_3.dta", replace


** bajo_ingreso simulacion 4 
foreach j of numlist 10	17	18	78	79	80	84	91	100	150	169  {
import excel "$pobre\bajo_ingreso\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_ingreso\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_ingreso\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_ingreso\1%/simulacion_4\sp_bajo_ingreso_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\bajo_ingreso\1%/simulacion_4\sp_bajo_ingreso_simulacion_4_provincia_10.dta", clear 
foreach j of numlist 17	18	78	79	80	84	91	100	150	169  {
append using "$pobre\bajo_ingreso\1%/simulacion_4\sp_bajo_ingreso_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="bajo_ingreso"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_ingreso_simulacion_4.dta", replace




** bajo_niv_educ simulacion 1 
foreach j of numlist 26	84	91	100	125	169 {
import excel "$pobre\bajo_niv_educ\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_niv_educ\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_niv_educ\1%/simulacion_1\sp_bajo_niv_educ_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\bajo_niv_educ\1%/simulacion_1\sp_bajo_niv_educ_simulacion_1_provincia_26.dta", clear 
foreach j of numlist 84	91	100	125	169 {
append using "$pobre\bajo_niv_educ\1%/simulacion_1\sp_bajo_niv_educ_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="bajo_niv_educ"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_niv_educ_simulacion_1.dta", replace



** bajo_niv_educ simulacion 3
foreach j of numlist 10	39	79	80	84	91	169 {
import excel "$pobre\bajo_niv_educ\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_niv_educ\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_niv_educ\1%/simulacion_3\sp_bajo_niv_educ_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\bajo_niv_educ\1%/simulacion_3\sp_bajo_niv_educ_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 39	79	80	84	91	169 {
append using "$pobre\bajo_niv_educ\1%/simulacion_3\sp_bajo_niv_educ_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3 
gen spillover="bajo_niv_educ"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_niv_educ_simulacion_3.dta", replace




** bajo_niv_educ simulacion 4
foreach j of numlist 10	39	79	80	84	91	169 {
import excel "$pobre\bajo_niv_educ\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\bajo_niv_educ\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\bajo_niv_educ\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\bajo_niv_educ\1%/simulacion_4\sp_bajo_niv_educ_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\bajo_niv_educ\1%/simulacion_4\sp_bajo_niv_educ_simulacion_4_provincia_10.dta", clear 
foreach j of numlist 39	79	80	84	91	169 {
append using "$pobre\bajo_niv_educ\1%/simulacion_4\sp_bajo_niv_educ_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="bajo_niv_educ"
order  spillover simulacion provincia
save "$cuadro\sp_bajo_niv_educ_simulacion_4.dta", replace



** criminalidad simulacion 1 
foreach j of numlist 76 {
import excel "$pobre\criminalidad\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\criminalidad\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\criminalidad\1%/simulacion_1\sp_criminalidad_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\criminalidad\1%/simulacion_1\sp_criminalidad_simulacion_1_provincia_76.dta", clear 
*foreach j of numlist {
*append using "$pobre\criminalidad\1%/simulacion_1\sp_criminalidad_simulacion_1_provincia_`j'.dta"
*}
gen simulacion=1 
gen spillover="criminalidad"
order  spillover simulacion provincia
save "$cuadro\sp_criminalidad_simulacion_1.dta", replace



** criminalidad simulacion 2 
foreach j of numlist 18	79 {
import excel "$pobre\criminalidad\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace

use "$pobre\criminalidad\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\criminalidad\1%/simulacion_2\sp_criminalidad_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\criminalidad\1%/simulacion_2\sp_criminalidad_simulacion_2_provincia_18.dta", clear 
foreach j of numlist 79 {
append using "$pobre\criminalidad\1%/simulacion_2\sp_criminalidad_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="criminalidad"
order  spillover simulacion provincia
save "$cuadro\sp_criminalidad_simulacion_2.dta", replace



** criminalidad simulacion 3 
foreach j of numlist 18	79 {
import excel "$pobre\criminalidad\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace

use "$pobre\criminalidad\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\criminalidad\1%/simulacion_3\sp_criminalidad_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\criminalidad\1%/simulacion_3\sp_criminalidad_simulacion_3_provincia_18.dta", clear 
foreach j of numlist 79 {
append using "$pobre\criminalidad\1%/simulacion_3\sp_criminalidad_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="criminalidad"
order  spillover simulacion provincia
save "$cuadro\sp_criminalidad_simulacion_3.dta", replace




** criminalidad simulacion 4 
foreach j of numlist 17	76	169 {
import excel "$pobre\criminalidad\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\criminalidad\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\criminalidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace

use "$pobre\criminalidad\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\criminalidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\criminalidad\1%/simulacion_4\sp_criminalidad_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\criminalidad\1%/simulacion_4\sp_criminalidad_simulacion_4_provincia_17.dta", clear 
foreach j of numlist 76	169 {
append using "$pobre\criminalidad\1%/simulacion_4\sp_criminalidad_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="criminalidad"
order  spillover simulacion provincia
save "$cuadro\sp_criminalidad_simulacion_4.dta", replace




** densidad simulacion 1 
foreach j of numlist 18	26	80	84	144	169 {
import excel "$pobre\densidad\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad\1%/simulacion_1\sp_densidad_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\densidad\1%/simulacion_1\sp_densidad_simulacion_1_provincia_18.dta", clear 
foreach j of numlist 26	80	84	144	169 {
append using "$pobre\densidad\1%/simulacion_1\sp_densidad_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="densidad"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_simulacion_1.dta", replace




** densidad simulacion 2 
foreach j of numlist 10	18	39	79	80	91	100	150	169 {
import excel "$pobre\densidad\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad\1%/simulacion_2\sp_densidad_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\densidad\1%/simulacion_2\sp_densidad_simulacion_2_provincia_10.dta", clear 
foreach j of numlist 18	39	79	80	91	100	150	169 {
append using "$pobre\densidad\1%/simulacion_2\sp_densidad_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2 
gen spillover="densidad"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_simulacion_2.dta", replace



** densidad simulacion 3 
foreach j of numlist 10	18	39	79	80	144	169 {
import excel "$pobre\densidad\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad\1%/simulacion_3\sp_densidad_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\densidad\1%/simulacion_3\sp_densidad_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 18	39	79	80	144	169 {
append using "$pobre\densidad\1%/simulacion_3\sp_densidad_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="densidad"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_simulacion_3.dta", replace


** densidad simulacion 4
foreach j of numlist 10	18	39	79	80	144	169 {
import excel "$pobre\densidad\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad\1%/simulacion_4\sp_densidad_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\densidad\1%/simulacion_4\sp_densidad_simulacion_4_provincia_10.dta", clear 
foreach j of numlist 18	39	79	80	144	169 {
append using "$pobre\densidad\1%/simulacion_4\sp_densidad_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="densidad"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_simulacion_4.dta", replace



** densidad_g simulacion 1 
foreach j of numlist 79 {
import excel "$pobre\densidad_g\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad_g\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad_g\1%/simulacion_1\sp_densidad_g_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\densidad_g\1%/simulacion_1\sp_densidad_g_simulacion_1_provincia_79.dta", clear 
*foreach j of numlist 26	80	84	144	169 {
*append using "$pobre\densidad_g\1%/simulacion_1\sp_densidad_g_simulacion_1_provincia_`j'.dta"
*}
gen simulacion=1 
gen spillover="densidad_g"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_g_simulacion_1.dta", replace







** densidad_g simulacion 2
foreach j of numlist 18	39	79	91	150 {
import excel "$pobre\densidad_g\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad_g\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad_g\1%/simulacion_2\sp_densidad_g_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\densidad_g\1%/simulacion_2\sp_densidad_g_simulacion_2_provincia_18.dta", clear 
foreach j of numlist 39	79	91	150 {
append using "$pobre\densidad_g\1%/simulacion_2\sp_densidad_g_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="densidad_g"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_g_simulacion_2.dta", replace




** densidad_g simulacion 3
foreach j of numlist 10	80	91	100	144	169 {
import excel "$pobre\densidad_g\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad_g\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad_g\1%/simulacion_3\sp_densidad_g_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\densidad_g\1%/simulacion_3\sp_densidad_g_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 80	91	100	144	169 {
append using "$pobre\densidad_g\1%/simulacion_3\sp_densidad_g_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="densidad_g"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_g_simulacion_3.dta", replace


** densidad_g simulacion 4
foreach j of numlist 10	18	80	133	169 {
import excel "$pobre\densidad_g\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\densidad_g\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\densidad_g\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\densidad_g\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\densidad_g\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\densidad_g\1%/simulacion_4\sp_densidad_g_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\densidad_g\1%/simulacion_4\sp_densidad_g_simulacion_4_provincia_10.dta", clear 
foreach j of numlist 18	80	133	169 {
append using "$pobre\densidad_g\1%/simulacion_4\sp_densidad_g_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="densidad_g"
order  spillover simulacion provincia
save "$cuadro\sp_densidad_g_simulacion_4.dta", replace




** informalidad simulacion 1 
foreach j of numlist 17	39	91	150 {
import excel "$pobre\informalidad\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\informalidad\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\informalidad\1%/simulacion_1\sp_informalidad_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\informalidad\1%/simulacion_1\sp_informalidad_simulacion_1_provincia_17.dta", clear 
foreach j of numlist 39	91	150 {
append using "$pobre\informalidad\1%/simulacion_1\sp_informalidad_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="informalidad"
order  spillover simulacion provincia
save "$cuadro\sp_informalidad_simulacion_1.dta", replace



** informalidad simulacion 2 
foreach j of numlist 10	39	79	80	91	144	169 {
import excel "$pobre\informalidad\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\informalidad\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\informalidad\1%/simulacion_2\sp_informalidad_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\informalidad\1%/simulacion_2\sp_informalidad_simulacion_2_provincia_10.dta", clear 
foreach j of numlist 39	79	80	91	144	169 {
append using "$pobre\informalidad\1%/simulacion_2\sp_informalidad_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="informalidad"
order  spillover simulacion provincia
save "$cuadro\sp_informalidad_simulacion_2.dta", replace



** informalidad simulacion 3 
foreach j of numlist 10	39	79	80	91	144	169 {
import excel "$pobre\informalidad\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\informalidad\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\informalidad\1%/simulacion_3\sp_informalidad_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\informalidad\1%/simulacion_3\sp_informalidad_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 39	79	80	91	144	169 {
append using "$pobre\informalidad\1%/simulacion_3\sp_informalidad_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="informalidad"
order  spillover simulacion provincia
save "$cuadro\sp_informalidad_simulacion_3.dta", replace




** informalidad simulacion 4
foreach j of numlist 10	17	79	80	84	91	100	150	169 {
import excel "$pobre\informalidad\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\informalidad\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\informalidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\informalidad\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\informalidad\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\informalidad\1%/simulacion_4\sp_informalidad_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\informalidad\1%/simulacion_4\sp_informalidad_simulacion_4_provincia_10.dta", clear 
foreach j of numlist 17	79	80	84	91	100	150	169 {
append using "$pobre\informalidad\1%/simulacion_4\sp_informalidad_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="informalidad"
order  spillover simulacion provincia
save "$cuadro\sp_informalidad_simulacion_4.dta", replace




** jefe_hogar simulacion 1 
foreach j of numlist 17	26	80	150 {
import excel "$pobre\jefe_hogar\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\jefe_hogar\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\jefe_hogar\1%/simulacion_1\sp_jefe_hogar_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\jefe_hogar\1%/simulacion_1\sp_jefe_hogar_simulacion_1_provincia_17.dta", clear 
foreach j of numlist 	26	80	150 {
append using "$pobre\jefe_hogar\1%/simulacion_1\sp_jefe_hogar_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="jefe_hogar"
order  spillover simulacion provincia
save "$cuadro\sp_jefe_hogar_simulacion_1.dta", replace





** jefe_hogar simulacion 2
foreach j of numlist 10	18	39	78	79	80	91	100	150	169 {
import excel "$pobre\jefe_hogar\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\jefe_hogar\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\jefe_hogar\1%/simulacion_2\sp_jefe_hogar_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\jefe_hogar\1%/simulacion_2\sp_jefe_hogar_simulacion_2_provincia_10.dta", clear 
foreach j of numlist 	18	39	78	79	80	91	100	150	169 {
append using "$pobre\jefe_hogar\1%/simulacion_2\sp_jefe_hogar_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="jefe_hogar"
order  spillover simulacion provincia
save "$cuadro\sp_jefe_hogar_simulacion_2.dta", replace




** jefe_hogar simulacion 3
foreach j of numlist 10	18	39	79	80	91	100	150	169 {
import excel "$pobre\jefe_hogar\1%/simulacion_3\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_3\observado_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\jefe_hogar\1%/simulacion_3\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_3\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\jefe_hogar\1%/simulacion_3\sp_jefe_hogar_simulacion_3_provincia_`j'.dta", replace
}

use "$pobre\jefe_hogar\1%/simulacion_3\sp_jefe_hogar_simulacion_3_provincia_10.dta", clear 
foreach j of numlist 	18	39	79	80	91	100	150	169 {
append using "$pobre\jefe_hogar\1%/simulacion_3\sp_jefe_hogar_simulacion_3_provincia_`j'.dta"
}
gen simulacion=3
gen spillover="jefe_hogar"
order  spillover simulacion provincia
save "$cuadro\sp_jefe_hogar_simulacion_3.dta", replace






** jefe_hogar simulacion 4
foreach j of numlist 18	39	79	80	91	100	150	169 {
import excel "$pobre\jefe_hogar\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\jefe_hogar\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\jefe_hogar\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\jefe_hogar\1%/simulacion_4\sp_jefe_hogar_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\jefe_hogar\1%/simulacion_4\sp_jefe_hogar_simulacion_4_provincia_18.dta", clear 
foreach j of numlist 	39	79	80	91	100	150	169 {
append using "$pobre\jefe_hogar\1%/simulacion_4\sp_jefe_hogar_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="jefe_hogar"
order  spillover simulacion provincia
save "$cuadro\sp_jefe_hogar_simulacion_4.dta", replace



** mujeres simulacion 1 
foreach j of numlist 39	91	169 {
import excel "$pobre\mujeres\1%/simulacion_1\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_1\observado_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_1\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_1\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_1\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\mujeres\1%/simulacion_1\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_1\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_1\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\mujeres\1%/simulacion_1\sp_mujeres_simulacion_1_provincia_`j'.dta", replace
}

use "$pobre\mujeres\1%/simulacion_1\sp_mujeres_simulacion_1_provincia_39.dta", clear 
foreach j of numlist 	91	169 {
append using "$pobre\mujeres\1%/simulacion_1\sp_mujeres_simulacion_1_provincia_`j'.dta"
}
gen simulacion=1 
gen spillover="mujeres"
order  spillover simulacion provincia
save "$cuadro\sp_mujeres_simulacion_1.dta", replace


** mujeres simulacion 2 
foreach j of numlist 10	18	39	79	80	91	169 {
import excel "$pobre\mujeres\1%/simulacion_2\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_2\observado_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_2\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_2\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_2\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\mujeres\1%/simulacion_2\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_2\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_2\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\mujeres\1%/simulacion_2\sp_mujeres_simulacion_2_provincia_`j'.dta", replace
}

use "$pobre\mujeres\1%/simulacion_2\sp_mujeres_simulacion_2_provincia_10.dta", clear 
foreach j of numlist 	18	39	79	80	91	169 {
append using "$pobre\mujeres\1%/simulacion_2\sp_mujeres_simulacion_2_provincia_`j'.dta"
}
gen simulacion=2
gen spillover="mujeres"
order  spillover simulacion provincia
save "$cuadro\sp_mujeres_simulacion_2.dta", replace



** mujeres simulacion 4
foreach j of numlist 18	91	150 {
import excel "$pobre\mujeres\1%/simulacion_4\observado_outputs.xlsx", sheet("Hoja`j'") clear
rename A observado 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_4\observado_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_4\synthetic_control_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_4\synthetic_control_outputs_`j'.dta", replace
import excel "$pobre\mujeres\1%/simulacion_4\synthetic_control_spillover_outputs.xlsx", sheet("Hoja`j'") clear
rename A synthetic_control_spillover 
gen periodo=_n
save "$pobre\mujeres\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", replace


use "$pobre\mujeres\1%/simulacion_4\observado_outputs_`j'.dta", clear 
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_4\synthetic_control_outputs_`j'.dta", nogen
merge 1:1 periodo using "$pobre\mujeres\1%/simulacion_4\synthetic_control_spillover_outputs_`j'.dta", nogen
gen provincia=`j'
order provincia periodo
gen dif_cuadr_scm=(observado-synthetic_control)^2
gen dif_cuadr_scm_sp=(observado-synthetic_control_spillover)^2
egen sum_mse_scm_pre=sum(dif_cuadr_scm) if periodo<=37
egen sum_mse_scm_pos=sum(dif_cuadr_scm) if periodo>37
egen sum_mse_scm_sp_pre=sum(dif_cuadr_scm_sp) if periodo<=37
egen sum_mse_scm_sp_pos=sum(dif_cuadr_scm_sp) if periodo>37
replace sum_mse_scm_pre=sum_mse_scm_pre/37
replace sum_mse_scm_pos=sum_mse_scm_pos/7
replace sum_mse_scm_sp_pre=sum_mse_scm_sp_pre/37
replace sum_mse_scm_sp_pos=sum_mse_scm_sp_pos/37
egen mse_pre_scm=mean(sum_mse_scm_pre)
egen mse_pos_scm=mean(sum_mse_scm_pos)
egen mse_pre_scm_sp=mean(sum_mse_scm_sp_pre)
egen mse_pos_scm_sp=mean(sum_mse_scm_sp_pos)
drop sum_* dif_*
keep if periodo>=37
gen ET=observado[_n]-observado[1]
gen EC_P=(observado[_n]-synthetic_control_spillover[_n])
gen ESP=(synthetic_control_spillover[_n]-synthetic_control[_n])-(synthetic_control_spillover[1]-synthetic_control[1])
gen EE=ET-EC_P-ESP
gen EE1=observado[1]-synthetic_control_spillover[1]
gen EE2=EE-EE1
gen ET2=ESP+EC_P+EE
foreach t in ET EC_P ESP EE EE1 EE2 {
replace `t'=`t'*100/observado[1]
}
drop observado synthetic_control synthetic_control_spillover ET2 
order provincia periodo EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp
drop if periodo==37
collapse (mean) EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, by(provincia)
save "$pobre\mujeres\1%/simulacion_4\sp_mujeres_simulacion_4_provincia_`j'.dta", replace
}

use "$pobre\mujeres\1%/simulacion_4\sp_mujeres_simulacion_4_provincia_18.dta", clear 
foreach j of numlist 	91	150 {
append using "$pobre\mujeres\1%/simulacion_4\sp_mujeres_simulacion_4_provincia_`j'.dta"
}
gen simulacion=4
gen spillover="mujeres"
order  spillover simulacion provincia
save "$cuadro\sp_mujeres_simulacion_4.dta", replace





*********************************************************************
cd "$cuadro"
use sp_alimentos_simulacion_1.dta, clear
foreach n of numlist 2/4 {
append using sp_alimentos_simulacion_`n'.dta
}
reshape wide EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, i(simulacion) j(provincia)
save sp_alimentos.dta, replace

foreach t in bajo_ingreso criminalidad densidad densidad_g informalidad jefe_hogar {
use sp_`t'_simulacion_1.dta, clear
foreach n of numlist 2/4 {
append using sp_`t'_simulacion_`n'.dta
}
reshape wide EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, i(simulacion) j(provincia)
save sp_`t'.dta, replace
}


use sp_bajo_niv_educ_simulacion_1.dta, clear
foreach n of numlist  3 4 {
append using sp_bajo_niv_educ_simulacion_`n'.dta
}
reshape wide  EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, i(simulacion) j(provincia)
save sp_bajo_niv_educ.dta, replace

use sp_mujeres_simulacion_1.dta, clear
foreach n of numlist 2 4 {
append using sp_mujeres_simulacion_`n'.dta
}
reshape wide EC_P ESP EE ET  EE1 EE2 mse_pre_scm mse_pos_scm mse_pre_scm_sp mse_pos_scm_sp, i(simulacion) j(provincia)
save sp_mujeres.dta, replace

!erase *_simulacion*.dta



/*

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza"
import excel Cuadro_pobreza.xlsx, firstrow sheet("input_cuadro_promedio") clear
collapse (mean) S1 S2 S3 S4, by(SPILLOVER EFECTOSENPORCENTAJESDELNIVEL)










