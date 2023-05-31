

*BAJO INGRESO 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_ingreso\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 
}


*bajo_niv_educ
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_niv_educ\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}



*DENSIDAD 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}



*DENSIDAD GEOGRAFICA 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad_g\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}




*DISTANCIA CENTRO DE SALUD
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\distancia_centro_salud\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}


*INFORMALIDAD 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\informalidad\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}





*alimentos 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\alimentos\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}




*mujeres 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\mujeres\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}



*jefe_hogar 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\jefe_hogar\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}


*criminalidad 
foreach s of numlist 1 2 3 4 {

cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\criminalidad\1%\simulacion_`s'"

foreach i in ub lb p_value alpha1_hat {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_vec_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

foreach i in sp_test {
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
import excel output_tests.xlsx,  sheet(`i'_`j') clear
rename A `i'
gen provincia=`j'
gen time=_n
gen periodo=38 if time==1
replace periodo=39 if time==2
replace periodo=40 if time==3
replace periodo=41 if time==4
replace periodo=42 if time==5
replace periodo=43 if time==6
replace periodo=44 if time==7
drop time
order provincia periodo 
save `i'_`j'.dta, replace 
}
}

*Mergeo cada variable
foreach j of numlist 1 7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
use lb_`j'.dta, replace
foreach i in ub p_value alpha1_hat sp_test {
merge 1:1 provincia periodo using `i'_`j'.dta, nogen 
}
egen sum_sp_test=sum(sp_test)
gen tabla=1 if sum_sp_test>=2 // tabla es una dummy que indica 1 si es que la provincia va en la tabla 4 dado que en 2 periodos el sp_test da 1. 
drop sum_sp_test
save provincia_`j'_test.dta, replace
}

*Hago un append de todas las provincias 
use provincia_1_test.dta, clear
foreach j of numlist  7 10 16 17 18 23 26 27 38 39 41 42 44 45 55 57 65 66 71 75 76 77 78 79 80 84 86 87 88 89 91 92 95 100 104 105 106 107 108 112 119 125 129 130 133 139 140 141 144 149 150 152 153 157 158 159 162 169 {
append using provincia_`j'_test.dta
}
save output_table_tests.dta, replace 
!erase p_value_* lb_* ub_* alpha1_hat_* sp_test_* provincia_* 

}



*=========  CREO EL EXCEL PARA LAS PROVINCIAS QUE SON SIGNIFICATIVOS EN AMBOS TEST 
global provincias_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\provincias_significativas"

*BAJO INGRESO 
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_ingreso\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2) // SOLO SI SON SIGNIFICATIVAS EN DOS O MÁS PERIODOS POS TRATAMIENTO
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="bajo_ingreso_s`s'"
order variable
save "$provincias_significativas\bajo_ingreso_s`s'.dta", replace
}


*BAJO NIVELEDUCATIVO
foreach s of numlist 1  3 4 {  // EN LA SEGUNDA SIMULACIÓN NO HAY NIGUNA SIGNIFICATIVA
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_niv_educ\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="bajo_niv_educ_s`s'"
order variable
save "$provincias_significativas\bajo_niv_educ_s`s'.dta", replace
}



*DENSIDAD (*en la simulacion 2 no hay ninguna significativa)
foreach s of numlist  1 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="densidad_s`s'"
order variable
save "$provincias_significativas\densidad_s`s'.dta", replace
}


*DENSIDAD g (*en la simulacion 2 no hay ninguna significativa)
foreach s of numlist 1  3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad_g\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="densidad_g_s`s'"
order variable
save "$provincias_significativas\densidad_g_s`s'.dta", replace
}



*DISTANCIA CENTRO DE SALUD
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\distancia_centro_salud\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="distancia_centro_salud_s`s'"
order variable
save "$provincias_significativas\distancia_centro_salud_s`s'.dta", replace
}


*INFORMALIDAD 
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\informalidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="informalidad_s`s'"
order variable
save "$provincias_significativas\informalidad_s`s'.dta", replace
}


*ALIMENTOS
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\alimentos\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="alimentos_s`s'"
order variable
save "$provincias_significativas\alimentos_s`s'.dta", replace
}



* MUJERES // en la simulacion 2 3 y 4 no hay ninguna significativa)
foreach s of numlist 1     { 
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\mujeres\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="mujeres_s`s'"
order variable
save "$provincias_significativas\mujeres_s`s'.dta", replace
}


*JEFE HOGAR
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\jefe_hogar\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="jefe_hogar_s`s'"
order variable
save "$provincias_significativas\jefe_hogar_s`s'.dta", replace
}

*CRIMINALIDAD
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\criminalidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test==1
keep provincia
xpose, clear
gen variable="criminalidad_s`s'"
order variable
save "$provincias_significativas\criminalidad_s`s'.dta", replace
}


**************************

cd "$provincias_significativas"
use alimentos_s1.dta, clear
foreach s of numlist 2/4 { 
append using alimentos_s`s'
}
foreach s of numlist 1 3 4 { 
append using bajo_niv_educ_s`s'
append using densidad_s`s'
append using densidad_g_s`s'
}


foreach var in criminalidad  jefe_hogar  informalidad distancia_centro_salud  bajo_ingreso {
foreach s of numlist 1/4 {  
append using `var'_s`s'
}
}
append using mujeres_s1
sort variable

export excel provincias_significativas.xlsx, replace 
foreach j in criminalidad  jefe_hogar mujeres informalidad distancia_centro_salud densidad_g densidad bajo_ingreso alimentos bajo_niv_educ {
!erase `j'_*
}


/*
*=========  CREO EL EXCEL PARA LAS PROVINCIAS QUE NO SON SIGNIFICATIVOS EN AMBOS TEST 
global provincias_no_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\provincias_no_significativas"

*BAJO INGRESO 
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_ingreso\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2) // SOLO SI SON SIGNIFICATIVAS EN DOS O MÁS PERIODOS POS TRATAMIENTO
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="bajo_ingreso_s`s'"
order variable
save "$provincias_no_significativas\bajo_ingreso_s`s'.dta", replace
}


*BAJO NIVELEDUCATIVO
foreach s of numlist 1 2 3 4 {  // EN LA SEGUNDA SIMULACIÓN NO HAY NIGUNA SIGNIFICATIVA
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\bajo_niv_educ\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="bajo_niv_educ_s`s'"
order variable
save "$provincias_no_significativas\bajo_niv_educ_s`s'.dta", replace
}



*DENSIDAD
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="densidad_s`s'"
order variable
save "$provincias_no_significativas\densidad_s`s'.dta", replace
}


*DENSIDAD g
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\densidad_g\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="densidad_g_s`s'"
order variable
save "$provincias_no_significativas\densidad_g_s`s'.dta", replace
}



*DISTANCIA CENTRO DE SALUD
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\distancia_centro_salud\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="distancia_centro_salud_s`s'"
order variable
save "$provincias_no_significativas\distancia_centro_salud_s`s'.dta", replace
}


*INFORMALIDAD 
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\informalidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="informalidad_s`s'"
order variable
save "$provincias_no_significativas\informalidad_s`s'.dta", replace
}


*ALIMENTOS
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\alimentos\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="alimentos_s`s'"
order variable
save "$provincias_no_significativas\alimentos_s`s'.dta", replace
}



* MUJERES
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\mujeres\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="mujeres_s`s'"
order variable
save "$provincias_no_significativas\mujeres_s`s'.dta", replace
}


*JEFE HOGAR
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\jefe_hogar\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="jefe_hogar_s`s'"
order variable
save "$provincias_no_significativas\jefe_hogar_s`s'.dta", replace
}

*CRIMINALIDAD
foreach s of numlist 1 2 3 4 {
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\criminalidad\1%\simulacion_`s'"
use output_table_tests.dta, clear 
drop tabla
gen pv_test=(lb>0 & ub>0 | lb<0 & ub<0) // DUMMY FOR test for treatment effects in Cao and Dowd 
foreach i in sp pv {
bys provincia: egen sum_`i'_test=sum(`i'_test)
}
keep provincia sum_*
duplicates drop
gen dummy_test=(sum_sp_test>=2 & sum_pv_test>=2)
keep if dummy_test!=1
keep provincia
xpose, clear
gen variable="criminalidad_s`s'"
order variable
save "$provincias_no_significativas\criminalidad_s`s'.dta", replace
}




cd "$provincias_no_significativas"
use alimentos_s1.dta, clear
foreach s of numlist 2/4 { 
append using alimentos_s`s'
}
foreach s of numlist 1 2 3 4 { 
append using bajo_niv_educ_s`s'
}
foreach var in criminalidad  jefe_hogar mujeres informalidad distancia_centro_salud densidad_g densidad bajo_ingreso {
foreach s of numlist 1/4 {  
append using `var'_s`s'
}
}

export excel provincias_no_significativas.xlsx, replace 
foreach j in criminalidad  jefe_hogar mujeres informalidad distancia_centro_salud densidad_g densidad bajo_ingreso alimentos bajo_niv_educ {
!erase `j'_*
}

*/

******** OTRA FORMA DE COLOCAR LOS SIGNIFICATIVOS DE LOS NO SIGNIFICATIVOS 

global provincias_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\provincias_significativas"
global provincias_no_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\PEAO_inf\provincias_no_significativas"
*********************************** 
** SIGNIFICATIVAS
foreach sp in alimentos criminalidad jefe_hogar informalidad distancia_centro_salud   bajo_ingreso {
foreach s of numlist 1 2 3 4 {
import excel "$provincias_significativas\provincias_significativas.xlsx",  clear
keep if A=="`sp'_s`s'"
xpose, clear
drop if missing(v1)
rename v1 provincia
gen tests=1 // si es significativo 
save "$provincias_significativas\sp_`sp'_s`s'_significativos.dta", replace  
}
}


foreach sp in bajo_niv_educ densidad densidad_g { // en bajo nivel educativo, no hay  observaciones significativas en la simulacion 2 
foreach s of numlist 1 3 4 {
import excel "$provincias_significativas\provincias_significativas.xlsx",  clear
keep if A=="`sp'_s`s'"
xpose, clear
drop if missing(v1)
rename v1 provincia
gen tests=1 // si es significativo 
save "$provincias_significativas\sp_`sp'_s`s'_significativos.dta", replace  
}
}

foreach sp in mujeres {
foreach s of numlist  1  {
import excel "$provincias_significativas\provincias_significativas.xlsx",  clear
keep if A=="`sp'_s`s'"
xpose, clear
drop if missing(v1)
rename v1 provincia
gen tests=1 // si es significativo 
save "$provincias_significativas\sp_`sp'_s`s'_significativos.dta", replace  
}
}

/*

** NO SIGNIFICATIVAS
foreach sp in  mujeres alimentos criminalidad jefe_hogar informalidad distancia_centro_salud bajo_niv_educ densidad densidad_g  bajo_ingreso {
foreach s of numlist 1 2 3 4 {
import excel "$provincias_no_significativas\provincias_no_significativas.xlsx",  clear
keep if A=="`sp'_s`s'"
xpose, clear
drop if missing(v1)
rename v1 provincia
gen tests_ns=0 // 0 si no es significativo
save "$provincias_no_significativas\sp_`sp'_s`s'_no_significativos.dta", replace  
}
}















