*==============================================================================*
*              GRAFICO LAS PROVINCIAS SIGNIFICATIVAS Y BUENAS                  *
*==============================================================================*
cls 
clear all
global provincias_significativas "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\provincias_significativas"
global delincuencia "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\intermedios\delincuencia"
*Alimentos - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\alimentos\1%\simulacion_1"
foreach j of numlist 18 26 84 169                      {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="alimentos"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_1.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_1.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_alimentos_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_alimentos_simulacion_1.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_1.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_1.png")
}
}


*Alimentos  - simulacion_2 (el mayor/menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\alimentos\1%\simulacion_2"
foreach j of numlist 18 26 78 80 144 169                    {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="alimentos"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_2.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_2.png")
}
if `j'==78 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Huanuco", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huanuco", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huanuco_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Huanuco") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huanuco_var_alimentos_simulacion_2.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_2.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_2.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_2.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_2.png")
}
}
*Alimentos  - simulacion_3 (los 3 mayores/menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\alimentos\1%\simulacion_3"
foreach j of numlist 18 26 79 80 144 169                    {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="alimentos"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_3.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_alimentos_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_3.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_3.png")
}
}
*Alimentos  - simulacion_4 (los 5 mayores/menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\alimentos\1%\simulacion_4"
foreach j of numlist 18 26 79 80 84 125 144 169                  {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="alimentos"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_alimentos_simulacion_4.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_alimentos_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_alimentos_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_alimentos_simulacion_4.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_alimentos_simulacion_4.png")
}
if `j'==125 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Pasco", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Pasco", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Pasco_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Pasco") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Pasco_var_alimentos_simulacion_4.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_alimentos_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_alimentos_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_alimentos_simulacion_4.png")
}
}


*#######################################################################################################################################################################

*bajo_ingreso - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_ingreso\1%\simulacion_1"
foreach j of numlist 17 26 91 169                      {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_ingreso"
drop Nombreprovincia provincia 
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_bajo_ingreso_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_bajo_ingreso_simulacion_1.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_bajo_ingreso_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_bajo_ingreso_simulacion_1.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_1.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_1.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_1.png")
}
}

*bajo_ingreso - simulacion_2 (el mayor o menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_ingreso\1%\simulacion_2"
foreach j of numlist 10 39 79 80 91 144 169                   {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_ingreso"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_2.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_ingreso_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_2.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_2.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_2.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_bajo_ingreso_simulacion_2.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_2.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_2.png")
}
}

*bajo_ingreso - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_ingreso\1%\simulacion_3"
foreach j of numlist 10 18 39 79 80 84 91 144 169                 {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_ingreso"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_3.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_bajo_ingreso_simulacion_3.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_ingreso_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_3.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_ingreso_simulacion_3.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_3.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_bajo_ingreso_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_3.png")
}
}


*bajo_ingreso - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_ingreso\1%\simulacion_4"
foreach j of numlist 10 17 18 78 79 80 84 91 100 150 169               {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_ingreso"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_ingreso_simulacion_4.png")
}
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_bajo_ingreso_simulacion_4.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_bajo_ingreso_simulacion_4.png")
}
if `j'==78 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Huanuco", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huanuco", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huanuco_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Huanuco") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huanuco_var_bajo_ingreso_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_ingreso_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_ingreso_simulacion_4.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_ingreso_simulacion_4.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_ingreso_simulacion_4.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_bajo_ingreso_simulacion_4.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_bajo_ingreso_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_ingreso_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_ingreso_simulacion_4.png")
}
}


*##############################################################################################################################################

*bajo_niv_educ - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_1"
foreach j of numlist 26 84 91 100 125 169                    {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_niv_educ"
drop Nombreprovincia provincia 
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_bajo_niv_educ_simulacion_1.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_1.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_1.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_bajo_niv_educ_simulacion_1.png")
}
if `j'==125 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Pasco", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Pasco", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Pasco_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Pasco") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Pasco_var_bajo_niv_educ_simulacion_1.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_1.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_1.png")
}
}

*bajo_niv_educ - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_3"
foreach j of numlist 10 39 79 80 84 91 169                   {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_niv_educ"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_3.png")
}
}

*bajo_niv_educ - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\bajo_niv_educ\1%\simulacion_4"
foreach j of numlist 10 39 79 80 84 91 169                   {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="bajo_niv_educ"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_bajo_niv_educ_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_bajo_niv_educ_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_bajo_niv_educ_simulacion_4.png")
}
}


*#==============================================================================================================================

*criminalidad - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\criminalidad\1%\simulacion_1"
foreach j of numlist 76                         {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="criminalidad"
drop Nombreprovincia provincia 
if `j'==76 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_1.xlsx", firstrow(variables) sheet("Huancayo", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huancayo", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huancayo_var_criminalidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_1.xlsx", sheet("Huancayo") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huancayo_var_criminalidad_simulacion_1.png")
}
}


*criminalidad - simulacion_2 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\criminalidad\1%\simulacion_2"
foreach j of numlist 18 79                        {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="criminalidad"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_2.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_criminalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_2.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_criminalidad_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_criminalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_criminalidad_simulacion_2.png")
}
}

*criminalidad - simulacion_3 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\criminalidad\1%\simulacion_3"
foreach j of numlist 18 79                        {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="criminalidad"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_3.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_criminalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_3.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_criminalidad_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_criminalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_criminalidad_simulacion_3.png")
}
}

*criminalidad - simulacion_4 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\criminalidad\1%\simulacion_4"
foreach j of numlist 17 76 169                       {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="criminalidad"
drop Nombreprovincia provincia 
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_criminalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_criminalidad_simulacion_4.png")
}
if `j'==76 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", firstrow(variables) sheet("Huancayo", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huancayo", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huancayo_var_criminalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", sheet("Huancayo") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huancayo_var_criminalidad_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_criminalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_criminalidad_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_criminalidad_simulacion_4.png")
}
}


*###################################################################################################################################
*densidad - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad\1%\simulacion_1"
foreach j of numlist 18 26 80 84 144 169                    {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_1.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_densidad_simulacion_1.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_1.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_densidad_simulacion_1.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_1.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_1.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_1.png")
}
}


*densidad - simulacion_2 (el mayor o menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad\1%\simulacion_2"
foreach j of numlist 10 18 39 79 80 91 100 150 169                 {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_2.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_2.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_2.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_2.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_simulacion_2.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_densidad_simulacion_2.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_densidad_simulacion_2.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_2.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_2.png")
}
}

*densidad - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad\1%\simulacion_3"
foreach j of numlist 10 18 39 79 80 144 169                   {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_3.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_3.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_3.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_3.png")
}
}

*densidad - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad\1%\simulacion_4"
foreach j of numlist 10 18 39 79 80 144 169                   {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_simulacion_4.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_simulacion_4.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_simulacion_4.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_simulacion_4.png")
}
}


*####################################################################################################
*densidad_g - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad_g\1%\simulacion_1"
foreach j of numlist 79                         {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad_g"
drop Nombreprovincia provincia 
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_1.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_g_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_1.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_g_simulacion_1.png")
}
}

*densidad_g - simulacion_2 (el mayor o menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad_g\1%\simulacion_2"
foreach j of numlist 18 39 79 91 150                     {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad_g"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_g_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_g_simulacion_2.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_g_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_densidad_g_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_g_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_densidad_g_simulacion_2.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_g_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_g_simulacion_2.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_densidad_g_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_2.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_densidad_g_simulacion_2.png")
}
}

*densidad_g - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad_g\1%\simulacion_3"
foreach j of numlist 10 80 91 100 144 169                    {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad_g"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_g_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_g_simulacion_3.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_densidad_g_simulacion_3.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_densidad_g_simulacion_3.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_densidad_g_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_g_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_g_simulacion_3.png")
}
}

*densidad_g - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\densidad_g\1%\simulacion_4"
foreach j of numlist 10 18 80 133 169                     {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="densidad_g"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_g_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_densidad_g_simulacion_4.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_g_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_densidad_g_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_g_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_densidad_g_simulacion_4.png")
}
if `j'==133 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", firstrow(variables) sheet("Puno", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Puno", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Puno_var_densidad_g_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", sheet("Puno") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Puno_var_densidad_g_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_g_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_densidad_g_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_densidad_g_simulacion_4.png")
}
}


*##############################################################################################################################

*informalidad - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\informalidad\1%\simulacion_1"
foreach j of numlist 17 39 91 150                      {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="informalidad"
drop Nombreprovincia provincia 
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_informalidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_informalidad_simulacion_1.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_1.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_1.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_informalidad_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_1.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_informalidad_simulacion_1.png")
}
}

*informalidad - simulacion_2 (el mayor o menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\informalidad\1%\simulacion_2"
foreach j of numlist 10 39 79 80 91 144 169                   {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="informalidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_2.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_2.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_2.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_2.png")
}
if `j'==144 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Santa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Santa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Santa_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Santa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Santa_var_informalidad_simulacion_2.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_2.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_2.png")
}
}

*informalidad - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\informalidad\1%\simulacion_3"
foreach j of numlist 10 39 79 80 84 91 169                   {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="informalidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_3.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_informalidad_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_3.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_informalidad_simulacion_3.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_3.png")
}
}

*informalidad - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\informalidad\1%\simulacion_4"
foreach j of numlist 10 17 79 80 84 91 100 150 169                 {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="informalidad"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_informalidad_simulacion_4.png")
}
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_informalidad_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_informalidad_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_informalidad_simulacion_4.png")
}
if `j'==84 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Huaura", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaura", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaura_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Huaura") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaura_var_informalidad_simulacion_4.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_informalidad_simulacion_4.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_informalidad_simulacion_4.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_informalidad_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_informalidad_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_informalidad_simulacion_4.png")
}
}

*#######################################################################################

*jefe_hogar - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\jefe_hogar\1%\simulacion_1"
foreach j of numlist 17 26 80 150                      {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="jefe_hogar"
drop Nombreprovincia provincia 
if `j'==17 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", firstrow(variables) sheet("Barranca", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Barranca", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Barranca_var_jefe_hogar_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", sheet("Barranca") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Barranca_var_jefe_hogar_simulacion_1.png")
}
if `j'==26 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", firstrow(variables) sheet("Callao", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Callao", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Callao_var_jefe_hogar_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", sheet("Callao") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Callao_var_jefe_hogar_simulacion_1.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_1.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_1.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_1.png")
}
}

*jefe_hogar - simulacion_2 (el mayor o menor)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\jefe_hogar\1%\simulacion_2"
foreach j of numlist 10 18 39 78 79 80 91 100 150 169                {
import excel output_simulacion_2.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="jefe_hogar"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_jefe_hogar_simulacion_2.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_2.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_2.png")
}
if `j'==78 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Huanuco", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huanuco", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huanuco_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Huanuco") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huanuco_var_jefe_hogar_simulacion_2.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_2.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_2.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_2.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_2.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_2.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_2.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_2.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_2.png")
}
}

*jefe_hogar - simulacion_3 (3 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\jefe_hogar\1%\simulacion_3"
foreach j of numlist 10 18 39 79 80 91 100 150 169                 {
import excel output_simulacion_3.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="jefe_hogar"
drop Nombreprovincia provincia 
if `j'==10 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Arequipa", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Arequipa", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Arequipa_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Arequipa") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Arequipa_var_jefe_hogar_simulacion_3.png")
}
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_3.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_3.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_3.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_3.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_3.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_3.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_3.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_3.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_3.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_3.png")
}
}

*jefe_hogar - simulacion_4 (5 mayores o menores)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\jefe_hogar\1%\simulacion_4"
foreach j of numlist 18 39 79 80 91 100 150 169                  {
import excel output_simulacion_4.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="jefe_hogar"
drop Nombreprovincia provincia 
if `j'==18 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Bellavista", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Bellavista", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Bellavista") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Bellavista_var_jefe_hogar_simulacion_4.png")
}
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_jefe_hogar_simulacion_4.png")
}
if `j'==79 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Huaral", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaral", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Huaral") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaral_var_jefe_hogar_simulacion_4.png")
}
if `j'==80 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Huaraz", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Huaraz", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Huaraz") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Huaraz_var_jefe_hogar_simulacion_4.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_jefe_hogar_simulacion_4.png")
}
if `j'==100 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Lima", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Lima", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Lima") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Lima_var_jefe_hogar_simulacion_4.png")
}
if `j'==150 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Tacna", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Tacna", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Tacna") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Tacna_var_jefe_hogar_simulacion_4.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_4.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_jefe_hogar_simulacion_4.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_jefe_hogar_simulacion_4.png")
}
}


*#########################################################################################
*mujeres - simulacion_1 (promedio)
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\mujeres\1%\simulacion_1"
foreach j of numlist 39 91 169                       {
import excel output_simulacion_1.xlsx, firstrow sheet(`j') clear
gen alpha_hat=observado-synthetic_control_spillover
gen provincia=`j'
merge m:1  provincia using "$delincuencia\delincuencia.dta", keep(3) nogen
gen spillover="mujeres"
drop Nombreprovincia provincia 
if `j'==39 {
export excel "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", firstrow(variables) sheet("Cañete", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Cañete", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Cañete_var_mujeres_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", sheet("Cañete") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Cañete_var_mujeres_simulacion_1.png")
}
if `j'==91 {
export excel "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", firstrow(variables) sheet("Jorge Basadre", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Jorge Basadre", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_mujeres_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", sheet("Jorge Basadre") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Jorge Basadre_var_mujeres_simulacion_1.png")
}
if `j'==169 {
export excel "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", firstrow(variables) sheet("Zarumilla", replace) keepcellfmt
graph twoway (scatter observado periodo, connect(direct) msymbol(diamond) msize(small) mcolor(black)) ///
(line synthetic_control periodo, connect(direct) lcolor(red)) (line synthetic_control_spillover periodo, connect(direct) lcolor(green)) , xtitle("Periodo", size(*0.7)) xlabel(1(1)44, /// 
nogrid labsize(*0.6)) xline(37, lcolor(ltblue) ) ylabel(,nogrid) ytitle("Pobreza Estandarizada", size(*0.7)) title("Pobreza de la Provincia Zarumilla", size(10pt)) graphregion(color(white)) legend(label(1 "Observado") label(2 "SCM") label(3 "SCM Spillover"))
graph export "$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_mujeres_simulacion_1.png", as (png) replace
putexcel set "$provincias_significativas\buenos\output_buenos_mujeres_simulacion_1.xlsx", sheet("Zarumilla") modify
putexcel P1=picture("$provincias_significativas\graficos\buenos\provincia_Zarumilla_var_mujeres_simulacion_1.png")
}
}
