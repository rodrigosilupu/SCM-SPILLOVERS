
cls
clear all
global intermedios "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios"


*=============================== DENSIDAD POR HOGAR =======================
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho\sumaria"
use "sumaria-2019.dta", clear
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
bys ubigeo: egen miembros=mean(mieperho)
keep ubigeo miembros 
duplicates drop
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\SP_densidad_2019.dta", replace


*=============================0 TIEMPO DE LLEGADA AL CENTRO DE SALUD===========*
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
use enaho01a-2019-400.dta, clear
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
keep ubigeo p407g*
gen t1=p407g1*24*60
gen t2=p407g2*60 
gen t3=p407g3

gen tiempo_cs=t1+t2+t3
collapse (mean) tiempo_cs, by(ubigeo)
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\SP_tiempo_cs_2019.dta", replace


*======================================================
*# variables:  densidad geográfica
*======================================================
preserve
import excel "$intermedios\00.-Nacional-Matriz-Indicadores-Ceplan-Perú-2007-2019_Jun2020.xlsx", cellrange(B9:K237) firstrow sheet(Provincial) clear
rename Ubigeo ubigeo
sort ubigeo
drop if ubigeo=="010000" | ubigeo=="020000" | ubigeo=="030000" | ubigeo=="040000" | ubigeo=="050000" | ubigeo=="060000" | ubigeo=="070000" | ubigeo=="080000" | ubigeo=="090000" | ubigeo=="100000" | ubigeo=="110000" | ubigeo=="120000" | ubigeo=="130000" | ubigeo=="140000" | ubigeo=="150000" | ubigeo=="160000" | ubigeo=="170000" | ubigeo=="180000" | ubigeo=="190000" | ubigeo=="200000" | ubigeo=="210000" | ubigeo=="220000" | ubigeo=="230000" | ubigeo=="240000" | ubigeo=="NACIONAL" | ubigeo=="NACIONAL SIN LA PROV. DE LIMA" | ubigeo=="ZONA CENTRO" | ubigeo=="ZONA CENTRO SIN LA PROV. DE LIMA" | ubigeo=="ZONA NORTE" | ubigeo=="ZONA SUR" 
keep ubigeo Densidad2019
destring Densidad2019, replace
bys ubigeo: egen promedio=mean(Densidad2019)
rename promedio densidad
keep densidad ubigeo
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\densidad.dta", replace
restore




** Porcentaje del Gasto de Consumo de Bienes Alimenticios del Gasto Total (2019)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho\sumaria"
use "sumaria-2019.dta", clear
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
foreach v in gashog1d gru11hd gru13hd3 {
replace `v'=`v'/12
}
gen alimentos=gru11hd + gru13hd3
drop if alimentos==0
gen porc_alimentos=alimentos*100/gashog1d
collapse (mean) porc_alimentos, by (ubigeo)
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\porc_gasto_alimentos_2019.dta"


cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho\sumaria"
use "sumaria-2020.dta", clear
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
foreach v in gashog1d gru11hd gru13hd3 {
replace `v'=`v'/12
}
gen alimentos=gru11hd + gru13hd3
drop if alimentos==0
gen porc_alimentos=alimentos*100/gashog1d
collapse (mean) porc_alimentos, by (ubigeo)
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\porc_gasto_alimentos_2020.dta"





*###############################################################################
*#alumbrado, activo, piso, agua potable PARA LA PEAO
*###############################################################################

foreach i of numlist 2010/2021 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
use "enaho01-`i'-100.dta", clear
numlabel, add
gen year=`i'
gen alumbrado=1 if p1121==1 // *alumbrado electrico: 0 si no posee alumbrado electico
replace alumbrado=0 if p1123==1 | p1124==1 | p1125==1 | p1126==1 | p1127==1
if year<=2011   {
gen desague=1 if p111==1 | p111==2  // *desagüe: 0 si no posee desague
replace desague=0 if p111==3 | p111==4 | p111==5 | p111==6 
gen aguapotable=1 if p110a==1  // *agua:  0 si El hogar no tiene acceso a agua potable
replace aguapotable=0 if p110a==2 | p110a==3
}
if year>=2012  {
gen desague=1 if p111a==1 | p111a==2 
replace desague=0 if p111a==3 | p111a==4 | p111a==5 | p111a==6 | p111a==7 | p111a==9 | p111a==8
gen aguapotable=1 if p110a1==1 
replace aguapotable=0 if p110a1==2
}
*Tipo de Piso: umbral El hogar tiene pisos de tierra, arena o estiércol o tierra 
gen piso=1 if p103==1 | p103==2 | p103==3 |  p103==4 | p103==5 
replace piso=0 if p103==6 | p103==7
*Activos
gen activosum=(p1141+p1142+p1143+ p1144)
gen activos=1 if activosum>=2
replace activos=0 if activosum==1 
keep year alumbrado desague aguapotable piso activos ubigeo conglome vivienda hogar
drop if missing(alumbrado) & missing(desague) & missing(aguapotable) & missing(piso) 
foreach j in alumbrado desague aguapotable piso activos {
replace `j'=0 if missing(`j')
}
merge 1:m conglome vivienda hogar ubigeo using "enaho01a-`i'-500.dta"
gen pob_hogar=1 
gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
replace PEA=0 if missing(PEA)
gen PEAO=1 if ocu500==1 & pob_hogar==1
replace PEAO=0 if missing(PEAO)
keep if PEAO==1
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
keep year trimestre  ubigeo alumbrado desague aguapotable piso activos 
order year trimestre  ubigeo alumbrado desague aguapotable piso activos 
sort ubigeo year trimestre
gen n=1
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
sort ubigeo year trimestre
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
save "condicioneshogar_`i'_trimestral.dta", replace
}
foreach t of numlist 2010/2020 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
append using "condicioneshogar_`t'_trimestral.dta"
}
collapse (sum) alumbrado desague aguapotable piso activos n, by(year trimestre ubigeo)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0 alumbrado desague aguapotable piso activos n
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
foreach i of global var0 {
gen V`i'=`i'_Anual*100/n_Anual
}
keep year trimestre ubigeo V* 
drop Vn
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\condicioneshogar_2010_2021.dta", replace
!erase "*_trimestral.dta"

*###############################################################################
*# multinomial region 1 si es costa 2 si es sierra y 3 si es selva
*###############################################################################

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho\sumaria"
use "sumaria-2021.dta", clear
recode estrato (1/5=1) (6/8=0), gen (area) //1 urbano, 0 rural
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
keep ubigeo dominio area
numlabel dominio, add
gen region=1 if dominio==1 | dominio==2 | dominio==3 | dominio==8
replace region=2 if dominio==4 | dominio==5 | dominio==6
replace region=3 if dominio==7
drop dominio
sort ubigeo
duplicates drop ubigeo, force
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\regionprovincia.dta", replace

*###############################################################################
*# variable edad promedio de la PEAO
*###############################################################################

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
foreach t of numlist 2010/2021 {
	use "enaho01a-`t'-500.dta", clear 
	mata st_varrename(1,"year")
	destring year, replace
	gen ubigeo2 = substr(ubigeo, 1, 4)
	replace ubigeo2 = ubigeo2 + "00"
	drop ubigeo
	rename ubigeo2 ubigeo
	rename p208a Edad 
	gen pob_hogar=1 
	gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
	replace PEA=0 if missing(PEA)
	gen PEAO=1 if ocu500==1 & pob_hogar==1
	replace PEAO=0 if missing(PEAO)
	keep if PEAO==1
	gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
	replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
	replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
	replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
	keep Edad year mes trimestre ubigeo
	gen n=1
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\Edad_`t'.dta", replace
}
foreach t of numlist 2010/2020 {
	cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
	append using Edad_`t'.dta 
}
collapse (sum) Edad n, by(year trimestre ubigeo)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0 Edad n
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
gen EdadPEAO=Edad_Anual/n_Anual
sort  ubigeo year trimestre
drop Edad_Anual n* Edad 
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\Edad_2011_2021.dta", replace


*###############################################################################
*# variables: % de mujeres en la PEA y promedio educativo de la PEA
*###############################################################################

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
foreach r of numlist 2010/2021 {
use "enaho01a-`r'-500.dta", clear
mata st_varrename(1,"year")
destring year, replace
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12" 
gen pob_hogar=1 
*** CALCULAMOS PEA
gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
replace PEA=0 if missing(PEA)
gen n_PEA=PEA
*** CALCULAMOS PEAO
gen PEAO=1 if ocu500==1 & pob_hogar==1
replace PEAO=0 if missing(PEAO)
gen n_PEAO=PEAO
keep if PEAO==1
*Cálculo del promedio educativo de la PEAO (uso p301a if PEAO==1) nivel educativo
rename p301a educ_persona 
*Cálculo del % de mujeres en la PEAO
gen mujeres_PEAO=1 if p207==2 & PEAO==1
replace mujeres_PEAO=0 if missing(mujeres_PEAO)
	order  ubigeo year trimestre mes    mujeres_PEA educ_persona PEAO
	keep  ubigeo year trimestre mes    mujeres_PEA  educ_persona PEAO
	sort ubigeo year mes
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\ingresos_`r'_Trimestral.dta", replace
}
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
foreach r of numlist 2010/2020 {
append using ingresos_`r'_Trimestral.dta
}
gen n=1
collapse (sum)  mujeres_PEAO n educ_persona, by(year trimestre ubigeo)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0 mujeres_PEAO n educ_persona
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
drop n educ_persona mujeres_PEAO
gen P_mujeresPEAO=mujeres_PEAO_Anual*100/n_Anual
gen educ_persona=educ_persona_Anual/n_Anual
drop mujeres_PEAO_Anual educ_persona_Anual n_Anual
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\Mujeres_Educacion_2011_2021.dta", replace
!erase "*_Trimestral.dta"

*###############################################################################
*# variables: % de PEAO respecto a la PEA
*###############################################################################
foreach r of numlist 2010/2021 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
use "enaho01a-`r'-500.dta", clear
mata st_varrename(1,"year")
destring year, replace
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12" 
gen pob_hogar=1 
*** CALCULAMOS PEA
gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
replace PEA=0 if missing(PEA)


*** CALCULAMOS PEAO
gen PEAO=1 if ocu500==1 & pob_hogar==1
replace PEAO=0 if missing(PEAO)

*CALCULAMOS PEAO INFORMAL 
gen PEAO_inf=1 if ocu500==1 & pob_hogar==1 & ocupinf==1  
replace PEAO_inf=0 if missing(PEAO_inf)

*CALCULAMOS PEAO FORMAL
gen PEAO_f=1 if ocu500==1 & pob_hogar==1 & ocupinf==2
replace PEAO_f=0 if missing(PEAO_f)
keep if PEA==1
order  ubigeo year trimestre mes PEA PEAO PEAO_f PEAO_inf 
keep ubigeo year trimestre mes PEA PEAO PEAO_f PEAO_inf 
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\PEAO_`r'_Trimestral.dta", replace
}
foreach t of numlist 2010/2020 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
append using "PEAO_`t'_Trimestral.dta"
}
gen n=1
collapse (sum) n PEAO PEAO_f PEAO_inf, by(year trimestre ubigeo)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0  PEAO n PEAO_f PEAO_inf 
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
gen A_PEAO=PEAO_Anual*100/n_Anual
gen A_PEAO_f=PEAO_f_Anual*100/n_Anual
gen A_PEAO_inf=PEAO_inf_Anual*100/n_Anual 
drop n* PEA* 
rename (A_PEAO A_PEAO_f A_PEAO_inf ) (PEAO PEAO_f PEAO_inf )
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\PEAO_2011_2021.dta", replace
!erase "*_Trimestral.dta"

*###############################################################################
*# variables: % pobres de la PEAO
*###############################################################################
global muestra "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho\sumaria"
foreach i of numlist 2010/2021 {
use "$muestra\sumaria-`i'.dta", clear
gen id_hogar=conglome+vivienda+hogar
**************
gen hogarpobre=1 if pobreza==1 | pobreza==2
replace hogarpobre=0 if pobreza==3
**************
gen ubigeo2 = substr(ubigeo, 1, 4)
replace ubigeo2 = ubigeo2 + "00"
drop ubigeo
rename ubigeo2 ubigeo
*************
gen year=`i'
*************
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12" 
*************
keep year trimestre mes ubigeo id_hogar hogarpobre 
order year   trimestre mes ubigeo id_hogar hogarpobre
sort   trimestre id_hogar
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\pobreza_`i'.dta", replace
}
foreach i of numlist 2010/2021 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
use "enaho01a-`i'-500.dta", clear
gen year=`i'
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
gen id_hogar=conglome+vivienda+hogar
gen pob_hogar=1 
gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
replace PEA=0 if missing(PEA)
gen PEAO=1 if ocu500==1 & pob_hogar==1
replace PEAO=0 if missing(PEAO)
keep if PEAO==1
keep year id_hogar ubigeo mes 
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
merge m:1  ubigeo id_hogar mes trimestre using "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\pobreza_`i'.dta"
drop if _merge==2
drop _merge
gen n=1
sort ubigeo year mes
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\pobreza_`i'_trimestral.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
foreach r of numlist 2010/2020 {
append using pobreza_`r'_trimestral.dta
}
collapse (sum) hogarpobre n, by(year ubigeo trimestre)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0 hogarpobre n
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
gen P_Pobreza=hogarpobre_Anual*100/n_Anual
drop hogarpobre* n* 
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\VariablePobreza_2011_2021.dta", replace
!erase "pobreza_*.dta"

*###############################################################################
*# variables: ingreso promedio trimestral de la PEA 
*Nota: Para la estimación del ingreso por trabajo se considera a todos los ocupados con ingresos mayores a cero. Incluye ingreso monetario,no 
*monetario, ingreso del dependiente e independiente, de la ocupación principal y secundaria.
*###############################################################################

foreach r of numlist 2010/2021 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\enaho"
use "enaho01a-`r'-500.dta", clear
mata st_varrename(1,"year")
destring year, replace
gen ubigeo2=substr(ubigeo,1,4)
replace ubigeo2=ubigeo2+"00"
drop ubigeo
rename ubigeo2 ubigeo
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12" 
*Genero PEA
gen pob_hogar=1 
gen PEA=1 if (ocu500==1| ocu500==2 | ocu500==3) & pob_hogar==1
replace PEA=0 if missing(PEA)
gen PEAO=1 if ocu500==1 & pob_hogar==1
replace PEAO=0 if missing(PEAO)
keep if PEAO==1
/*
if year==2011 {
rename fac500a7 factor500
}

if year>=2012 | year==2010 {
rename fac500a factor500
}
*/
foreach j in i524a1 i530a i538a1 i541a {
replace `j'=`j'/12
}
*Cálculo del promedio de ingresos mensuales en soles del 2007  
*Estàn en distinta frecuencia, asì que todo lo vuelvo mensual
*Para ocupación principal: INGRESOS DEPENDIENTES 
gen Pago_mensual_dep_prin=i524a1*30 if  p523==1 
replace Pago_mensual_dep_prin=i524a1*4 if  p523==2 
replace Pago_mensual_dep_prin=i524a1*2 if  p523==3 
replace Pago_mensual_dep_prin=i524a1*1 if  p523==4 
*Para ocupación secundaria: INGRESOS DEPENDIENTES 
gen Pago_mensual_dep_sec =  i538a1  
*Para la ocupación principal: INGRESO INDEPENDIENTE
gen Pago_mensual_indep_pri = i530a 
drop if Pago_mensual_indep_pri==999999
*Para la ocupación secundaria: INGRESO INDEPENDIENTE
gen Pago_mensual_indep_sec = i541a 
*Agrupo los ingresos por persona: INGRESO INDEPENDIENTE PRINCIPAL+INGRESO INDEPENDIENTE SECUNDARIO + INGRESO DEPENDIENTE
egen ingreso_peao=rowtotal(Pago_mensual_dep_pri Pago_mensual_dep_sec Pago_mensual_indep_pri Pago_mensual_indep_sec)

*Se reemplazó esto
/*
gen deflactor=109.0826291 if year==2010
replace deflactor=116.441111 if year==2011
replace deflactor=117.8414143 if year==2012
replace deflactor=119.0872742 if year==2013
replace deflactor=121.984002 if year==2014
replace deflactor=125.2660071 if year==2015
replace deflactor=129.1253058 if year==2016
replace deflactor=133.7940356 if year==2017
replace deflactor=136.8274959 if year==2018
replace deflactor=139.5433449 if year==2019
replace deflactor=145.4242106 if year==2020
replace deflactor=145.4242106 if year==2021
*/

gen deflactor=416784/382081*100 if year==2010
replace deflactor=473049/406256*100 if year==2011
replace deflactor=508131/431199*100 if year==2012
replace deflactor=543556/456435*100 if year==2013
replace deflactor=570041/467308*100 if year==2014
replace deflactor=604416/482506*100 if year==2015
replace deflactor=647668/501581*100 if year==2016
replace deflactor=687989/514215*100 if year==2017
replace deflactor=731588/534626*100 if year==2018
replace deflactor=761984/546605*100 if year==2019
replace deflactor=704939/486737*100 if year==2020
replace deflactor=866342/551714*100 if year==2021

replace ingreso_peao=ingreso_peao*100/deflactor 

gen n=1
/*drop Pago_persona deflactor
rename Pago_persona_defl ingreso_pea
tab p507
tab ocu500 if ingreso_pea==0
tab ocu500 if ingreso_pea==0 & p507==5 //(los ingresos de estas personas son: d558t d556t1) 
*/
keep year ubigeo trimestre ingreso_peao n
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
save "ingreso_peao_`r'_trimestral.dta", replace
}
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
foreach r of numlist 2010/2020 {
append using ingreso_peao_`r'_trimestral.dta
}
collapse (sum) ingreso_peao n, by(year ubigeo trimestre)
sort  ubigeo year trimestre // importanteeeee para anualizar
***********ANUALIZADO******
global var0 ingreso_peao n
foreach t of global var0 {
	bysort ubigeo: gen `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}
drop if year==2010
gen promedio_ingreso_peao=ingreso_peao_Anual/n_Anual
drop ingreso_peao* n*
rename promedio_ingreso_peao ingreso_peao
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\VariableIngreso_PEAO_2011_2021.dta", replace
!erase "*_trimestral.dta"


*###############################################################################
*# variables: POBLACION  
*###############################################################################
cls 
clear all
global muestra "D:\1. PROYECTOS TELLO\COVID Ingresos Evaluación de Impacto\BASE FINAL RODRIGO 01122020\ENAHO\MUESTRA\INPUTS\Anual"
global output "D:\1. PROYECTOS TELLO\COVID Ingresos Evaluación de Impacto\BASE FINAL RODRIGO 01122020\ENAHO\POBLACIÓN"
global ubigeo "D:\1. PROYECTOS TELLO\COVID Ingresos Evaluación de Impacto\BASE FINAL RODRIGO 01122020\ENAHO\MUESTRA\INPUTS"
cd "$muestra"

foreach t of numlist 2009/2020 {
use "enaho01-`t'-200.dta", clear
mata st_varrename(1,"year")
destring year, replace
gen ubigeo2 = substr(ubigeo, 1, 4)
replace ubigeo2 = ubigeo2 + "00"
drop ubigeo
rename ubigeo2 ubigeo
gen trimestre=1 if mes=="01" | mes=="02" | mes=="03"
replace trimestre=2 if mes=="04" | mes=="05" | mes=="06"
replace trimestre=3 if mes=="07" | mes=="08" | mes=="09"
replace trimestre=4 if mes=="10" | mes=="11" | mes=="12"
gen n=1
gen npob=facpob07*n
bys ubigeo trimestre: egen double poblacion_enaho=sum(npob)
keep ubigeo trimestre poblacion year
duplicates drop
egen double total_enaho=sum(poblacion)
save "$output\poblacion_`t'.dta", replace
}

cd "$output"
use poblacion_2009, clear
foreach t of numlist 2010/2020 {
append using poblacion_`t'
}
save poblacion_enaho_2009_2020.dta, replace

import excel "POBLACION ESTIMADA INEI 2010-2020 .xlsx", firstrow  clear
keep year trimestre ubigeo poblacion* total* PROVINCIA
rename PROVINCIA Provincia
merge 1:1 year trimestre ubigeo using poblacion_enaho_2009_2020.dta, nogen
sort ubigeo year trimestre 
order ubigeo year trimestre poblacion*
gen ajuste=total_enaho/total_inei
gen poblacion_ajus_enaho=poblacion_enaho/ajuste
bys year: egen double total_ajust_enaho=sum(poblacion_ajus_enaho)
 
sort  ubigeo year trimestre // importanteeeee para anualizar
replace poblacion_ajus_enaho=0 if missing(poblacion_ajus_enaho)
***********ANUALIZADO******
foreach t in poblacion_ajus_enaho {
	bysort ubigeo: gen double `t'_Anual = (`t' + `t'[_n-1]+`t'[_n-2]+`t'[_n-3])
	mvencode `t'_Anual, mv(0) override
}

drop if year==2009
merge m:m ubigeo using "$ubigeo\ubigeo_provincias.dta"
drop if _merge==1
drop _merge
order Provincia ubigeo year trimestre
rename Provincia provincia



gen periodo=1 if year==2010 & trimestre==1
replace periodo=2 if  year==2010 & trimestre==2
replace periodo=3 if  year==2010 & trimestre==3
replace periodo=4 if  year==2010 & trimestre==4
replace periodo=5 if  year==2011 & trimestre==1
replace periodo=6 if  year==2011 & trimestre==2
replace periodo=7 if  year==2011 & trimestre==3
replace periodo=8 if  year==2011 & trimestre==4
replace periodo=9 if  year==2012 & trimestre==1
replace periodo=10 if  year==2012 & trimestre==2
replace periodo=11 if  year==2012 & trimestre==3
replace periodo=12 if  year==2012 & trimestre==4
replace periodo=13 if  year==2013 & trimestre==1
replace periodo=14 if  year==2013 & trimestre==2
replace periodo=15 if  year==2013 & trimestre==3
replace periodo=16 if  year==2013 & trimestre==4
replace periodo=17 if  year==2014 & trimestre==1
replace periodo=18 if  year==2014 & trimestre==2
replace periodo=19 if  year==2014 & trimestre==3
replace periodo=20 if  year==2014 & trimestre==4
replace periodo=21 if  year==2015 & trimestre==1
replace periodo=22 if  year==2015 & trimestre==2
replace periodo=23 if  year==2015 & trimestre==3
replace periodo=24 if  year==2015 & trimestre==4
replace periodo=25 if  year==2016 & trimestre==1
replace periodo=26 if  year==2016 & trimestre==2
replace periodo=27 if  year==2016 & trimestre==3
replace periodo=28 if  year==2016 & trimestre==4
replace periodo=29 if  year==2017 & trimestre==1
replace periodo=30 if  year==2017 & trimestre==2
replace periodo=31 if  year==2017 & trimestre==3
replace periodo=32 if  year==2017 & trimestre==4
replace periodo=33 if  year==2018 & trimestre==1
replace periodo=34 if  year==2018 & trimestre==2
replace periodo=35 if  year==2018 & trimestre==3
replace periodo=36 if  year==2018 & trimestre==4
replace periodo=37 if  year==2019 & trimestre==1
replace periodo=38 if  year==2019 & trimestre==2
replace periodo=39 if  year==2019 & trimestre==3
replace periodo=40 if  year==2019 & trimestre==4
replace periodo=41 if  year==2020 & trimestre==1
replace periodo=42 if  year==2020 & trimestre==2
replace periodo=43 if  year==2020 & trimestre==3
replace periodo=44 if  year==2020 & trimestre==4


gen prov=1 if provincia=="ABANCAY"
	replace prov=2 if provincia=="ACOBAMBA"
	replace prov=3 if provincia=="ACOMAYO"
	replace prov=4 if provincia=="ALTO AMAZONAS"
	replace prov=5 if provincia=="AMBO"
	replace prov=6 if provincia=="ANDAHUAYLAS"
	replace prov=7 if provincia=="ANGARAES"
	replace prov=8 if provincia=="ANTA"
	replace prov=9 if provincia=="ANTONIO RAIMONDI"
	replace prov=10 if provincia=="AREQUIPA"
	replace prov=11 if provincia=="ASCOPE"
	replace prov=12 if provincia=="ATALAYA"
	replace prov=13 if provincia=="AYABACA"
	replace prov=14 if provincia=="AYMARAES"
	replace prov=15 if provincia=="AZANGARO"
	replace prov=16 if provincia=="BAGUA"
	replace prov=17 if provincia=="BARRANCA"
	replace prov=18 if provincia=="BELLAVISTA"
	replace prov=19 if provincia=="BOLIVAR"
	replace prov=20 if provincia=="BOLOGNESI"
	replace prov=21 if provincia=="BONGARA"
	replace prov=22 if provincia=="CAJABAMBA"
	replace prov=23 if provincia=="CAJAMARCA"
	replace prov=24 if provincia=="CAJATAMBO"
	replace prov=25 if provincia=="CALCA"
	replace prov=26 if provincia=="CALLAO"
	replace prov=27 if provincia=="CAMANA"
	replace prov=28 if provincia=="CANCHIS"
	replace prov=29 if provincia=="CANDARAVE"
	replace prov=30 if provincia=="CANGALLO"
	replace prov=31 if provincia=="CARABAYA"
	replace prov=32 if provincia=="CARAVELI"
	replace prov=33 if provincia=="CARHUAZ"
	replace prov=34 if provincia=="CARLOS FERMIN FITZCARRALD"
	replace prov=35 if provincia=="CASMA"
	replace prov=36 if provincia=="CASTILLA"
	replace prov=37 if provincia=="CASTROVIRREYNA"
	replace prov=38 if provincia=="CAYLLOMA"
	replace prov=39 if provincia=="CAÑETE"
	replace prov=40 if provincia=="CELENDIN"
	replace prov=41 if provincia=="CHACHAPOYAS"
	replace prov=42 if provincia=="CHANCHAMAYO"
	replace prov=43 if provincia=="CHEPEN"
	replace prov=44 if provincia=="CHICLAYO"
	replace prov=45 if provincia=="CHINCHA"
	replace prov=46 if provincia=="CHINCHEROS"
	replace prov=47 if provincia=="CHOTA"
	replace prov=48 if provincia=="CHUCUITO"
	replace prov=49 if provincia=="CHUMBIVILCAS"
	replace prov=50 if provincia=="CONCEPCION"
	replace prov=51 if provincia=="CONDESUYOS"
	replace prov=52 if provincia=="CONDORCANQUI"
	replace prov=53 if provincia=="CONTRALMIRANTE VILLAR"
	replace prov=54 if provincia=="CONTUMAZA"
	replace prov=55 if provincia=="CORONEL PORTILLO"
	replace prov=56 if provincia=="COTABAMBAS"
	replace prov=57 if provincia=="CUSCO"
	replace prov=58 if provincia=="CUTERVO"
	replace prov=59 if provincia=="DANIEL ALCIDES CARRION"
	replace prov=60 if provincia=="DATEM DEL MARAÑON"
	replace prov=61 if provincia=="DOS DE MAYO"
	replace prov=62 if provincia=="EL COLLAO"
	replace prov=63 if provincia=="EL DORADO"
	replace prov=64 if provincia=="ESPINAR"
	replace prov=65 if provincia=="FERREÑAFE"
	replace prov=66 if provincia=="GENERAL SANCHEZ CERRO"
	replace prov=67 if provincia=="GRAN CHIMU"
	replace prov=68 if provincia=="GRAU"
	replace prov=69 if provincia=="HUALGAYOC"
	replace prov=70 if provincia=="HUAMALIES"
	replace prov=71 if provincia=="HUAMANGA"
	replace prov=72 if provincia=="HUANCA SANCOS"
	replace prov=73 if provincia=="HUANCABAMBA"
	replace prov=74 if provincia=="HUANCANE"
	replace prov=75 if provincia=="HUANCAVELICA"
	replace prov=76 if provincia=="HUANCAYO"
	replace prov=77 if provincia=="HUANTA"
	replace prov=78 if provincia=="HUANUCO"
	replace prov=79 if provincia=="HUARAL"
	replace prov=80 if provincia=="HUARAZ"
	replace prov=81 if provincia=="HUARI"
	replace prov=82 if provincia=="HUARMEY"
	replace prov=83 if provincia=="HUAROCHIRI"
	replace prov=84 if provincia=="HUAURA"
	replace prov=85 if provincia=="HUAYTARA"
	replace prov=86 if provincia=="ICA"
	replace prov=87 if provincia=="ILO"
	replace prov=88 if provincia=="ISLAY"
	replace prov=89 if provincia=="JAEN"
	replace prov=90 if provincia=="JAUJA"
	replace prov=91 if provincia=="JORGE BASADRE"
	replace prov=92 if provincia=="LA CONVENCION"
	replace prov=93 if provincia=="LA MAR"
	replace prov=94 if provincia=="LA UNION"
	replace prov=95 if provincia=="LAMAS"
	replace prov=96 if provincia=="LAMBAYEQUE"
	replace prov=97 if provincia=="LAMPA"
	replace prov=98 if provincia=="LAURICOCHA"
	replace prov=99 if provincia=="LEONCIO PRADO"
	replace prov=100 if provincia=="LIMA"
	replace prov=101 if provincia=="LORETO"
	replace prov=102 if provincia=="LUCANAS"
	replace prov=103 if provincia=="LUYA"
	replace prov=104 if provincia=="MANU"
	replace prov=105 if provincia=="MARISCAL CACERES"
	replace prov=106 if provincia=="MARISCAL NIETO"
	replace prov=107 if provincia=="MARISCAL RAMON CASTILLA"
	replace prov=108 if provincia=="MAYNAS"
	replace prov=109 if provincia=="MELGAR"
	replace prov=110 if provincia=="MOHO"
	replace prov=111 if provincia=="MORROPON"
	replace prov=112 if provincia=="MOYOBAMBA"
	replace prov=113 if provincia=="NAZCA"
	replace prov=114 if provincia=="OTUZCO"
	replace prov=115 if provincia=="OXAPAMPA"
	replace prov=116 if provincia=="OYON"
	replace prov=117 if provincia=="PACASMAYO"
	replace prov=118 if provincia=="PACHITEA"
	replace prov=119 if provincia=="PADRE ABAD"
	replace prov=120 if provincia=="PAITA"
	replace prov=121 if provincia=="PALLASCA"
	replace prov=122 if provincia=="PALPA"
	replace prov=123 if provincia=="PARINACOCHAS"
	replace prov=124 if provincia=="PARURO"
	replace prov=125 if provincia=="PASCO"
	replace prov=126 if provincia=="PATAZ"
	replace prov=127 if provincia=="PAUCARTAMBO"
	replace prov=128 if provincia=="PICOTA"
	replace prov=129 if provincia=="PISCO"
	replace prov=130 if provincia=="PIURA"
	replace prov=131 if provincia=="POMABAMBA"
	replace prov=132 if provincia=="PUERTO INCA"
	replace prov=133 if provincia=="PUNO"
	replace prov=134 if provincia=="QUISPICANCHI"
	replace prov=135 if provincia=="REQUENA"
	replace prov=136 if provincia=="RIOJA"
	replace prov=137 if provincia=="RODRIGUEZ DE MENDOZA"
	replace prov=138 if provincia=="SAN ANTONIO DE PUTINA"
	replace prov=139 if provincia=="SAN IGNACIO"
	replace prov=140 if provincia=="SAN MARTIN"
	replace prov=141 if provincia=="SAN ROMAN"
	replace prov=142 if provincia=="SANCHEZ CARRION"
	replace prov=143 if provincia=="SANDIA"
	replace prov=144 if provincia=="SANTA"
	replace prov=145 if provincia=="SANTA CRUZ"
	replace prov=146 if provincia=="SANTIAGO DE CHUCO"
	replace prov=147 if provincia=="SATIPO"
	replace prov=148 if provincia=="SECHURA"
	replace prov=149 if provincia=="SULLANA"
	replace prov=150 if provincia=="TACNA"
	replace prov=151 if provincia=="TAHUAMANU"
	replace prov=152 if provincia=="TALARA"
	replace prov=153 if provincia=="TAMBOPATA"
	replace prov=154 if provincia=="TARATA"
	replace prov=155 if provincia=="TARMA"
	replace prov=156 if provincia=="TAYACAJA"
	replace prov=157 if provincia=="TOCACHE"
	replace prov=158 if provincia=="TRUJILLO"
	replace prov=159 if provincia=="TUMBES"
	replace prov=160 if provincia=="UCAYALI"
	replace prov=161 if provincia=="URUBAMBA"
	replace prov=162 if provincia=="UTCUBAMBA"
	replace prov=163 if provincia=="VICTOR FAJARDO"
	replace prov=164 if provincia=="YAROWILCA"
	replace prov=165 if provincia=="YAULI"
	replace prov=166 if provincia=="YAUYOS"
	replace prov=167 if provincia=="YUNGAY"
	replace prov=168 if provincia=="YUNGUYO"
	replace prov=169 if provincia=="ZARUMILLA"
	replace prov=170 if provincia=="ANTABAMBA"
	replace prov=171 if provincia=="ASUNCION"
	replace prov=172 if provincia=="CHUPACA"
	replace prov=173 if provincia=="CHURCAMPA"
	replace prov=174 if provincia=="HUACAYBAMBA"
	replace prov=175 if provincia=="HUALLAGA"
	replace prov=176 if provincia=="HUAYLAS"
	replace prov=177 if provincia=="JUNIN"
	replace prov=178 if provincia=="MARAÑON"
	replace prov=179 if provincia=="OCROS"
	replace prov=180 if provincia=="PAUCAR DEL SARA SARA"
	replace prov=181 if provincia=="PURUS"
	replace prov=182 if provincia=="RECUAY"
	replace prov=183 if provincia=="SAN MARCOS"
	replace prov=184 if provincia=="SIHUAS"
	replace prov=185 if provincia=="VILCAS HUAMAN"
	replace prov=186 if provincia=="VIRU"
	replace prov=187 if provincia=="CANAS"
	replace prov=188 if provincia=="CANTA"
	replace prov=189 if provincia=="JULCAN"
	replace prov=190 if provincia=="SAN MIGUEL"
	replace prov=191 if provincia=="SUCRE"
	replace prov=192 if provincia=="MARISCAL LUZURIAGA"
	replace prov=193 if provincia=="SAN PABLO"
	replace prov=194 if provincia=="AIJA"
	replace prov=195 if provincia=="CORONGO"
	rename provincia Nombreprovincia

	
	
	



order year trimestre periodo ubigeo Nombreprovincia prov 
replace poblacion_ajus_enaho_Anual=. if poblacion_ajus_enaho_Anual==0
save poblacion_enaho_ajustada_anualizada_2010_2020.dta, replace
rename poblacion_ajus_enaho_Anual poblacion
keep ubigeo Nombreprovincia year trimestre poblacion
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\poblacion_enaho_ajustada_anualizada_2010_2020.dta", replace


*###############################################################################
*# variables: merge de todas las variables
*###############################################################################
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos"
use VariablePobreza_2011_2021.dta, clear 
merge 1:1 year trimestre ubigeo using Edad_2011_2021.dta, nogen
merge 1:1 year trimestre ubigeo using Mujeres_Educacion_2011_2021.dta, nogen
merge 1:1 year trimestre ubigeo using PEAO_2011_2021.dta, nogen
merge 1:1 year trimestre ubigeo using condicioneshogar_2010_2021.dta, nogen
merge 1:1 year trimestre ubigeo using VariableIngreso_PEAO_2011_2021.dta, nogen
merge 1:1 year trimestre ubigeo using "$intermedios\base_datos_para_spillover\SP_Edad_jefe_Trimestral_2010_2021.dta", keep(3) nogen
*merge 1:1 year trimestre ubigeo using poblacion_enaho_ajustada_anualizada_2010_2020.dta
merge m:1 ubigeo using "densidad", nogen keep(3)
merge m:1 ubigeo using SP_tiempo_cs_2019, nogen 
merge m:1 ubigeo using SP_densidad_2019, nogen
merge m:1 ubigeo using "porc_gasto_alimentos_2019.dta", nogen
merge m:m ubigeo using "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\ubigeo_provincias.dta", keep(3)
drop if _merge==1 | _merge==2
drop _merge
sort ubigeo year trimestre 
*replace poblacion=. if poblacion==0
gen periodo=1 if year==2010 & trimestre==1
replace periodo=2 if  year==2010 & trimestre==2
replace periodo=3 if  year==2010 & trimestre==3
replace periodo=4 if  year==2010 & trimestre==4
replace periodo=1 if  year==2011 & trimestre==1
replace periodo=2 if  year==2011 & trimestre==2
replace periodo=3 if  year==2011 & trimestre==3
replace periodo=4 if  year==2011 & trimestre==4
replace periodo=5 if  year==2012 & trimestre==1
replace periodo=6 if  year==2012 & trimestre==2
replace periodo=7 if  year==2012 & trimestre==3
replace periodo=8 if  year==2012 & trimestre==4
replace periodo=9 if  year==2013 & trimestre==1
replace periodo=10 if  year==2013 & trimestre==2
replace periodo=11 if  year==2013 & trimestre==3
replace periodo=12 if  year==2013 & trimestre==4
replace periodo=13 if  year==2014 & trimestre==1
replace periodo=14 if  year==2014 & trimestre==2
replace periodo=15 if  year==2014 & trimestre==3
replace periodo=16 if  year==2014 & trimestre==4
replace periodo=17 if  year==2015 & trimestre==1
replace periodo=18 if  year==2015 & trimestre==2
replace periodo=19 if  year==2015 & trimestre==3
replace periodo=20 if  year==2015 & trimestre==4
replace periodo=21 if  year==2016 & trimestre==1
replace periodo=22 if  year==2016 & trimestre==2
replace periodo=23 if  year==2016 & trimestre==3
replace periodo=24 if  year==2016 & trimestre==4
replace periodo=25 if  year==2017 & trimestre==1
replace periodo=26 if  year==2017 & trimestre==2
replace periodo=27 if  year==2017 & trimestre==3
replace periodo=28 if  year==2017 & trimestre==4
replace periodo=29 if  year==2018 & trimestre==1
replace periodo=30 if  year==2018 & trimestre==2
replace periodo=31 if  year==2018 & trimestre==3
replace periodo=32 if  year==2018 & trimestre==4
replace periodo=33 if  year==2019 & trimestre==1
replace periodo=34 if  year==2019 & trimestre==2
replace periodo=35 if  year==2019 & trimestre==3
replace periodo=36 if  year==2019 & trimestre==4
replace periodo=37 if  year==2020 & trimestre==1
replace periodo=38 if  year==2020 & trimestre==2
replace periodo=39 if  year==2020 & trimestre==3
replace periodo=40 if  year==2020 & trimestre==4
replace periodo=41 if  year==2021 & trimestre==1
replace periodo=42 if  year==2021 & trimestre==2
replace periodo=43 if  year==2021 & trimestre==3
replace periodo=44 if  year==2021 & trimestre==4


gen prov=1 if provincia=="ABANCAY"
	replace prov=2 if provincia=="ACOBAMBA"
	replace prov=3 if provincia=="ACOMAYO"
	replace prov=4 if provincia=="ALTO AMAZONAS"
	replace prov=5 if provincia=="AMBO"
	replace prov=6 if provincia=="ANDAHUAYLAS"
	replace prov=7 if provincia=="ANGARAES"
	replace prov=8 if provincia=="ANTA"
	replace prov=9 if provincia=="ANTONIO RAIMONDI"
	replace prov=10 if provincia=="AREQUIPA"
	replace prov=11 if provincia=="ASCOPE"
	replace prov=12 if provincia=="ATALAYA"
	replace prov=13 if provincia=="AYABACA"
	replace prov=14 if provincia=="AYMARAES"
	replace prov=15 if provincia=="AZANGARO"
	replace prov=16 if provincia=="BAGUA"
	replace prov=17 if provincia=="BARRANCA"
	replace prov=18 if provincia=="BELLAVISTA"
	replace prov=19 if provincia=="BOLIVAR"
	replace prov=20 if provincia=="BOLOGNESI"
	replace prov=21 if provincia=="BONGARA"
	replace prov=22 if provincia=="CAJABAMBA"
	replace prov=23 if provincia=="CAJAMARCA"
	replace prov=24 if provincia=="CAJATAMBO"
	replace prov=25 if provincia=="CALCA"
	replace prov=26 if provincia=="CALLAO"
	replace prov=27 if provincia=="CAMANA"
	replace prov=28 if provincia=="CANCHIS"
	replace prov=29 if provincia=="CANDARAVE"
	replace prov=30 if provincia=="CANGALLO"
	replace prov=31 if provincia=="CARABAYA"
	replace prov=32 if provincia=="CARAVELI"
	replace prov=33 if provincia=="CARHUAZ"
	replace prov=34 if provincia=="CARLOS FERMIN FITZCARRALD"
	replace prov=35 if provincia=="CASMA"
	replace prov=36 if provincia=="CASTILLA"
	replace prov=37 if provincia=="CASTROVIRREYNA"
	replace prov=38 if provincia=="CAYLLOMA"
	replace prov=39 if provincia=="CAÑETE"
	replace prov=40 if provincia=="CELENDIN"
	replace prov=41 if provincia=="CHACHAPOYAS"
	replace prov=42 if provincia=="CHANCHAMAYO"
	replace prov=43 if provincia=="CHEPEN"
	replace prov=44 if provincia=="CHICLAYO"
	replace prov=45 if provincia=="CHINCHA"
	replace prov=46 if provincia=="CHINCHEROS"
	replace prov=47 if provincia=="CHOTA"
	replace prov=48 if provincia=="CHUCUITO"
	replace prov=49 if provincia=="CHUMBIVILCAS"
	replace prov=50 if provincia=="CONCEPCION"
	replace prov=51 if provincia=="CONDESUYOS"
	replace prov=52 if provincia=="CONDORCANQUI"
	replace prov=53 if provincia=="CONTRALMIRANTE VILLAR"
	replace prov=54 if provincia=="CONTUMAZA"
	replace prov=55 if provincia=="CORONEL PORTILLO"
	replace prov=56 if provincia=="COTABAMBAS"
	replace prov=57 if provincia=="CUSCO"
	replace prov=58 if provincia=="CUTERVO"
	replace prov=59 if provincia=="DANIEL ALCIDES CARRION"
	replace prov=60 if provincia=="DATEM DEL MARAÑON"
	replace prov=61 if provincia=="DOS DE MAYO"
	replace prov=62 if provincia=="EL COLLAO"
	replace prov=63 if provincia=="EL DORADO"
	replace prov=64 if provincia=="ESPINAR"
	replace prov=65 if provincia=="FERREÑAFE"
	replace prov=66 if provincia=="GENERAL SANCHEZ CERRO"
	replace prov=67 if provincia=="GRAN CHIMU"
	replace prov=68 if provincia=="GRAU"
	replace prov=69 if provincia=="HUALGAYOC"
	replace prov=70 if provincia=="HUAMALIES"
	replace prov=71 if provincia=="HUAMANGA"
	replace prov=72 if provincia=="HUANCA SANCOS"
	replace prov=73 if provincia=="HUANCABAMBA"
	replace prov=74 if provincia=="HUANCANE"
	replace prov=75 if provincia=="HUANCAVELICA"
	replace prov=76 if provincia=="HUANCAYO"
	replace prov=77 if provincia=="HUANTA"
	replace prov=78 if provincia=="HUANUCO"
	replace prov=79 if provincia=="HUARAL"
	replace prov=80 if provincia=="HUARAZ"
	replace prov=81 if provincia=="HUARI"
	replace prov=82 if provincia=="HUARMEY"
	replace prov=83 if provincia=="HUAROCHIRI"
	replace prov=84 if provincia=="HUAURA"
	replace prov=85 if provincia=="HUAYTARA"
	replace prov=86 if provincia=="ICA"
	replace prov=87 if provincia=="ILO"
	replace prov=88 if provincia=="ISLAY"
	replace prov=89 if provincia=="JAEN"
	replace prov=90 if provincia=="JAUJA"
	replace prov=91 if provincia=="JORGE BASADRE"
	replace prov=92 if provincia=="LA CONVENCION"
	replace prov=93 if provincia=="LA MAR"
	replace prov=94 if provincia=="LA UNION"
	replace prov=95 if provincia=="LAMAS"
	replace prov=96 if provincia=="LAMBAYEQUE"
	replace prov=97 if provincia=="LAMPA"
	replace prov=98 if provincia=="LAURICOCHA"
	replace prov=99 if provincia=="LEONCIO PRADO"
	replace prov=100 if provincia=="LIMA"
	replace prov=101 if provincia=="LORETO"
	replace prov=102 if provincia=="LUCANAS"
	replace prov=103 if provincia=="LUYA"
	replace prov=104 if provincia=="MANU"
	replace prov=105 if provincia=="MARISCAL CACERES"
	replace prov=106 if provincia=="MARISCAL NIETO"
	replace prov=107 if provincia=="MARISCAL RAMON CASTILLA"
	replace prov=108 if provincia=="MAYNAS"
	replace prov=109 if provincia=="MELGAR"
	replace prov=110 if provincia=="MOHO"
	replace prov=111 if provincia=="MORROPON"
	replace prov=112 if provincia=="MOYOBAMBA"
	replace prov=113 if provincia=="NAZCA"
	replace prov=114 if provincia=="OTUZCO"
	replace prov=115 if provincia=="OXAPAMPA"
	replace prov=116 if provincia=="OYON"
	replace prov=117 if provincia=="PACASMAYO"
	replace prov=118 if provincia=="PACHITEA"
	replace prov=119 if provincia=="PADRE ABAD"
	replace prov=120 if provincia=="PAITA"
	replace prov=121 if provincia=="PALLASCA"
	replace prov=122 if provincia=="PALPA"
	replace prov=123 if provincia=="PARINACOCHAS"
	replace prov=124 if provincia=="PARURO"
	replace prov=125 if provincia=="PASCO"
	replace prov=126 if provincia=="PATAZ"
	replace prov=127 if provincia=="PAUCARTAMBO"
	replace prov=128 if provincia=="PICOTA"
	replace prov=129 if provincia=="PISCO"
	replace prov=130 if provincia=="PIURA"
	replace prov=131 if provincia=="POMABAMBA"
	replace prov=132 if provincia=="PUERTO INCA"
	replace prov=133 if provincia=="PUNO"
	replace prov=134 if provincia=="QUISPICANCHI"
	replace prov=135 if provincia=="REQUENA"
	replace prov=136 if provincia=="RIOJA"
	replace prov=137 if provincia=="RODRIGUEZ DE MENDOZA"
	replace prov=138 if provincia=="SAN ANTONIO DE PUTINA"
	replace prov=139 if provincia=="SAN IGNACIO"
	replace prov=140 if provincia=="SAN MARTIN"
	replace prov=141 if provincia=="SAN ROMAN"
	replace prov=142 if provincia=="SANCHEZ CARRION"
	replace prov=143 if provincia=="SANDIA"
	replace prov=144 if provincia=="SANTA"
	replace prov=145 if provincia=="SANTA CRUZ"
	replace prov=146 if provincia=="SANTIAGO DE CHUCO"
	replace prov=147 if provincia=="SATIPO"
	replace prov=148 if provincia=="SECHURA"
	replace prov=149 if provincia=="SULLANA"
	replace prov=150 if provincia=="TACNA"
	replace prov=151 if provincia=="TAHUAMANU"
	replace prov=152 if provincia=="TALARA"
	replace prov=153 if provincia=="TAMBOPATA"
	replace prov=154 if provincia=="TARATA"
	replace prov=155 if provincia=="TARMA"
	replace prov=156 if provincia=="TAYACAJA"
	replace prov=157 if provincia=="TOCACHE"
	replace prov=158 if provincia=="TRUJILLO"
	replace prov=159 if provincia=="TUMBES"
	replace prov=160 if provincia=="UCAYALI"
	replace prov=161 if provincia=="URUBAMBA"
	replace prov=162 if provincia=="UTCUBAMBA"
	replace prov=163 if provincia=="VICTOR FAJARDO"
	replace prov=164 if provincia=="YAROWILCA"
	replace prov=165 if provincia=="YAULI"
	replace prov=166 if provincia=="YAUYOS"
	replace prov=167 if provincia=="YUNGAY"
	replace prov=168 if provincia=="YUNGUYO"
	replace prov=169 if provincia=="ZARUMILLA"
	replace prov=170 if provincia=="ANTABAMBA"
	replace prov=171 if provincia=="ASUNCION"
	replace prov=172 if provincia=="CHUPACA"
	replace prov=173 if provincia=="CHURCAMPA"
	replace prov=174 if provincia=="HUACAYBAMBA"
	replace prov=175 if provincia=="HUALLAGA"
	replace prov=176 if provincia=="HUAYLAS"
	replace prov=177 if provincia=="JUNIN"
	replace prov=178 if provincia=="MARAÑON"
	replace prov=179 if provincia=="OCROS"
	replace prov=180 if provincia=="PAUCAR DEL SARA SARA"
	replace prov=181 if provincia=="PURUS"
	replace prov=182 if provincia=="RECUAY"
	replace prov=183 if provincia=="SAN MARCOS"
	replace prov=184 if provincia=="SIHUAS"
	replace prov=185 if provincia=="VILCAS HUAMAN"
	replace prov=186 if provincia=="VIRU"
	replace prov=187 if provincia=="CANAS"
	replace prov=188 if provincia=="CANTA"
	replace prov=189 if provincia=="JULCAN"
	replace prov=190 if provincia=="SAN MIGUEL"
	replace prov=191 if provincia=="SUCRE"
	replace prov=192 if provincia=="MARISCAL LUZURIAGA"
	replace prov=193 if provincia=="SAN PABLO"
	replace prov=194 if provincia=="AIJA"
	replace prov=195 if provincia=="CORONGO"
	rename provincia NombreProvincia
	rename prov provincia

save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\BaseEnaho.dta", replace

bys ubigeo: egen nomissing = count(y) if (periodo==1 | periodo==2 /// BALANCEO DE BASE
	|periodo==3 |periodo==4 |periodo==5 |periodo==6 |periodo==7 |periodo==8  ///
	|periodo==9 |periodo==10 |periodo==11 |periodo==12 |periodo==13 ///
	|periodo==14 |periodo==15 |periodo==16 | periodo==17 | periodo==18 ///
	| periodo==19 | periodo==20 | periodo==21 | periodo==22 | periodo==23 ///
	| periodo==24 | periodo==25 | periodo==26 | periodo==27 | periodo==28 ///
	| periodo==29| periodo==30 | periodo==31 | periodo==32 | periodo==33 ///
	| periodo==34| periodo==35 | periodo==36 | periodo==37 | periodo==38  ///
	| periodo==39 | periodo==40 | periodo==41 | periodo==42 | periodo==43 | periodo==44)
	keep if nomissing==44
	drop nomissing

sort provincia periodo 
rename NombreProvincia Nombreprovincia
********** MERGEO CON LA BASE DE DELINCUENCIA
merge m:1 Nombreprovincia using "$intermedios\delincuencia\delincuencia.dta"
drop if _merge==2
drop _merge 
rename Nombreprovincia NombreProvincia
******* MERGEO CON LOS CORTES
merge m:1 NombreProvincia using "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\BD_tratados.dta", nogen keep(3) //mergeo con CORTE AL 1 Y CORTE AL 0.5
order NombreProvincia provincia ubigeo year trimestre periodo  CORTE*


******* ESTANDARIZACIÓN
***PEAO PEAO_f PEAO_inf P_Pobreza ingreso_peao
foreach var in PEAO PEAO_f PEAO_inf P_Pobreza ingreso_peao {
egen m_p1_`var'_1porc=mean(`var') if CORTEAL1=="TRATADO" & periodo<=37
egen m_`var'_1porc=mean(m_p1_`var'_1porc)
drop m_p1_`var'_1porc
}

*Genero la variable estandarizada:
foreach t in PEAO_f PEAO_inf  ingreso_peao PEAO P_Pobreza {
gen `t'_est_1=`t'/m_`t'_1porc
drop m_`t'_1porc 
}


rename P_Pobreza_est_1 pobre_est_1
sort provincia periodo
save "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\BD_BaseFinalBalanceada.dta", replace



foreach var in PEAO PEAO_f PEAO_inf pobre ingreso_peao {
foreach j of numlist  1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169  {
use "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\n_base_datos\BD_BaseFinalBalanceada.dta", clear
keep if provincia==`j' | CORTEAL1=="CONTROL"
gsort -CORTEAL1 provincia periodo
keep periodo provincia NombreProvincia `var'_est_1
drop provincia
rename NombreProvincia provincia
export excel "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\bases_variables\BD_`var'_est_1_provincia_`j'.xlsx", firstrow(variables) replace
}
}
















