cls
clear all
global intermedios "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios"



*###############################################################################
*# variables:  PEAO 
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
save "$intermedios\base_datos_no_anualizada\PEAO_`r'_Trimestral.dta", replace
}
foreach t of numlist 2010/2020 {
cd "$intermedios\base_datos_no_anualizada"
append using "PEAO_`t'_Trimestral.dta"
}
gen n=1
collapse (mean) PEAO PEAO_f PEAO_inf , by(year trimestre ubigeo)
sort  ubigeo year trimestre // importanteeeee para anualizar
foreach v in PEAO PEAO_f PEAO_inf  {
replace `v'=`v'*100
}
drop if year==2010
save "BD_PEAO_2011_2021.dta", replace
!erase PEAO_*




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
save "$intermedios\base_datos_no_anualizada\pobreza_`i'.dta", replace
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
merge m:1  ubigeo id_hogar mes trimestre using "$intermedios\base_datos_no_anualizada\pobreza_`i'.dta"
drop if _merge==2
drop _merge
gen n=1
sort ubigeo year mes
cd "$intermedios\base_datos_no_anualizada"
save "pobreza_`i'_trimestral.dta", replace
}

cd "$intermedios\base_datos_no_anualizada"
foreach r of numlist 2010/2020 {
append using pobreza_`r'_trimestral.dta
}
collapse (sum) n hogarpobre, by(year ubigeo trimestre)
replace hogarpobre=hogarpobre*100/n
sort  ubigeo year trimestre // importanteeeee para anualizar
rename hogarpobre pobre
drop n
save "BD_VariablePobreza_2011_2021.dta", replace
!erase pobreza_*




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
egen  ingtrabw= rowtotal(i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t) 
gen   ingtra_n= ingtrabw
keep if ocu500==1 & ingtra_n>0 
rename ingtra_n ingreso_peao
replace ingreso_peao=ingreso_peao/12
*Agrupo los ingresos por persona: INGRESO INDEPENDIENTE PRINCIPAL+INGRESO INDEPENDIENTE SECUNDARIO + INGRESO DEPENDIENTE
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
replace deflactor=157.0273729 if year==2021
replace ingreso_peao=ingreso_peao*100/deflactor 
keep year ubigeo trimestre ingreso_peao 
cd "$intermedios\base_datos_no_anualizada"
save "ingreso_peao_`r'_trimestral.dta", replace
}
foreach r of numlist 2010/2020 {
append using ingreso_peao_`r'_trimestral.dta
}
collapse (mean) ingreso_peao , by(year ubigeo trimestre)
sort  ubigeo year trimestre // importanteeeee para anualizar
save "BD_VariableIngreso_PEAO_2011_2021.dta", replace
!erase ingreso_*



cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\base_datos_no_anualizada"
use "BD_VariableIngreso_PEAO_2011_2021.dta", clear
merge 1:1 ubigeo year trimestre using "BD_VariablePobreza_2011_2021.dta", nogen
merge 1:1 ubigeo year trimestre using "BD_PEAO_2011_2021.dta", nogen
drop if year==2010
merge m:m ubigeo using "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\inputs\ubigeo_provincias.dta", keep(3) nogen
gen periodo=1 if  year==2011 & trimestre==1
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

order periodo year trimestre provincia


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
merge m:1 NombreProvincia using "$intermedios\n_base_datos\BD_tratados.dta", nogen keep(3)
order NombreProvincia provincia ubigeo year trimestre periodo  CORTE*

save BD_BaseFinalBalanceada_no_anualizada_12052022.dta, replace
























