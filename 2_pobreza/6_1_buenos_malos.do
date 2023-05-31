cls 
clear all
global tipo_provincia "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia"
global provincias_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\provincias_significativas"
global provincias_no_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\provincias_no_significativas"

*En pobreza, para que sea considerado bueno, el observado debe ser mayor que el scm y el scm_sp 


***************************************************************************************************************************************
*alimentos
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\alimentos\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_alimentos_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 3 4 {
use "$tipo_provincia\sp_alimentos_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_alimentos_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_alimentos_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_alimentos_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="alimentos_s`s'"
order variable
save "$tipo_provincia\buenos\sp_alimentos_s`s'_buenos_significativo.dta", replace
}


cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_alimentos_s1_buenos_significativo.dta", clear
foreach s of numlist 2 3 4 {
append using "$tipo_provincia\buenos\sp_alimentos_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_alimentos.dta", replace
!erase sp_*


***************************************************************************************************************************************

*criminalidad 
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\criminalidad\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_criminalidad_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 3 4  {
use "$tipo_provincia\sp_criminalidad_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_criminalidad_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_criminalidad_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_criminalidad_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
tab tipo test
keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="criminalidad_s`s'"
order variable
save "$tipo_provincia\buenos\sp_criminalidad_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_criminalidad_s1_buenos_significativo.dta", clear
foreach s of numlist  2 3 4 {
append using "$tipo_provincia\buenos\sp_criminalidad_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_criminalidad.dta", replace

***************************************************************************************************************************************

*jefe_hogar
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\jefe_hogar\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_jefe_hogar_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 3 4  {
use "$tipo_provincia\sp_jefe_hogar_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_jefe_hogar_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_jefe_hogar_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_jefe_hogar_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
tab tipo test

keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="jefe_hogar_s`s'"
order variable
save "$tipo_provincia\buenos\sp_jefe_hogar_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_jefe_hogar_s1_buenos_significativo.dta", clear
foreach s of numlist 2 3 4 {
append using "$tipo_provincia\buenos\sp_jefe_hogar_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_jefe_hogar.dta", replace


***************************************************************************************************************************************


***mujeres 1 2 3 4
foreach s of numlist 1 3 2 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\mujeres\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_mujeres_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 4 {
use "$tipo_provincia\sp_mujeres_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_mujeres_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_mujeres_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_mujeres_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
tab tipo test
keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="mujeres_s`s'"
order variable
save "$tipo_provincia\buenos\sp_mujeres_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_mujeres_s1_buenos_significativo.dta", clear
foreach s of numlist 2 4 {
append using "$tipo_provincia\buenos\sp_mujeres_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_mujeres.dta", replace




***************************************************************************************************************************************

*informalidad
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\informalidad\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_informalidad_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 3 4 {
use "$tipo_provincia\sp_informalidad_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_informalidad_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_informalidad_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_informalidad_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
tab tipo test
keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="informalidad_s`s'"
order variable
save "$tipo_provincia\buenos\sp_informalidad_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_informalidad_s1_buenos_significativo.dta", clear
foreach s of numlist  2 3 4   {
append using "$tipo_provincia\buenos\sp_informalidad_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_informalidad.dta", replace



***************************************************************************************************************************************

*distancia_centro_salud  // todos los buenos no son significativos
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\distancia_centro_salud\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_distancia_centro_salud_simulacion_`s'_provincia_`j'.dta", replace 
}
}


***************************************************************************************************************************************
*densidad
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_densidad_simulacion_`s'_provincia_`j'.dta", replace 
}
}


foreach s of numlist 1 2 3 4 {
use "$tipo_provincia\sp_densidad_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_densidad_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_densidad_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_densidad_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f
keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="densidad_s`s'"
order variable
save "$tipo_provincia\buenos\sp_densidad_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_densidad_s1_buenos_significativo.dta", clear
foreach s of numlist 2 3 4 {
append using "$tipo_provincia\buenos\sp_densidad_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_densidad.dta", replace


***************************************************************************************************************************************

*densidad_g
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad_g\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_densidad_g_simulacion_`s'_provincia_`j'.dta", replace 
}
}



foreach s of numlist 1 2 3 4 {
use "$tipo_provincia\sp_densidad_g_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_densidad_g_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_densidad_g_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_densidad_g_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f

keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="densidad_g_s`s'"
order variable
save "$tipo_provincia\buenos\sp_densidad_g_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_densidad_g_s1_buenos_significativo.dta", clear
foreach s of numlist 2 3 4 {
append using "$tipo_provincia\buenos\sp_densidad_g_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_densidad_g.dta", replace



***************************************************************************************************************************************
*bajo_ingreso
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_ingreso\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_bajo_ingreso_simulacion_`s'_provincia_`j'.dta", replace 
}
}

foreach s of numlist 1 2 3 4 {
use "$tipo_provincia\sp_bajo_ingreso_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_bajo_ingreso_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_bajo_ingreso_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_bajo_ingreso_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f

keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="bajo_ingreso_s`s'"
order variable
save "$tipo_provincia\buenos\sp_bajo_ingreso_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_bajo_ingreso_s1_buenos_significativo.dta", clear
foreach s of numlist 2 3 4 {
append using "$tipo_provincia\buenos\sp_bajo_ingreso_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_bajo_ingreso.dta", replace



***************************************************************************************************************************************
*bajo_niv_educ
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_`s'"
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_simulacion_`s'.xlsx, sheet(`j') firstrow clear
gen provincia=`j'
keep if periodo>=38
gen buenos=(observado>synthetic_control & observado>synthetic_control_spillover & synthetic_control_spillover>synthetic_control)
egen sum_buenos =sum(buenos)
gen tipo="buenos" if sum_buenos>=5  // le coloco un minimo de 5 periodos para que sea considerado bueno
replace tipo="malos" if sum_buenos<5
keep provincia tipo
duplicates drop
save "$tipo_provincia\sp_bajo_niv_educ_simulacion_`s'_provincia_`j'.dta", replace 
}
}
** para la simulacion 1 3 4 
foreach s of numlist 1  3 4 {
use "$tipo_provincia\sp_bajo_niv_educ_simulacion_`s'_provincia_1.dta", clear
foreach j of numlist 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using "$tipo_provincia\sp_bajo_niv_educ_simulacion_`s'_provincia_`j'.dta"
}
merge 1:1 provincia using "$provincias_significativas\sp_bajo_niv_educ_s`s'_significativos.dta", nogen
merge 1:1 provincia using "$provincias_no_significativas\sp_bajo_niv_educ_s`s'_no_significativos.dta", nogen
gen tests_f=tests 
replace tests_f=tests_ns if missing(tests_f)
drop tests tests_ns
gen test="significativo" if tests_f==1
replace test="no significativo" if tests_f==0
drop tests_f

keep if tipo=="buenos" & test=="significativo"
keep provincia
xpose, clear 
gen variable="bajo_niv_educ_s`s'"
order variable
save "$tipo_provincia\buenos\sp_bajo_niv_educ_s`s'_buenos_significativo.dta", replace
}

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
*guarde buenos significativos
use "$tipo_provincia\buenos\sp_bajo_niv_educ_s1_buenos_significativo.dta", clear
foreach s of numlist  3 4 {
append using "$tipo_provincia\buenos\sp_bajo_niv_educ_s`s'_buenos_significativo.dta"
}
save "$tipo_provincia\buenos\buenos_significativo_sp_bajo_niv_educ.dta", replace

*********************************************************************************
use "$tipo_provincia\buenos\buenos_significativo_sp_alimentos.dta", clear
foreach variable in bajo_ingreso bajo_niv_educ  criminalidad densidad densidad_g informalidad jefe_hogar mujeres {
append using "$tipo_provincia\buenos\buenos_significativo_sp_`variable'.dta"
}
export excel  "$tipo_provincia\buenos\excel_buenos_significativo_sp.xlsx",  sheet(excel, replace)



cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\tipo_provincia\buenos"
!erase buenos_* 
!erase sp_*














