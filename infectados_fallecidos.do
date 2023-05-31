cls 
clear all
global original "G:\Mi unidad\BASES DE DATOS\INEI_BASES\ENAHO"
global intermedios "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios"
global outputs "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs"
global inputs "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs"

** por error se tomó aa los infectados y a los fallecidos, sin embargo, en el output final
** las provincias tratadas significativas eran tratadas tambien en el proyecto del cies, y las 
** provincias controles eran las mismas que los controles del proyecto cies.
cd "$inputs\infectados_fallecidos"
*INFECTADOS
import delimited "positivos_covid.csv", clear
drop if missing(ubigeo)
tostring ubigeo, replace
replace ubigeo="0"+ubigeo if length(ubigeo)<=5
gen ubigeo2 = substr(ubigeo, 1, 4)
replace ubigeo2 = ubigeo2 + "00"
drop ubigeo 
rename ubigeo2 ubigeo
destring fecha_resultado, replace
drop if fecha_resultado > 20201231 // hasta diciembre
gen infectado = 1	
gen mes="03" if fecha_resultado>=20200301 & fecha_resultado<=20200331
foreach t of numlist 4/9 {
replace mes="0`t'" if fecha_resultado>=20200`t'01 & fecha_resultado<=20200`t'31
}
foreach t of numlist 10/12 {
replace mes="`t'" if fecha_resultado>=2020`t'01 & fecha_resultado<=2020`t'31
}
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
bys ubigeo trimestre: egen positivos_covid=sum(infectado)
keep ubigeo trimestre positivos_covid 
duplicates drop
gen year=2020
sort ubigeo year trimestre
order year ubigeo trimestre positivos_covid 
save "$intermedios\infectados\positivos_covid", replace

*FALLECIDOS
import delimited "fallecidos_covid.csv", clear
drop if missing(ubigeo)
tostring ubigeo, replace
replace ubigeo="0"+ubigeo if length(ubigeo)<=5
gen ubigeo2 = substr(ubigeo, 1, 4)
replace ubigeo2 = ubigeo2 + "00"
drop ubigeo 
rename ubigeo2 ubigeo
destring fecha_fallecimiento, replace
drop if fecha_fallecimiento > 20201231 // hasta diciembre
gen fallecimientos = 1	
gen mes="03" if fecha_fallecimiento>=20200301 & fecha_fallecimiento<=20200331
foreach t of numlist 4/9 {
replace mes="0`t'" if fecha_fallecimiento>=20200`t'01 & fecha_fallecimiento<=20200`t'31
}
foreach t of numlist 10/12 {
replace mes="`t'" if fecha_fallecimiento>=2020`t'01 & fecha_fallecimiento<=2020`t'31
}
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
bys ubigeo trimestre: egen fallecidos_covid=sum(fallecimientos)
keep ubigeo trimestre fallecidos_covid 
duplicates drop
gen year=2020
sort ubigeo year trimestre
order year ubigeo trimestre fallecidos_covid 
save "$intermedios\infectados\fallecidos_covid", replace

use "$inputs\infectados_fallecidos\poblacion_enaho_ajustada_anualizada_2010_2020.dta", clear
keep if year==2020
save "$intermedios\infectados\poblacion_enaho_ajustada_anualizada_2020.dta", replace


cd "$intermedios\infectados"
use positivos_covid, clear 
merge 1:1  year ubigeo trimestre using fallecidos_covid.dta, nogen
merge 1:1 year ubigeo trimestre  using poblacion_enaho_ajustada_anualizada_2020.dta, keep(3) nogen
replace positivos_covid=0 if missing(positivos_covid)
replace fallecidos_covid=0 if missing(fallecidos_covid)
gen total_infectados_fallecidos=positivos_covid+fallecidos_covid
gen ratio=total_infectados_fallecidos*100/poblacion

** comparar con los datos reales 
gen ubigdep=substr(ubigeo, 1,2)
drop ubigdep
bys ubigdep: egen sum_depart=sum(total_infectados_fallecidos)
gsort -sum_depart // orden por departamento
gsort -sum_total // orden por provincia 
gsort -ratio // orden por ratio 
import excel "infectados_tratados.xlsx", firstrow sheet("INFECTADOS") clear 
gsort -Provincia -ratio






































