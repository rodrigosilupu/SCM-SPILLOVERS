cls 
global inputs "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs"
global intermedios "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios"
global outputs "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs"



*=============================== CUADRO 1 ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

import delimited "$intermedios\infectados_muertos_mundo\WHO-COVID-19-global-data.csv", encoding(UTF-8) clear 
gen year=substr(date_reported, 1, 4)
keep if year=="2020" 
rename (new_deaths new_cases) (deaths cases)
collapse (sum) deaths cases, by (country)
gsort -deaths 
gen rank_death=_n
gsort -cases
gen rank_cases=_n
keep if country=="Austria" | country=="Belgium" | country=="Bulgaria" | country=="Croatia" | country=="Cyprus" | country=="Czechia" | country=="Denmark" | country=="Estonia" | country=="Finland" | country=="France" | country=="Germany" | country=="Greece" | country=="Hungary" | country=="Ireland" | country=="Italy" | country=="Latvia" | country=="Lithuania" | country=="Luxembourg" | country=="Malta" | country=="Netherlands" | country=="Poland" | country=="Portugal" | country=="Romania" | country=="Slovakia" | country=="Slovenia" | country=="Spain" | country=="Sweden" | country=="Peru" | country=="China" | country=="United States of America" | country=="Chile" | country=="Brazil" | country=="Mexico" | country=="Argentina" 
replace deaths=deaths/1000000
replace cases=cases/1000000

gen country2=country
replace country2="Union Europea" if country=="Austria" | country=="Belgium" | country=="Bulgaria" | country=="Croatia" | country=="Cyprus" | country=="Czechia" | country=="Denmark" | country=="Estonia" | country=="Finland" | country=="France" | country=="Germany" | country=="Greece" | country=="Hungary" | country=="Ireland" | country=="Italy" | country=="Latvia" | country=="Lithuania" | country=="Luxembourg" | country=="Malta" | country=="Netherlands" | country=="Poland" | country=="Portugal" | country=="Romania" | country=="Slovakia" | country=="Slovenia" | country=="Spain" | country=="Sweden" 
drop country 
rename country2 country
collapse (sum) deaths cases, by (country)

/*

*=============================== CUADRO 2 ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

use "$intermedios\base_datos_no_anualizada\BD_BaseFinalBalanceada_no_anualizada_12052022.dta", clear
keep provincia year trimestre CORTEAL1 PEAO PEAO_f PEAO_inf pobre ingreso_peao
keep if year==2019 | year==2020 | year==2021
foreach v in PEAO PEAO_f PEAO_inf pobre ingreso_peao {
bys year: egen `v'_mean_peru=mean(`v')
bys year: egen `v'_mean_tra=mean(`v') if CORTEAL1=="TRATADO"
bys year: egen `v'_mean_con=mean(`v') if CORTEAL1=="CONTROL"
gen `v'_mean=`v'_mean_tra if CORTEAL1=="TRATADO"
replace `v'_mean=`v'_mean_con if CORTEAL1=="CONTROL"
drop `v' `v'_mean_tra `v'_mean_con
}
drop trimestre provincia 
sort  year
duplicates drop  year CORTEAL1, force
order year CORTEAL1 pobre_* PEAO_* PEAO_f_* PEAO_inf_* ingreso_*
sort year CORTEAL1
gen order=(CORTEAL1=="CONTROL")
sort year order
drop order

*keep if year==2019 
*collapse (mean) ingreso_peao, by (CORTEAL1)


*=============================== CUADRO 3 ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

*infectados, fallecidos
import excel "$intermedios\infectados\infectados_tratados.xlsx", firstrow sheet("INFECTADOS") clear
keep year ubigeo trimestre positivos_covid fallecidos_covid poblacion
tostring ubigeo, replace
replace ubigeo="0"+ubigeo if length(ubigeo)==5
merge m:1 ubigeo using "$intermedios\infectados\ubigeo_tratados.dta", nogen
gen total_covid=positivos_covid+fallecidos_covid
foreach v in positivos_covid fallecidos_covid total_covid {
replace `v'=`v'*100/poblacion
}
collapse (mean) positivos_covid fallecidos_covid total_covid, by (year CORTEAL1)
*Tasa de Informalidad (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) PEAO_inf, by (CORTEAL1)
gen order=(CORTEAL1=="CONTROL")
sort order
drop order
*Ingreso real Promedio (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) ingreso_peao, by (CORTEAL1)
*Promedio del Nivel Educativo (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) educ_persona, by (CORTEAL1)
*Tiempo al Centro Salud Principal entre distritos de la Provincia en minutos (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) tiempo_cs, by (CORTEAL1)
*Densidad del Número de Miembros del Hogar(2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) miembros, by (CORTEAL1)
*Densidad Geográfica (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
collapse (mean) densidad, by (CORTEAL1)
*Tasa de Delincuencia o Criminalidad (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2018
keep NombreProvincia CORTEAL1 
duplicates drop
merge 1:1 NombreProvincia using "$intermedios\delincuencia\delincuencia.dta", keep(3) nogen
collapse (mean) indicedecriminalidad, by (CORTEAL1)
*Porcentaje del Gasto de Consumo de Bienes Alimenticios del Gasto Total (2019
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
collapse (mean) porc_alimentos_2019, by (CORTEAL1)
*Porcentaje de Mujeres entre 15-65 años del total de miembros del hogar (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) mujeres_PEAO, by (CORTEAL1)
*Edad Promedio del Jefe del Hogar (entre 15 y 65 años) (2019)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2019 
collapse (mean) Edad_jefe, by (CORTEAL1)


*Tasa de Informalidad (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) PEAO_inf, by (CORTEAL1)
*Ingreso real Promedio (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) ingreso_peao, by (CORTEAL1)
*Promedio del Nivel Educativo (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) educ_persona, by (CORTEAL1)
*Tiempo al Centro Salud Principal entre distritos de la Provincia en minutos (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) tiempo_cs, by (CORTEAL1)
*Densidad del Número de Miembros del Hogar(2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) miembros, by (CORTEAL1)
*Densidad Geográfica (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
collapse (mean) densidad, by (CORTEAL1)
*Tasa de Delincuencia o Criminalidad (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2018
keep NombreProvincia CORTEAL1 
duplicates drop
merge 1:1 NombreProvincia using "$intermedios\delincuencia\delincuencia.dta", keep(3) nogen
collapse (mean) indicedecriminalidad, by (CORTEAL1)
*Porcentaje del Gasto de Consumo de Bienes Alimenticios del Gasto Total (2020
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
collapse (mean) porc_alimentos_2020, by (CORTEAL1)
*Porcentaje de Mujeres entre 15-65 años del total de miembros del hogar (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) mujeres_PEAO, by (CORTEAL1)
*Edad Promedio del Jefe del Hogar (entre 15 y 65 años) (2020)
use "$intermedios\base_datos_para_spillover\SP_BaseFinalBalanceada_12052022.dta", clear
keep if year==2020 
collapse (mean) Edad_jefe, by (CORTEAL1)

*/

*=============================== CUADRO 4 ============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
global provincias_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\provincias_significativas"
global provincias_no_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\provincias_no_significativas"
** Solo de las provincias significativas por simulación 


*=========================== informalidad =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\informalidad\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_informalidad_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_informalidad_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_informalidad_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_informalidad_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_informalidad_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_informalidad_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*informalidad simulación 1 
use "$outputs\cuadros\buenos_informalidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/14 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_informalidad_s1_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_informalidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/21 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_informalidad_s1_malos.dta, replace
restore 
}

use p1_informalidad_s1_buenos.dta, clear
foreach n of numlist 2/14 {
append using p`n'_informalidad_s1_buenos.dta
}
gen provincia=17 if p==1
replace provincia=18 if p==2
replace provincia=38 if p==3
replace provincia=39 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=84 if p==7
replace provincia=91 if p==8
replace provincia=92 if p==9
replace provincia=125 if p==10
replace provincia=130 if p==11
replace provincia=144 if p==12
replace provincia=150 if p==13
replace provincia=169 if p==14
order provincia
drop p
save c4_informalidad_buenos_s1.dta, replace 

use p1_informalidad_s1_malos.dta, clear
foreach n of numlist 2/21 {
append using p`n'_informalidad_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=26 if p==4
replace provincia=41 if p==5
replace provincia=45 if p==6
replace provincia=57 if p==7
replace provincia=66 if p==8
replace provincia=71 if p==9
replace provincia=77 if p==10
replace provincia=86 if p==11
replace provincia=87 if p==12
replace provincia=100 if p==13
replace provincia=104 if p==14
replace provincia=106 if p==15
replace provincia=107 if p==16
replace provincia=129 if p==17
replace provincia=139 if p==18
replace provincia=140 if p==19
replace provincia=152 if p==20
replace provincia=157 if p==21
order provincia
drop p
save c4_informalidad_malos_s1.dta, replace
!erase p*

*informalidad simulación 2
use "$outputs\cuadros\buenos_informalidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_informalidad_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_informalidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_informalidad_s2_malos.dta, replace
restore 
}

use p1_informalidad_s2_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_informalidad_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18

order provincia
drop p
save c4_informalidad_buenos_s2.dta, replace 

use p1_informalidad_s2_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_informalidad_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=95 if p==14
replace provincia=100 if p==15
replace provincia=104 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=158 if p==25
replace provincia=162 if p==26

order provincia
drop p
save c4_informalidad_malos_s2.dta, replace
!erase p*

*informalidad simulacion 3
use "$outputs\cuadros\buenos_informalidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_informalidad_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_informalidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/24 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_informalidad_s3_malos.dta, replace
restore 
}

use p1_informalidad_s3_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_informalidad_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18
order provincia
drop p
save c4_informalidad_buenos_s3.dta, replace 

use p1_informalidad_s3_malos.dta, clear
foreach n of numlist 2/24 {
append using p`n'_informalidad_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=100 if p==14
replace provincia=106 if p==15
replace provincia=107 if p==16
replace provincia=112 if p==17
replace provincia=129 if p==18
replace provincia=139 if p==19
replace provincia=141 if p==20
replace provincia=152 if p==21
replace provincia=153 if p==22
replace provincia=158 if p==23
replace provincia=162 if p==24
order provincia
drop p
save c4_informalidad_malos_s3.dta, replace
!erase p*


*informalidad simulacion_4
use "$outputs\cuadros\buenos_informalidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_informalidad_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_informalidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/28 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_informalidad_s4_malos.dta, replace
restore 
}

use p1_informalidad_s4_buenos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_informalidad_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=18 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=39 if p==6
replace provincia=76 if p==7
replace provincia=78 if p==8
replace provincia=79 if p==9
replace provincia=80 if p==10
replace provincia=84 if p==11
replace provincia=91 if p==12
replace provincia=92 if p==13
replace provincia=100 if p==14
replace provincia=125 if p==15
replace provincia=130 if p==16
replace provincia=144 if p==17
replace provincia=150 if p==18
replace provincia=169 if p==19
order provincia
drop p
save c4_informalidad_buenos_s4.dta, replace 

use p1_informalidad_s4_malos.dta, clear
foreach n of numlist 2/28 {
append using p`n'_informalidad_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=23 if p==3
replace provincia=26 if p==4
replace provincia=41 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=88 if p==13
replace provincia=95 if p==14
replace provincia=104 if p==15
replace provincia=106 if p==16
replace provincia=107 if p==17
replace provincia=108 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=140 if p==22
replace provincia=141 if p==23
replace provincia=152 if p==24
replace provincia=153 if p==25
replace provincia=157 if p==26
replace provincia=158 if p==27
replace provincia=162 if p==28
order provincia
drop p
save c4_informalidad_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_informalidad_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_informalidad_`tipo'_s`s'.dta, nogen 
}
gen outcome="informalidad"
order outcome
save c4_informalidad_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 


*=========================== alimentos =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\alimentos\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_alimentos_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_alimentos_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_alimentos_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_alimentos_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_alimentos_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_alimentos_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*alimentos simulación 1 
use "$outputs\cuadros\buenos_alimentos_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/9 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_alimentos_s1_buenos.dta, replace
restore 
}



use "$outputs\cuadros\malos_alimentos_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/31 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_alimentos_s1_malos.dta, replace
restore 
}

use p1_alimentos_s1_buenos.dta, clear
foreach n of numlist 2/9 {
append using p`n'_alimentos_s1_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=84 if p==7
replace provincia=92 if p==8
replace provincia=169 if p==9


order provincia
drop p
save c4_alimentos_buenos_s1.dta, replace 

use p1_alimentos_s1_malos.dta, clear
foreach n of numlist 2/31 {
append using p`n'_alimentos_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=23 if p==4
replace provincia=41 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=55 if p==8
replace provincia=57 if p==9
replace provincia=66 if p==10
replace provincia=71 if p==11
replace provincia=77 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=89 if p==15
replace provincia=95 if p==16
replace provincia=100 if p==17
replace provincia=106 if p==18
replace provincia=107 if p==19
replace provincia=108 if p==20
replace provincia=112 if p==21
replace provincia=129 if p==22
replace provincia=130 if p==23
replace provincia=139 if p==24
replace provincia=140 if p==25
replace provincia=141 if p==26
replace provincia=152 if p==27
replace provincia=153 if p==28
replace provincia=157 if p==29
replace provincia=158 if p==30
replace provincia=162 if p==31
order provincia
drop p
save c4_alimentos_malos_s1.dta, replace
!erase p*

*alimentos simulación 2
use "$outputs\cuadros\buenos_alimentos_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/14 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_alimentos_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_alimentos_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/30 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_alimentos_s2_malos.dta, replace
restore 
}

use p1_alimentos_s2_buenos.dta, clear
foreach n of numlist 2/14 {
append using p`n'_alimentos_s2_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=80 if p==7
replace provincia=84 if p==8
replace provincia=92 if p==9
replace provincia=100 if p==10
replace provincia=125 if p==11
replace provincia=130 if p==12
replace provincia=144 if p==13
replace provincia=169 if p==14
order provincia
drop p
save c4_alimentos_buenos_s2.dta, replace 

use p1_alimentos_s2_malos.dta, clear
foreach n of numlist 2/30 {
append using p`n'_alimentos_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=10 if p==3
replace provincia=16 if p==4
replace provincia=17 if p==5
replace provincia=23 if p==6
replace provincia=41 if p==7
replace provincia=44 if p==8
replace provincia=45 if p==9
replace provincia=55 if p==10
replace provincia=57 if p==11
replace provincia=66 if p==12
replace provincia=71 if p==13
replace provincia=77 if p==14
replace provincia=79 if p==15
replace provincia=86 if p==16
replace provincia=87 if p==17
replace provincia=88 if p==18
replace provincia=104 if p==19
replace provincia=105 if p==20
replace provincia=106 if p==21
replace provincia=107 if p==22
replace provincia=112 if p==23
replace provincia=129 if p==24
replace provincia=139 if p==25
replace provincia=141 if p==26
replace provincia=152 if p==27
replace provincia=153 if p==28
replace provincia=158 if p==29
replace provincia=162 if p==30


order provincia
drop p
save c4_alimentos_malos_s2.dta, replace
!erase p*

*alimentos simulacion 3
use "$outputs\cuadros\buenos_alimentos_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/14 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_alimentos_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_alimentos_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/30 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_alimentos_s3_malos.dta, replace
restore 
}

use p1_alimentos_s3_buenos.dta, clear
foreach n of numlist 2/14 {
append using p`n'_alimentos_s3_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=79 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=92 if p==10
replace provincia=125 if p==11
replace provincia=130 if p==12
replace provincia=144 if p==13
replace provincia=169 if p==14

order provincia
drop p
save c4_alimentos_buenos_s3.dta, replace 

use p1_alimentos_s3_malos.dta, clear
foreach n of numlist 2/30 {
append using p`n'_alimentos_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=23 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=55 if p==9
replace provincia=57 if p==10
replace provincia=66 if p==11
replace provincia=71 if p==12
replace provincia=77 if p==13
replace provincia=86 if p==14
replace provincia=87 if p==15
replace provincia=88 if p==16
replace provincia=100 if p==17
replace provincia=104 if p==18
replace provincia=105 if p==19
replace provincia=106 if p==20
replace provincia=107 if p==21
replace provincia=108 if p==22
replace provincia=112 if p==23
replace provincia=129 if p==24
replace provincia=139 if p==25
replace provincia=141 if p==26
replace provincia=152 if p==27
replace provincia=153 if p==28
replace provincia=158 if p==29
replace provincia=162 if p==30

order provincia
drop p
save c4_alimentos_malos_s3.dta, replace
!erase p*


*alimentos simulacion_4
use "$outputs\cuadros\buenos_alimentos_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/14 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_alimentos_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_alimentos_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/32 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_alimentos_s4_malos.dta, replace
restore 
}

use p1_alimentos_s4_buenos.dta, clear
foreach n of numlist 2/14 {
append using p`n'_alimentos_s4_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=79 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=92 if p==10
replace provincia=125 if p==11
replace provincia=130 if p==12
replace provincia=144 if p==13
replace provincia=169 if p==14

order provincia
drop p
save c4_alimentos_buenos_s4.dta, replace 

use p1_alimentos_s4_malos.dta, clear
foreach n of numlist 2/32 {
append using p`n'_alimentos_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=23 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=55 if p==9
replace provincia=57 if p==10
replace provincia=66 if p==11
replace provincia=71 if p==12
replace provincia=75 if p==13
replace provincia=77 if p==14
replace provincia=86 if p==15
replace provincia=87 if p==16
replace provincia=95 if p==17
replace provincia=100 if p==18
replace provincia=104 if p==19
replace provincia=106 if p==20
replace provincia=107 if p==21
replace provincia=108 if p==22
replace provincia=112 if p==23
replace provincia=129 if p==24
replace provincia=139 if p==25
replace provincia=140 if p==26
replace provincia=141 if p==27
replace provincia=152 if p==28
replace provincia=153 if p==29
replace provincia=157 if p==30
replace provincia=158 if p==31
replace provincia=162 if p==32

order provincia
drop p
save c4_alimentos_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_alimentos_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_alimentos_`tipo'_s`s'.dta, nogen 
}
gen outcome="alimentos"
order outcome
save c4_alimentos_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 




*=========================== bajo_ingreso =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\bajo_ingreso\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_bajo_ingreso_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_bajo_ingreso_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_bajo_ingreso_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_bajo_ingreso_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_bajo_ingreso_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_bajo_ingreso_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*bajo_ingreso simulación 1 
use "$outputs\cuadros\buenos_bajo_ingreso_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/16 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_bajo_ingreso_s1_buenos.dta, replace
restore 
}



use "$outputs\cuadros\malos_bajo_ingreso_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/21 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_bajo_ingreso_s1_malos.dta, replace
restore 
}

use p1_bajo_ingreso_s1_buenos.dta, clear
foreach n of numlist 2/16 {
append using p`n'_bajo_ingreso_s1_buenos.dta
}
gen provincia=17 if p==1
replace provincia=18 if p==2
replace provincia=26 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=39 if p==6
replace provincia=76 if p==7
replace provincia=78 if p==8
replace provincia=79 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=125 if p==13
replace provincia=130 if p==14
replace provincia=144 if p==15
replace provincia=169 if p==16



order provincia
drop p
save c4_bajo_ingreso_buenos_s1.dta, replace 

use p1_bajo_ingreso_s1_malos.dta, clear
foreach n of numlist 2/21 {
append using p`n'_bajo_ingreso_s1_malos.dta
}
gen provincia=16 if p==1
replace provincia=42 if p==2
replace provincia=45 if p==3
replace provincia=57 if p==4
replace provincia=66 if p==5
replace provincia=77 if p==6
replace provincia=86 if p==7
replace provincia=87 if p==8
replace provincia=100 if p==9
replace provincia=106 if p==10
replace provincia=107 if p==11
replace provincia=112 if p==12
replace provincia=129 if p==13
replace provincia=139 if p==14
replace provincia=140 if p==15
replace provincia=141 if p==16
replace provincia=150 if p==17
replace provincia=152 if p==18
replace provincia=153 if p==19
replace provincia=157 if p==20
replace provincia=158 if p==21

order provincia
drop p
save c4_bajo_ingreso_malos_s1.dta, replace
!erase p*

*bajo_ingreso simulación 2
use "$outputs\cuadros\buenos_bajo_ingreso_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_bajo_ingreso_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_bajo_ingreso_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_bajo_ingreso_s2_malos.dta, replace
restore 
}

use p1_bajo_ingreso_s2_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_bajo_ingreso_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18

order provincia
drop p
save c4_bajo_ingreso_buenos_s2.dta, replace 

use p1_bajo_ingreso_s2_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_bajo_ingreso_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=95 if p==14
replace provincia=100 if p==15
replace provincia=104 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=158 if p==25
replace provincia=162 if p==26



order provincia
drop p
save c4_bajo_ingreso_malos_s2.dta, replace
!erase p*

*bajo_ingreso simulacion 3
use "$outputs\cuadros\buenos_bajo_ingreso_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/17 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_bajo_ingreso_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_bajo_ingreso_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/28 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_bajo_ingreso_s3_malos.dta, replace
restore 
}

use p1_bajo_ingreso_s3_buenos.dta, clear
foreach n of numlist 2/17 {
append using p`n'_bajo_ingreso_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=169 if p==17


order provincia
drop p
save c4_bajo_ingreso_buenos_s3.dta, replace 

use p1_bajo_ingreso_s3_malos.dta, clear
foreach n of numlist 2/28 {
append using p`n'_bajo_ingreso_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=88 if p==14
replace provincia=95 if p==15
replace provincia=100 if p==16
replace provincia=104 if p==17
replace provincia=106 if p==18
replace provincia=107 if p==19
replace provincia=112 if p==20
replace provincia=129 if p==21
replace provincia=139 if p==22
replace provincia=141 if p==23
replace provincia=150 if p==24
replace provincia=152 if p==25
replace provincia=153 if p==26
replace provincia=158 if p==27
replace provincia=162 if p==28


order provincia
drop p
save c4_bajo_ingreso_malos_s3.dta, replace
!erase p*


*bajo_ingreso simulacion_4
use "$outputs\cuadros\buenos_bajo_ingreso_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_bajo_ingreso_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_bajo_ingreso_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/29 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_bajo_ingreso_s4_malos.dta, replace
restore 
}

use p1_bajo_ingreso_s4_buenos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_bajo_ingreso_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=18 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=39 if p==6
replace provincia=76 if p==7
replace provincia=78 if p==8
replace provincia=79 if p==9
replace provincia=80 if p==10
replace provincia=84 if p==11
replace provincia=91 if p==12
replace provincia=92 if p==13
replace provincia=100 if p==14
replace provincia=125 if p==15
replace provincia=130 if p==16
replace provincia=144 if p==17
replace provincia=150 if p==18
replace provincia=169 if p==19
order provincia
drop p
save c4_bajo_ingreso_buenos_s4.dta, replace 

use p1_bajo_ingreso_s4_malos.dta, clear
foreach n of numlist 2/29 {
append using p`n'_bajo_ingreso_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=23 if p==3
replace provincia=26 if p==4
replace provincia=41 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=88 if p==14
replace provincia=95 if p==15
replace provincia=104 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=108 if p==19
replace provincia=112 if p==20
replace provincia=129 if p==21
replace provincia=139 if p==22
replace provincia=140 if p==23
replace provincia=141 if p==24
replace provincia=152 if p==25
replace provincia=153 if p==26
replace provincia=157 if p==27
replace provincia=158 if p==28
replace provincia=162 if p==29
order provincia
drop p
save c4_bajo_ingreso_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_bajo_ingreso_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_bajo_ingreso_`tipo'_s`s'.dta, nogen 
}
gen outcome="bajo_ingreso"
order outcome
save c4_bajo_ingreso_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 


*=========================== bajo_niv_educ =====================================
foreach s of numlist 1 3 4 {
cd "$outputs\bajo_niv_educ\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_bajo_niv_educ_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_bajo_niv_educ_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_bajo_niv_educ_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_bajo_niv_educ_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_bajo_niv_educ_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_bajo_niv_educ_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*bajo_niv_educ simulación 1 
use "$outputs\cuadros\buenos_bajo_niv_educ_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/15 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_bajo_niv_educ_s1_buenos.dta, replace
restore 
}



use "$outputs\cuadros\malos_bajo_niv_educ_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/27 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_bajo_niv_educ_s1_malos.dta, replace
restore 
}

use p1_bajo_niv_educ_s1_buenos.dta, clear
foreach n of numlist 2/15 {
append using p`n'_bajo_niv_educ_s1_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=38 if p==3
replace provincia=76 if p==4
replace provincia=78 if p==5
replace provincia=79 if p==6
replace provincia=84 if p==7
replace provincia=91 if p==8
replace provincia=92 if p==9
replace provincia=100 if p==10
replace provincia=119 if p==11
replace provincia=125 if p==12
replace provincia=130 if p==13
replace provincia=144 if p==14
replace provincia=169 if p==15

order provincia
drop p
save c4_bajo_niv_educ_buenos_s1.dta, replace 

use p1_bajo_niv_educ_s1_malos.dta, clear
foreach n of numlist 2/27 {
append using p`n'_bajo_niv_educ_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=23 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=57 if p==9
replace provincia=66 if p==10
replace provincia=71 if p==11
replace provincia=77 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=89 if p==15
replace provincia=104 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=140 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=157 if p==25
replace provincia=158 if p==26
replace provincia=162 if p==27
order provincia
drop p
save c4_bajo_niv_educ_malos_s1.dta, replace
!erase p*


*bajo_niv_educ simulacion 3
use "$outputs\cuadros\buenos_bajo_niv_educ_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_bajo_niv_educ_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_bajo_niv_educ_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_bajo_niv_educ_s3_malos.dta, replace
restore 
}

use p1_bajo_niv_educ_s3_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_bajo_niv_educ_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18
order provincia
drop p
save c4_bajo_niv_educ_buenos_s3.dta, replace 

use p1_bajo_niv_educ_s3_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_bajo_niv_educ_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=88 if p==14
replace provincia=95 if p==15
replace provincia=100 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=158 if p==25
replace provincia=162 if p==26
order provincia
drop p
save c4_bajo_niv_educ_malos_s3.dta, replace
!erase p*


*bajo_niv_educ simulacion_4
use "$outputs\cuadros\buenos_bajo_niv_educ_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_bajo_niv_educ_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_bajo_niv_educ_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_bajo_niv_educ_s4_malos.dta, replace
restore 
}

use p1_bajo_niv_educ_s4_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_bajo_niv_educ_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18
order provincia
drop p
save c4_bajo_niv_educ_buenos_s4.dta, replace 

use p1_bajo_niv_educ_s4_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_bajo_niv_educ_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=86 if p==12
replace provincia=87 if p==13
replace provincia=88 if p==14
replace provincia=95 if p==15
replace provincia=100 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=158 if p==25
replace provincia=162 if p==26
order provincia
drop p
save c4_bajo_niv_educ_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_bajo_niv_educ_`tipo'_s1.dta, clear
foreach s of numlist  3 4 {
merge 1:1 provincia variable using c4_bajo_niv_educ_`tipo'_s`s'.dta, nogen 
}
gen outcome="bajo_niv_educ"
order outcome
save c4_bajo_niv_educ_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 




*=========================== distancia_centro_salud =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\distancia_centro_salud\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_distancia_centro_salud_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_distancia_centro_salud_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_distancia_centro_salud_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_distancia_centro_salud_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_distancia_centro_salud_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_distancia_centro_salud_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*distancia_centro_salud simulación 1 
use "$outputs\cuadros\malos_distancia_centro_salud_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/43 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_distancia_centro_salud_s1_malos.dta, replace
restore 
}

use p1_distancia_centro_salud_s1_malos.dta, clear
foreach n of numlist 2/43 {
append using p`n'_distancia_centro_salud_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=10 if p==3
replace provincia=16 if p==4
replace provincia=17 if p==5
replace provincia=23 if p==6
replace provincia=26 if p==7
replace provincia=38 if p==8
replace provincia=41 if p==9
replace provincia=44 if p==10
replace provincia=45 if p==11
replace provincia=55 if p==12
replace provincia=57 if p==13
replace provincia=66 if p==14
replace provincia=71 if p==15
replace provincia=76 if p==16
replace provincia=77 if p==17
replace provincia=78 if p==18
replace provincia=84 if p==19
replace provincia=86 if p==20
replace provincia=87 if p==21
replace provincia=88 if p==22
replace provincia=89 if p==23
replace provincia=92 if p==24
replace provincia=95 if p==25
replace provincia=100 if p==26
replace provincia=104 if p==27
replace provincia=105 if p==28
replace provincia=106 if p==29
replace provincia=107 if p==30
replace provincia=112 if p==31
replace provincia=129 if p==32
replace provincia=130 if p==33
replace provincia=139 if p==34
replace provincia=140 if p==35
replace provincia=141 if p==36
replace provincia=144 if p==37
replace provincia=150 if p==38
replace provincia=152 if p==39
replace provincia=153 if p==40
replace provincia=158 if p==41
replace provincia=159 if p==42
replace provincia=162 if p==43
order provincia
drop p
save c4_distancia_centro_salud_malos_s1.dta, replace
!erase p*

*distancia_centro_salud simulación 2
use "$outputs\cuadros\malos_distancia_centro_salud_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/43 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_distancia_centro_salud_s2_malos.dta, replace
restore 
}

use p1_distancia_centro_salud_s2_malos.dta, clear
foreach n of numlist 2/43 {
append using p`n'_distancia_centro_salud_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=10 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=23 if p==5
replace provincia=26 if p==6
replace provincia=38 if p==7
replace provincia=39 if p==8
replace provincia=41 if p==9
replace provincia=44 if p==10
replace provincia=45 if p==11
replace provincia=55 if p==12
replace provincia=57 if p==13
replace provincia=66 if p==14
replace provincia=71 if p==15
replace provincia=76 if p==16
replace provincia=77 if p==17
replace provincia=78 if p==18
replace provincia=79 if p==19
replace provincia=84 if p==20
replace provincia=86 if p==21
replace provincia=87 if p==22
replace provincia=88 if p==23
replace provincia=89 if p==24
replace provincia=92 if p==25
replace provincia=95 if p==26
replace provincia=100 if p==27
replace provincia=104 if p==28
replace provincia=106 if p==29
replace provincia=108 if p==30
replace provincia=112 if p==31
replace provincia=125 if p==32
replace provincia=129 if p==33
replace provincia=130 if p==34
replace provincia=139 if p==35
replace provincia=140 if p==36
replace provincia=141 if p==37
replace provincia=144 if p==38
replace provincia=152 if p==39
replace provincia=153 if p==40
replace provincia=158 if p==41
replace provincia=159 if p==42
replace provincia=162 if p==43
order provincia
drop p
save c4_distancia_centro_salud_malos_s2.dta, replace
!erase p*

*distancia_centro_salud simulacion 3
use "$outputs\cuadros\malos_distancia_centro_salud_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/45 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_distancia_centro_salud_s3_malos.dta, replace
restore 
}

use p1_distancia_centro_salud_s3_malos.dta, clear
foreach n of numlist 2/45 {
append using p`n'_distancia_centro_salud_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=10 if p==3
replace provincia=16 if p==4
replace provincia=23 if p==5
replace provincia=26 if p==6
replace provincia=38 if p==7
replace provincia=39 if p==8
replace provincia=44 if p==9
replace provincia=45 if p==10
replace provincia=55 if p==11
replace provincia=57 if p==12
replace provincia=66 if p==13
replace provincia=71 if p==14
replace provincia=76 if p==15
replace provincia=77 if p==16
replace provincia=78 if p==17
replace provincia=79 if p==18
replace provincia=80 if p==19
replace provincia=84 if p==20
replace provincia=86 if p==21
replace provincia=87 if p==22
replace provincia=88 if p==23
replace provincia=91 if p==24
replace provincia=92 if p==25
replace provincia=95 if p==26
replace provincia=100 if p==27
replace provincia=104 if p==28
replace provincia=105 if p==29
replace provincia=106 if p==30
replace provincia=107 if p==31
replace provincia=108 if p==32
replace provincia=112 if p==33
replace provincia=125 if p==34
replace provincia=129 if p==35
replace provincia=130 if p==36
replace provincia=139 if p==37
replace provincia=140 if p==38
replace provincia=141 if p==39
replace provincia=144 if p==40
replace provincia=152 if p==41
replace provincia=153 if p==42
replace provincia=158 if p==43
replace provincia=159 if p==44
replace provincia=162 if p==45
order provincia
drop p
save c4_distancia_centro_salud_malos_s3.dta, replace
!erase p*


*distancia_centro_salud simulacion_4
use "$outputs\cuadros\malos_distancia_centro_salud_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/46 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_distancia_centro_salud_s4_malos.dta, replace
restore 
}

use p1_distancia_centro_salud_s4_malos.dta, clear
foreach n of numlist 2/46 {
append using p`n'_distancia_centro_salud_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=10 if p==3
replace provincia=16 if p==4
replace provincia=17 if p==5
replace provincia=23 if p==6
replace provincia=26 if p==7
replace provincia=27 if p==8
replace provincia=38 if p==9
replace provincia=44 if p==10
replace provincia=45 if p==11
replace provincia=55 if p==12
replace provincia=57 if p==13
replace provincia=66 if p==14
replace provincia=71 if p==15
replace provincia=75 if p==16
replace provincia=76 if p==17
replace provincia=77 if p==18
replace provincia=78 if p==19
replace provincia=79 if p==20
replace provincia=80 if p==21
replace provincia=84 if p==22
replace provincia=86 if p==23
replace provincia=87 if p==24
replace provincia=88 if p==25
replace provincia=92 if p==26
replace provincia=100 if p==27
replace provincia=104 if p==28
replace provincia=105 if p==29
replace provincia=106 if p==30
replace provincia=107 if p==31
replace provincia=112 if p==32
replace provincia=125 if p==33
replace provincia=129 if p==34
replace provincia=130 if p==35
replace provincia=133 if p==36
replace provincia=139 if p==37
replace provincia=140 if p==38
replace provincia=141 if p==39
replace provincia=144 if p==40
replace provincia=150 if p==41
replace provincia=152 if p==42
replace provincia=153 if p==43
replace provincia=158 if p==44
replace provincia=159 if p==45
replace provincia=162 if p==46
order provincia
drop p
save c4_distancia_centro_salud_malos_s4.dta, replace
!erase p*


foreach tipo in  malos {
use c4_distancia_centro_salud_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_distancia_centro_salud_`tipo'_s`s'.dta, nogen 
}
gen outcome="distancia_centro_salud"
order outcome
save c4_distancia_centro_salud_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 



*=========================== criminalidad =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\criminalidad\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_criminalidad_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_criminalidad_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_criminalidad_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_criminalidad_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_criminalidad_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_criminalidad_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*criminalidad simulación 1 
use "$outputs\cuadros\buenos_criminalidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/5 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_criminalidad_s1_buenos.dta, replace
restore 
}



use "$outputs\cuadros\malos_criminalidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/12 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_criminalidad_s1_malos.dta, replace
restore 
}

use p1_criminalidad_s1_buenos.dta, clear
foreach n of numlist 2/5 {
append using p`n'_criminalidad_s1_buenos.dta
}
gen provincia=38 if p==1
replace provincia=76 if p==2
replace provincia=78 if p==3
replace provincia=84 if p==4
replace provincia=125 if p==5
order provincia
drop p
save c4_criminalidad_buenos_s1.dta, replace 

use p1_criminalidad_s1_malos.dta, clear
foreach n of numlist 2/12 {
append using p`n'_criminalidad_s1_malos.dta
}
gen provincia=16 if p==1
replace provincia=23 if p==2
replace provincia=41 if p==3
replace provincia=42 if p==4
replace provincia=66 if p==5
replace provincia=89 if p==6
replace provincia=95 if p==7
replace provincia=112 if p==8
replace provincia=130 if p==9
replace provincia=139 if p==10
replace provincia=140 if p==11
replace provincia=162 if p==12

order provincia
drop p
save c4_criminalidad_malos_s1.dta, replace
!erase p*

*criminalidad simulación 2
use "$outputs\cuadros\buenos_criminalidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/25 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_criminalidad_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_criminalidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_criminalidad_s2_malos.dta, replace
restore 
}

use p1_criminalidad_s2_buenos.dta, clear
foreach n of numlist 2/25 {
append using p`n'_criminalidad_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=18 if p==3
replace provincia=26 if p==4
replace provincia=27 if p==5
replace provincia=38 if p==6
replace provincia=39 if p==7
replace provincia=76 if p==8
replace provincia=78 if p==9
replace provincia=79 if p==10
replace provincia=80 if p==11
replace provincia=84 if p==12
replace provincia=87 if p==13
replace provincia=91 if p==14
replace provincia=92 if p==15
replace provincia=100 if p==16
replace provincia=105 if p==17
replace provincia=108 if p==18
replace provincia=125 if p==19
replace provincia=130 if p==20
replace provincia=133 if p==21
replace provincia=144 if p==22
replace provincia=150 if p==23
replace provincia=159 if p==24
replace provincia=169 if p==25
order provincia
drop p
save c4_criminalidad_buenos_s2.dta, replace 

use p1_criminalidad_s2_malos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_criminalidad_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=23 if p==3
replace provincia=41 if p==4
replace provincia=44 if p==5
replace provincia=45 if p==6
replace provincia=57 if p==7
replace provincia=71 if p==8
replace provincia=77 if p==9
replace provincia=86 if p==10
replace provincia=89 if p==11
replace provincia=95 if p==12
replace provincia=104 if p==13
replace provincia=107 if p==14
replace provincia=112 if p==15
replace provincia=139 if p==16
replace provincia=141 if p==17
replace provincia=158 if p==18
replace provincia=162 if p==19
order provincia
drop p
save c4_criminalidad_malos_s2.dta, replace
!erase p*

*criminalidad simulacion 3
use "$outputs\cuadros\buenos_criminalidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/23 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_criminalidad_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_criminalidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/20 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_criminalidad_s3_malos.dta, replace
restore 
}

use p1_criminalidad_s3_buenos.dta, clear
foreach n of numlist 2/23 {
append using p`n'_criminalidad_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=18 if p==3
replace provincia=26 if p==4
replace provincia=27 if p==5
replace provincia=38 if p==6
replace provincia=76 if p==7
replace provincia=78 if p==8
replace provincia=79 if p==9
replace provincia=80 if p==10
replace provincia=84 if p==11
replace provincia=87 if p==12
replace provincia=91 if p==13
replace provincia=92 if p==14
replace provincia=100 if p==15
replace provincia=105 if p==16
replace provincia=108 if p==17
replace provincia=125 if p==18
replace provincia=133 if p==19
replace provincia=144 if p==20
replace provincia=150 if p==21
replace provincia=159 if p==22
replace provincia=169 if p==23
order provincia
drop p
save c4_criminalidad_buenos_s3.dta, replace 

use p1_criminalidad_s3_malos.dta, clear
foreach n of numlist 2/20 {
append using p`n'_criminalidad_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=23 if p==3
replace provincia=41 if p==4
replace provincia=44 if p==5
replace provincia=45 if p==6
replace provincia=57 if p==7
replace provincia=71 if p==8
replace provincia=77 if p==9
replace provincia=86 if p==10
replace provincia=89 if p==11
replace provincia=95 if p==12
replace provincia=104 if p==13
replace provincia=107 if p==14
replace provincia=112 if p==15
replace provincia=130 if p==16
replace provincia=139 if p==17
replace provincia=141 if p==18
replace provincia=158 if p==19
replace provincia=162 if p==20
order provincia
drop p
save c4_criminalidad_malos_s3.dta, replace
!erase p*


*criminalidad simulacion_4
use "$outputs\cuadros\buenos_criminalidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/16 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_criminalidad_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_criminalidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_criminalidad_s4_malos.dta, replace
restore 
}

use p1_criminalidad_s4_buenos.dta, clear
foreach n of numlist 2/16 {
append using p`n'_criminalidad_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=26 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=92 if p==10
replace provincia=100 if p==11
replace provincia=108 if p==12
replace provincia=125 if p==13
replace provincia=150 if p==14
replace provincia=159 if p==15
replace provincia=169 if p==16
order provincia
drop p
save c4_criminalidad_buenos_s4.dta, replace 

use p1_criminalidad_s4_malos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_criminalidad_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=23 if p==3
replace provincia=41 if p==4
replace provincia=44 if p==5
replace provincia=71 if p==6
replace provincia=77 if p==7
replace provincia=86 if p==8
replace provincia=88 if p==9
replace provincia=89 if p==10
replace provincia=95 if p==11
replace provincia=107 if p==12
replace provincia=112 if p==13
replace provincia=130 if p==14
replace provincia=139 if p==15
replace provincia=140 if p==16
replace provincia=141 if p==17
replace provincia=158 if p==18
replace provincia=162 if p==19
order provincia
drop p
save c4_criminalidad_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_criminalidad_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_criminalidad_`tipo'_s`s'.dta, nogen 
}
gen outcome="criminalidad"
order outcome
save c4_criminalidad_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 





*=========================== densidad =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\densidad\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_densidad_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_densidad_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_densidad_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_densidad_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_densidad_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_densidad_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*densidad simulación 1 
use "$outputs\cuadros\buenos_densidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/12 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_densidad_s1_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/35 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_densidad_s1_malos.dta, replace
restore 
}

use p1_densidad_s1_buenos.dta, clear
foreach n of numlist 2/12 {
append using p`n'_densidad_s1_buenos.dta
}
gen provincia=18 if p==1
replace provincia=26 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=80 if p==7
replace provincia=84 if p==8
replace provincia=92 if p==9
replace provincia=125 if p==10
replace provincia=144 if p==11
replace provincia=169 if p==12
order provincia
drop p
save c4_densidad_buenos_s1.dta, replace 

use p1_densidad_s1_malos.dta, clear
foreach n of numlist 2/35 {
append using p`n'_densidad_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=10 if p==3
replace provincia=16 if p==4
replace provincia=17 if p==5
replace provincia=23 if p==6
replace provincia=39 if p==7
replace provincia=41 if p==8
replace provincia=44 if p==9
replace provincia=45 if p==10
replace provincia=55 if p==11
replace provincia=57 if p==12
replace provincia=65 if p==13
replace provincia=66 if p==14
replace provincia=71 if p==15
replace provincia=77 if p==16
replace provincia=86 if p==17
replace provincia=87 if p==18
replace provincia=95 if p==19
replace provincia=100 if p==20
replace provincia=104 if p==21
replace provincia=105 if p==22
replace provincia=106 if p==23
replace provincia=107 if p==24
replace provincia=108 if p==25
replace provincia=112 if p==26
replace provincia=129 if p==27
replace provincia=130 if p==28
replace provincia=139 if p==29
replace provincia=141 if p==30
replace provincia=152 if p==31
replace provincia=153 if p==32
replace provincia=158 if p==33
replace provincia=159 if p==34
replace provincia=162 if p==35
order provincia
drop p
save c4_densidad_malos_s1.dta, replace
!erase p*

*densidad simulación 2
use "$outputs\cuadros\buenos_densidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_densidad_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/24 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_densidad_s2_malos.dta, replace
restore 
}

use p1_densidad_s2_buenos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_densidad_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=100 if p==13
replace provincia=108 if p==14
replace provincia=125 if p==15
replace provincia=130 if p==16
replace provincia=144 if p==17
replace provincia=150 if p==18
replace provincia=169 if p==19
order provincia
drop p
save c4_densidad_buenos_s2.dta, replace 

use p1_densidad_s2_malos.dta, clear
foreach n of numlist 2/24 {
append using p`n'_densidad_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=57 if p==9
replace provincia=66 if p==10
replace provincia=71 if p==11
replace provincia=77 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=95 if p==15
replace provincia=106 if p==16
replace provincia=112 if p==17
replace provincia=129 if p==18
replace provincia=139 if p==19
replace provincia=141 if p==20
replace provincia=152 if p==21
replace provincia=153 if p==22
replace provincia=158 if p==23
replace provincia=162 if p==24
order provincia
drop p
save c4_densidad_malos_s2.dta, replace
!erase p*

*densidad simulacion 3
use "$outputs\cuadros\buenos_densidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/16 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_densidad_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_densidad_s3_malos.dta, replace
restore 
}

use p1_densidad_s3_buenos.dta, clear
foreach n of numlist 2/16 {
append using p`n'_densidad_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=92 if p==11
replace provincia=108 if p==12
replace provincia=125 if p==13
replace provincia=130 if p==14
replace provincia=144 if p==15
replace provincia=169 if p==16
order provincia
drop p
save c4_densidad_buenos_s3.dta, replace 

use p1_densidad_s3_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_densidad_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=55 if p==9
replace provincia=57 if p==10
replace provincia=66 if p==11
replace provincia=71 if p==12
replace provincia=77 if p==13
replace provincia=86 if p==14
replace provincia=95 if p==15
replace provincia=100 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=153 if p==24
replace provincia=158 if p==25
replace provincia=162 if p==26
order provincia
drop p
save c4_densidad_malos_s3.dta, replace
!erase p*


*densidad simulacion_4
use "$outputs\cuadros\buenos_densidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/15 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_densidad_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_densidad_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/30 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_densidad_s4_malos.dta, replace
restore 
}

use p1_densidad_s4_buenos.dta, clear
foreach n of numlist 2/15 {
append using p`n'_densidad_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=92 if p==11
replace provincia=108 if p==12
replace provincia=125 if p==13
replace provincia=144 if p==14
replace provincia=169 if p==15
order provincia
drop p
save c4_densidad_buenos_s4.dta, replace 

use p1_densidad_s4_malos.dta, clear
foreach n of numlist 2/30 {
append using p`n'_densidad_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=23 if p==5
replace provincia=26 if p==6
replace provincia=41 if p==7
replace provincia=44 if p==8
replace provincia=45 if p==9
replace provincia=55 if p==10
replace provincia=57 if p==11
replace provincia=65 if p==12
replace provincia=66 if p==13
replace provincia=71 if p==14
replace provincia=77 if p==15
replace provincia=86 if p==16
replace provincia=89 if p==17
replace provincia=95 if p==18
replace provincia=100 if p==19
replace provincia=106 if p==20
replace provincia=107 if p==21
replace provincia=112 if p==22
replace provincia=129 if p==23
replace provincia=130 if p==24
replace provincia=139 if p==25
replace provincia=141 if p==26
replace provincia=152 if p==27
replace provincia=153 if p==28
replace provincia=158 if p==29
replace provincia=162 if p==30
order provincia
drop p
save c4_densidad_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_densidad_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_densidad_`tipo'_s`s'.dta, nogen 
}
gen outcome="densidad"
order outcome
save c4_densidad_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 




*=========================== densidad_g =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\densidad_g\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_densidad_g_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_densidad_g_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_densidad_g_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_densidad_g_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_densidad_g_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_densidad_g_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*densidad_g simulación 1 
use "$outputs\cuadros\buenos_densidad_g_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/21 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_densidad_g_s1_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_g_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/11 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_densidad_g_s1_malos.dta, replace
restore 
}

use p1_densidad_g_s1_buenos.dta, clear
foreach n of numlist 2/21 {
append using p`n'_densidad_g_s1_buenos.dta
}
gen provincia=10 if p==1
replace provincia=17 if p==2
replace provincia=18 if p==3
replace provincia=26 if p==4
replace provincia=27 if p==5
replace provincia=38 if p==6
replace provincia=76 if p==7
replace provincia=78 if p==8
replace provincia=79 if p==9
replace provincia=80 if p==10
replace provincia=84 if p==11
replace provincia=91 if p==12
replace provincia=92 if p==13
replace provincia=100 if p==14
replace provincia=108 if p==15
replace provincia=125 if p==16
replace provincia=130 if p==17
replace provincia=144 if p==18
replace provincia=150 if p==19
replace provincia=159 if p==20
replace provincia=169 if p==21

order provincia
drop p
save c4_densidad_g_buenos_s1.dta, replace 

use p1_densidad_g_s1_malos.dta, clear
foreach n of numlist 2/11 {
append using p`n'_densidad_g_s1_malos.dta
}
gen provincia=16 if p==1
replace provincia=23 if p==2
replace provincia=42 if p==3
replace provincia=71 if p==4
replace provincia=75 if p==5
replace provincia=86 if p==6
replace provincia=107 if p==7
replace provincia=112 if p==8
replace provincia=139 if p==9
replace provincia=141 if p==10
replace provincia=158 if p==11
order provincia
drop p
save c4_densidad_g_malos_s1.dta, replace
!erase p*

*densidad_g simulación 2
use "$outputs\cuadros\buenos_densidad_g_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/11 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_densidad_g_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_g_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/17 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_densidad_g_s2_malos.dta, replace
restore 
}

use p1_densidad_g_s2_buenos.dta, clear
foreach n of numlist 2/11 {
append using p`n'_densidad_g_s2_buenos.dta
}
gen provincia=18 if p==1
replace provincia=27 if p==2
replace provincia=38 if p==3
replace provincia=39 if p==4
replace provincia=79 if p==5
replace provincia=84 if p==6
replace provincia=91 if p==7
replace provincia=92 if p==8
replace provincia=108 if p==9
replace provincia=125 if p==10
replace provincia=150 if p==11
order provincia
drop p
save c4_densidad_g_buenos_s2.dta, replace 

use p1_densidad_g_s2_malos.dta, clear
foreach n of numlist 2/17 {
append using p`n'_densidad_g_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=41 if p==3
replace provincia=66 if p==4
replace provincia=75 if p==5
replace provincia=77 if p==6
replace provincia=86 if p==7
replace provincia=87 if p==8
replace provincia=95 if p==9
replace provincia=106 if p==10
replace provincia=107 if p==11
replace provincia=112 if p==12
replace provincia=129 if p==13
replace provincia=139 if p==14
replace provincia=152 if p==15
replace provincia=153 if p==16
replace provincia=162 if p==17
order provincia
drop p
save c4_densidad_g_malos_s2.dta, replace
!erase p*

*densidad_g simulacion 3
use "$outputs\cuadros\buenos_densidad_g_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/16 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_densidad_g_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_densidad_g_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/28 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_densidad_g_s3_malos.dta, replace
restore 
}

use p1_densidad_g_s3_buenos.dta, clear
foreach n of numlist 2/16 {
append using p`n'_densidad_g_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=80 if p==7
replace provincia=84 if p==8
replace provincia=91 if p==9
replace provincia=92 if p==10
replace provincia=100 if p==11
replace provincia=108 if p==12
replace provincia=125 if p==13
replace provincia=130 if p==14
replace provincia=144 if p==15
replace provincia=169 if p==16
order provincia
drop p
save c4_densidad_g_buenos_s3.dta, replace 

use p1_densidad_g_s3_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_densidad_g_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=66 if p==9
replace provincia=71 if p==10
replace provincia=77 if p==11
replace provincia=79 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=95 if p==15
replace provincia=104 if p==16
replace provincia=106 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=129 if p==20
replace provincia=139 if p==21
replace provincia=141 if p==22
replace provincia=150 if p==23
replace provincia=152 if p==24
replace provincia=153 if p==25
replace provincia=158 if p==26
replace provincia=159 if p==27
replace provincia=162 if p==28
order provincia
drop p
save c4_densidad_g_malos_s3.dta, replace
!erase p*


*densidad_g simulacion_4
use "$outputs\cuadros\buenos_densidad_g_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/17 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_densidad_g_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_densidad_g_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/26 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_densidad_g_s4_malos.dta, replace
restore 
}

use p1_densidad_g_s4_buenos.dta, clear
foreach n of numlist 2/17 {
append using p`n'_densidad_g_s4_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=80 if p==7
replace provincia=84 if p==8
replace provincia=91 if p==9
replace provincia=92 if p==10
replace provincia=108 if p==11
replace provincia=125 if p==12
replace provincia=130 if p==13
replace provincia=133 if p==14
replace provincia=144 if p==15
replace provincia=150 if p==16
replace provincia=169 if p==17

order provincia
drop p
save c4_densidad_g_buenos_s4.dta, replace 

use p1_densidad_g_s4_malos.dta, clear
foreach n of numlist 2/26 {
append using p`n'_densidad_g_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=44 if p==6
replace provincia=45 if p==7
replace provincia=57 if p==8
replace provincia=71 if p==9
replace provincia=75 if p==10
replace provincia=77 if p==11
replace provincia=79 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=95 if p==15
replace provincia=100 if p==16
replace provincia=104 if p==17
replace provincia=107 if p==18
replace provincia=112 if p==19
replace provincia=139 if p==20
replace provincia=140 if p==21
replace provincia=141 if p==22
replace provincia=152 if p==23
replace provincia=158 if p==24
replace provincia=159 if p==25
replace provincia=162 if p==26

order provincia
drop p
save c4_densidad_g_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_densidad_g_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge 1:1 provincia variable using c4_densidad_g_`tipo'_s`s'.dta, nogen 
}
gen outcome="densidad_g"
order outcome
save c4_densidad_g_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 





*=========================== jefe_hogar =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\jefe_hogar\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_jefe_hogar_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_jefe_hogar_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_jefe_hogar_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_jefe_hogar_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_jefe_hogar_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_jefe_hogar_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*jefe_hogar simulación 1 
use "$outputs\cuadros\buenos_jefe_hogar_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/16 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_jefe_hogar_s1_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_jefe_hogar_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/22 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_jefe_hogar_s1_malos.dta, replace
restore 
}

use p1_jefe_hogar_s1_buenos.dta, clear
foreach n of numlist 2/16 {
append using p`n'_jefe_hogar_s1_buenos.dta
}
gen provincia=17 if p==1
replace provincia=18 if p==2
replace provincia=26 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=88 if p==10
replace provincia=92 if p==11
replace provincia=125 if p==12
replace provincia=130 if p==13
replace provincia=144 if p==14
replace provincia=150 if p==15
replace provincia=169 if p==16

order provincia
drop p
save c4_jefe_hogar_buenos_s1.dta, replace 

use p1_jefe_hogar_s1_malos.dta, clear
foreach n of numlist 2/22 {
append using p`n'_jefe_hogar_s1_malos.dta
}
gen provincia=17 if p==1
replace provincia=18 if p==2
replace provincia=26 if p==3
replace provincia=27 if p==4
replace provincia=38 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=88 if p==10
replace provincia=92 if p==11
replace provincia=125 if p==12
replace provincia=130 if p==13
replace provincia=144 if p==14
replace provincia=150 if p==15
replace provincia=169 if p==16

order provincia
drop p
save c4_jefe_hogar_malos_s1.dta, replace
!erase p*

*jefe_hogar simulación 2
use "$outputs\cuadros\buenos_jefe_hogar_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_jefe_hogar_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_jefe_hogar_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/25 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_jefe_hogar_s2_malos.dta, replace
restore 
}

use p1_jefe_hogar_s2_buenos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_jefe_hogar_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=100 if p==13
replace provincia=108 if p==14
replace provincia=125 if p==15
replace provincia=130 if p==16
replace provincia=144 if p==17
replace provincia=150 if p==18
replace provincia=169 if p==19

order provincia
drop p
save c4_jefe_hogar_buenos_s2.dta, replace 

use p1_jefe_hogar_s2_malos.dta, clear
foreach n of numlist 2/25 {
append using p`n'_jefe_hogar_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=57 if p==9
replace provincia=66 if p==10
replace provincia=71 if p==11
replace provincia=77 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=95 if p==15
replace provincia=106 if p==16
replace provincia=107 if p==17
replace provincia=112 if p==18
replace provincia=129 if p==19
replace provincia=139 if p==20
replace provincia=141 if p==21
replace provincia=152 if p==22
replace provincia=153 if p==23
replace provincia=158 if p==24
replace provincia=162 if p==25

order provincia
drop p
save c4_jefe_hogar_malos_s2.dta, replace
!erase p*

*jefe_hogar simulacion 3
use "$outputs\cuadros\buenos_jefe_hogar_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/19 { 
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3 
save p`n'_jefe_hogar_s3_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_jefe_hogar_simulacion_3.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/24 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s3
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s3
save p`n'_jefe_hogar_s3_malos.dta, replace
restore 
}

use p1_jefe_hogar_s3_buenos.dta, clear
foreach n of numlist 2/19 {
append using p`n'_jefe_hogar_s3_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=100 if p==13
replace provincia=108 if p==14
replace provincia=125 if p==15
replace provincia=130 if p==16
replace provincia=144 if p==17
replace provincia=150 if p==18
replace provincia=169 if p==19
order provincia
drop p
save c4_jefe_hogar_buenos_s3.dta, replace 

use p1_jefe_hogar_s3_malos.dta, clear
foreach n of numlist 2/24 {
append using p`n'_jefe_hogar_s3_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=57 if p==9
replace provincia=66 if p==10
replace provincia=71 if p==11
replace provincia=77 if p==12
replace provincia=86 if p==13
replace provincia=87 if p==14
replace provincia=106 if p==15
replace provincia=107 if p==16
replace provincia=112 if p==17
replace provincia=129 if p==18
replace provincia=139 if p==19
replace provincia=141 if p==20
replace provincia=152 if p==21
replace provincia=153 if p==22
replace provincia=158 if p==23
replace provincia=162 if p==24

order provincia
drop p
save c4_jefe_hogar_malos_s3.dta, replace
!erase p*


*jefe_hogar simulacion_4
use "$outputs\cuadros\buenos_jefe_hogar_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_jefe_hogar_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_jefe_hogar_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/22 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_jefe_hogar_s4_malos.dta, replace
restore 
}

use p1_jefe_hogar_s4_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_jefe_hogar_s4_buenos.dta
}
gen provincia=18 if p==1
replace provincia=27 if p==2
replace provincia=38 if p==3
replace provincia=39 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=79 if p==7
replace provincia=80 if p==8
replace provincia=84 if p==9
replace provincia=91 if p==10
replace provincia=92 if p==11
replace provincia=100 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18
order provincia
drop p
save c4_jefe_hogar_buenos_s4.dta, replace 

use p1_jefe_hogar_s4_malos.dta, clear
foreach n of numlist 2/22 {
append using p`n'_jefe_hogar_s4_malos.dta
}
gen provincia=16 if p==1
replace provincia=23 if p==2
replace provincia=26 if p==3
replace provincia=41 if p==4
replace provincia=44 if p==5
replace provincia=45 if p==6
replace provincia=57 if p==7
replace provincia=66 if p==8
replace provincia=86 if p==9
replace provincia=87 if p==10
replace provincia=106 if p==11
replace provincia=107 if p==12
replace provincia=112 if p==13
replace provincia=129 if p==14
replace provincia=139 if p==15
replace provincia=140 if p==16
replace provincia=141 if p==17
replace provincia=149 if p==18
replace provincia=152 if p==19
replace provincia=153 if p==20
replace provincia=158 if p==21
replace provincia=162 if p==22
order provincia
drop p
save c4_jefe_hogar_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_jefe_hogar_`tipo'_s1.dta, clear
foreach s of numlist  2 3 4 {
merge m:1 provincia variable using c4_jefe_hogar_`tipo'_s`s'.dta, nogen 
}
gen outcome="jefe_hogar"
order outcome
drop if missing(provincia)
save c4_jefe_hogar_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 




*=========================== mujeres =====================================
foreach s of numlist 1 2 3 4 {
cd "$outputs\mujeres\1%\simulacion_`s'"
foreach j of numlist   1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
import excel output_simulacion_`s'.xlsx, firstrow sheet(`j') clear
keep if periodo>=37
gen ET=observado[_n]-observado[_n-1]
gen alpha_hat=observado[_n]-synthetic_control_spillover[_n]
gen EC=observado[_n]-alpha_hat[_n]
gen EP=alpha_hat[_n]-alpha_hat[_n-1]
gen ES=alpha_hat-EP
gen EE=ET-EC-ES-EP
gen ET2=EC+EP+ES+EE
gen provincia=`j'
drop if periodo==37
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
foreach v in ET EC EP ES EE  {
egen mean_`v'=mean(`v')
}
keep provincia tipo mean_*
foreach v in ET EC EP ES EE  {
rename mean_`v' `v'
}
duplicates drop
order provincia tipo EP EC ES EE ET
save "$outputs\cuadros\provincia_`j'_mujeres_simulacion_`s'.dta", replace
}
use "$outputs\cuadros\provincia_1_mujeres_simulacion_`s'.dta", clear 
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
append using "$outputs\cuadros\provincia_`j'_mujeres_simulacion_`s'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_mujeres_s`s'_significativos.dta", nogen
gen test="significativo" if tests==1
replace test="no significativo" if tests==.
keep if test=="significativo"
preserve 
keep if tipo=="buenos"
save "$outputs\cuadros\buenos_mujeres_simulacion_`s'.dta", replace
restore 
preserve 
keep if tipo=="malos"
save "$outputs\cuadros\malos_mujeres_simulacion_`s'.dta", replace
restore 
}

cd "$outputs\cuadros"
!erase p*

*mujeres simulación 1 
use "$outputs\cuadros\buenos_mujeres_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/15 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_mujeres_s1_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_mujeres_simulacion_1.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/25 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s1
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s1
save p`n'_mujeres_s1_malos.dta, replace
restore 
}

use p1_mujeres_s1_buenos.dta, clear
foreach n of numlist 2/15 {
append using p`n'_mujeres_s1_buenos.dta
}
gen provincia=18 if p==1
replace provincia=27 if p==2
replace provincia=38 if p==3
replace provincia=39 if p==4
replace provincia=76 if p==5
replace provincia=78 if p==6
replace provincia=79 if p==7
replace provincia=84 if p==8
replace provincia=91 if p==9
replace provincia=92 if p==10
replace provincia=108 if p==11
replace provincia=125 if p==12
replace provincia=130 if p==13
replace provincia=144 if p==14
replace provincia=169 if p==15
order provincia
drop p
save c4_mujeres_buenos_s1.dta, replace 

use p1_mujeres_s1_malos.dta, clear
foreach n of numlist 2/25 {
append using p`n'_mujeres_s1_malos.dta
}
gen provincia=1 if p==1
replace provincia=7 if p==2
replace provincia=16 if p==3
replace provincia=17 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=42 if p==7
replace provincia=44 if p==8
replace provincia=45 if p==9
replace provincia=57 if p==10
replace provincia=66 if p==11
replace provincia=71 if p==12
replace provincia=77 if p==13
replace provincia=86 if p==14
replace provincia=87 if p==15
replace provincia=89 if p==16
replace provincia=100 if p==17
replace provincia=104 if p==18
replace provincia=106 if p==19
replace provincia=107 if p==20
replace provincia=129 if p==21
replace provincia=139 if p==22
replace provincia=150 if p==23
replace provincia=152 if p==24
replace provincia=153 if p==25
order provincia
drop p
save c4_mujeres_malos_s1.dta, replace
!erase p*

*mujeres simulación 2
use "$outputs\cuadros\buenos_mujeres_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/18 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_mujeres_s2_buenos.dta, replace
restore 
}

use "$outputs\cuadros\malos_mujeres_simulacion_2.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/28 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s2
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s2
save p`n'_mujeres_s2_malos.dta, replace
restore 
}

use p1_mujeres_s2_buenos.dta, clear
foreach n of numlist 2/18 {
append using p`n'_mujeres_s2_buenos.dta
}
gen provincia=10 if p==1
replace provincia=18 if p==2
replace provincia=27 if p==3
replace provincia=38 if p==4
replace provincia=39 if p==5
replace provincia=76 if p==6
replace provincia=78 if p==7
replace provincia=79 if p==8
replace provincia=80 if p==9
replace provincia=84 if p==10
replace provincia=91 if p==11
replace provincia=92 if p==12
replace provincia=108 if p==13
replace provincia=125 if p==14
replace provincia=130 if p==15
replace provincia=144 if p==16
replace provincia=150 if p==17
replace provincia=169 if p==18

order provincia
drop p
save c4_mujeres_buenos_s2.dta, replace 

use p1_mujeres_s2_malos.dta, clear
foreach n of numlist 2/28 {
append using p`n'_mujeres_s2_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=23 if p==4
replace provincia=26 if p==5
replace provincia=41 if p==6
replace provincia=44 if p==7
replace provincia=45 if p==8
replace provincia=55 if p==9
replace provincia=57 if p==10
replace provincia=66 if p==11
replace provincia=71 if p==12
replace provincia=77 if p==13
replace provincia=86 if p==14
replace provincia=87 if p==15
replace provincia=95 if p==16
replace provincia=100 if p==17
replace provincia=104 if p==18
replace provincia=106 if p==19
replace provincia=107 if p==20
replace provincia=112 if p==21
replace provincia=129 if p==22
replace provincia=139 if p==23
replace provincia=141 if p==24
replace provincia=152 if p==25
replace provincia=153 if p==26
replace provincia=158 if p==27
replace provincia=162 if p==28
order provincia
drop p
save c4_mujeres_malos_s2.dta, replace
!erase p*


*mujeres simulacion_4
use "$outputs\cuadros\buenos_mujeres_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/5 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_mujeres_s4_buenos.dta, replace
restore 
}
use "$outputs\cuadros\malos_mujeres_simulacion_4.dta", clear
drop tipo tests test provincia 
xpose, clear
foreach n of numlist 1/13 { // pongo del 1 al 40 pero en realidad la primera provincia es 17, 18, ...
preserve 
keep v`n'
gen order=_n
rename v`n' efecto_s4
gen variable="EP" if order==1
replace variable="EC" if order==2
replace variable="ES" if order==3
replace variable="EE" if order==4
replace variable="ET" if order==5
drop order
gen p=`n'
order p variable efecto_s4
save p`n'_mujeres_s4_malos.dta, replace
restore 
}

use p1_mujeres_s4_buenos.dta, clear
foreach n of numlist 2/5 {
append using p`n'_mujeres_s4_buenos.dta
}
gen provincia=18 if p==1
replace provincia=39 if p==2
replace provincia=91 if p==3
replace provincia=125 if p==4
replace provincia=150 if p==5

order provincia
drop p
save c4_mujeres_buenos_s4.dta, replace 

use p1_mujeres_s4_malos.dta, clear
foreach n of numlist 2/13 {
append using p`n'_mujeres_s4_malos.dta
}
gen provincia=1 if p==1
replace provincia=16 if p==2
replace provincia=17 if p==3
replace provincia=45 if p==4
replace provincia=87 if p==5
replace provincia=106 if p==6
replace provincia=107 if p==7
replace provincia=119 if p==8
replace provincia=139 if p==9
replace provincia=152 if p==10
replace provincia=153 if p==11
replace provincia=158 if p==12
replace provincia=162 if p==13

order provincia
drop p
save c4_mujeres_malos_s4.dta, replace
!erase p*


foreach tipo in buenos malos {
use c4_mujeres_`tipo'_s1.dta, clear
foreach s of numlist  2  4 {
merge 1:1 provincia variable using c4_mujeres_`tipo'_s`s'.dta, nogen 
}
gen outcome="mujeres"
order outcome
drop if missing(provincia)
save c4_mujeres_`tipo'.dta, replace
}
!erase buenos_* malos_* *_buenos_s* *_malos_s* 



********** JUNTO TODO PARA EL CUADRO 4


use c4_alimentos_buenos.dta, clear
foreach variable in bajo_ingreso bajo_niv_educ criminalidad densidad densidad_g informalidad jefe_hogar mujeres { 
append using c4_`variable'_buenos.dta
}
export excel "Cuadros Informe 1.xlsx", firstrow(variables) sheet("C4 buenos", replace)




use c4_alimentos_malos.dta, clear
foreach variable in bajo_ingreso bajo_niv_educ criminalidad distancia_centro_salud densidad densidad_g informalidad jefe_hogar mujeres { 
append using c4_`variable'_malos.dta
}
export excel "Cuadros Informe 1.xlsx", firstrow(variables) sheet("C4 malos", replace)



cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\cuadros"

!erase c4_* 














