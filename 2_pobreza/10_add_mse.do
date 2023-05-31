* Ver cuales son buenos significativos y creo graficos
cls 
clear all
cd "G:\Mi unidad\1. PROYECTOS TELLO 2022\SCM SPILL OVERS\outputs\pobreza\provincias_significativas\buenos"

*Alimentos S1
foreach j in Bellavista Callao Huaura Zarumilla       {
import excel output_buenos_alimentos_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_alimentos_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*alimentos simulacion_2
foreach j in Bellavista Callao Huanuco Huaraz Santa Zarumilla     {
import excel output_buenos_alimentos_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_alimentos_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*alimentos simulacion_3
foreach j in Bellavista Callao Huaral Huaraz Santa Zarumilla     {
import excel output_buenos_alimentos_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_alimentos_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*alimentos simulacion_4
foreach j in Bellavista Callao Huaral Huaraz Huaura Pasco Santa Zarumilla   {
import excel output_buenos_alimentos_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_alimentos_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*bajo_ingreso simulacion_1
foreach j in Barranca Callao JorgeBasadre Zarumilla       {
import excel output_buenos_bajo_ingreso_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_ingreso_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*bajo_ingreso simulacion_2
foreach j in Arequipa Cañete Huaral Huaraz JorgeBasadre Santa Zarumilla    {
import excel output_buenos_bajo_ingreso_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_ingreso_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*bajo_ingreso simulacion_3
foreach j in Arequipa Bellavista Cañete Huaral Huaraz Huaura JorgeBasadre Santa Zarumilla  {
import excel output_buenos_bajo_ingreso_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_ingreso_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*bajo_ingreso simulacion_4
foreach j in Arequipa Barranca Bellavista Huanuco Huaral Huaraz Huaura JorgeBasadre Lima Tacna {
import excel output_buenos_bajo_ingreso_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_ingreso_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*bajo_niv_educ simulacion_1
foreach j in Callao Huaura JorgeBasadre Lima Pasco Zarumilla     {
import excel output_buenos_bajo_niv_educ_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_niv_educ_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*bajo_niv_educ simulacion_3
foreach j in Arequipa Cañete Huaral Huaraz Huaura JorgeBasadre Zarumilla    {
import excel output_buenos_bajo_niv_educ_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_niv_educ_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*bajo_niv_educ simulacion_4
foreach j in Arequipa Cañete Huaral Huaraz Huaura JorgeBasadre Zarumilla    {
import excel output_buenos_bajo_niv_educ_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_bajo_niv_educ_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*criminalidad simulacion_1
foreach j in Huancayo          {
import excel output_buenos_criminalidad_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_criminalidad_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*criminalidad simulacion_2
foreach j in Bellavista Huaral         {
import excel output_buenos_criminalidad_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_criminalidad_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*criminalidad simulacion_3
foreach j in Bellavista Huaral         {
import excel output_buenos_criminalidad_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_criminalidad_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*criminalidad simulacion_4
foreach j in Barranca Huancayo Zarumilla        {
import excel output_buenos_criminalidad_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_criminalidad_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad simulacion_1
foreach j in Bellavista Callao Huaraz Huaura Santa Zarumilla     {
import excel output_buenos_densidad_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad simulacion_2
foreach j in Arequipa Bellavista Cañete Huaral Huaraz JorgeBasadre Lima Tacna Zarumilla  {
import excel output_buenos_densidad_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad simulacion_3
foreach j in Arequipa Bellavista Cañete Huaral Huaraz Santa Zarumilla    {
import excel output_buenos_densidad_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*densidad simulacion_4
foreach j in Arequipa Bellavista Cañete Huaral Huaraz Santa Zarumilla    {
import excel output_buenos_densidad_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad_g simulacion_1
foreach j in Huaral          {
import excel output_buenos_densidad_g_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_g_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad_g simulacion_2
foreach j in Bellavista Cañete Huaral JorgeBasadre Tacna      {
import excel output_buenos_densidad_g_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_g_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*densidad_g simulacion_3
foreach j in Arequipa Huaraz JorgeBasadre Lima Santa Zarumilla     {
import excel output_buenos_densidad_g_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_g_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*densidad_g simulacion_4
foreach j in Arequipa Bellavista Huaraz Puno Zarumilla      {
import excel output_buenos_densidad_g_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_densidad_g_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}



*informalidad simulacion_1
foreach j in Barranca Cañete JorgeBasadre Tacna       {
import excel output_buenos_informalidad_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_informalidad_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*informalidad simulacion_2
foreach j in Arequipa Cañete Huaral Huaraz JorgeBasadre Santa Zarumilla    {
import excel output_buenos_informalidad_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_informalidad_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*informalidad simulacion_3
foreach j in Arequipa Cañete Huaral Huaraz Huaura JorgeBasadre Zarumilla    {
import excel output_buenos_informalidad_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_informalidad_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}

*informalidad simulacion_4
foreach j in Arequipa Barranca Huaral Huaraz Huaura JorgeBasadre Lima Tacna Zarumilla  {
import excel output_buenos_informalidad_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_informalidad_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*jefe_hogar simulacion_1
foreach j in Barranca Callao Huaraz Tacna       {
import excel output_buenos_jefe_hogar_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_jefe_hogar_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*jefe_hogar simulacion_2
foreach j in Arequipa Bellavista Cañete Huanuco Huaral Huaraz JorgeBasadre Lima Tacna Zarumilla {
import excel output_buenos_jefe_hogar_simulacion_2.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_jefe_hogar_simulacion_2.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*jefe_hogar simulacion_3
foreach j in Arequipa Bellavista Cañete Huaral Huaraz JorgeBasadre Lima Tacna Zarumilla  {
import excel output_buenos_jefe_hogar_simulacion_3.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_jefe_hogar_simulacion_3.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*jefe_hogar simulacion_4
foreach j in Bellavista Cañete Huaral Huaraz JorgeBasadre Lima Tacna Zarumilla   {
import excel output_buenos_jefe_hogar_simulacion_4.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_jefe_hogar_simulacion_4.xlsx, firstrow(variables) sheet("`j'", replace) 
}


*mujeres simulacion_1
foreach j in Cañete JorgeBasadre Zarumilla        {
import excel output_buenos_mujeres_simulacion_1.xlsx, firstrow sheet("`j'") clear
gen t=(observado-synthetic_control_spillover)^2 
egen sum=sum(t) 
gen mse=sum/44  // mse
egen sum_pre=sum(t) if periodo<38
egen sum_pos=sum(t) if periodo>=38
gen mse_pre_t=sum_pre/37
gen mse_pos_t=sum_pos/7
egen mse_pre=mean(mse_pre_t) // mse pre 
egen mse_pos=mean(mse_pos_t) // mse pos 
drop mse_pre_t mse_pos_t sum_* t
gen pobreza_t1_t=observado if periodo==37	
egen pobreza_t1=mean(pobreza_t1_t)
gen mse_pos_por=(mse_pos/pobreza_t1)*100
drop pobreza_t1_t
gen sp_covid_var=(synthetic_control_spillover-pobreza_t1/pobreza_t1)*100
export excel output_buenos_mujeres_simulacion_1.xlsx, firstrow(variables) sheet("`j'", replace) 
}










