cd D:\CAO
import excel owid-covid-data.xlsx, firstrow clear

gen location2=location
replace location2="Union Europea" if location=="Austria" | location=="Belgium" | location=="Bulgaria" | location=="Croatia" | location=="Cyprus" | location=="Czechia" | location=="Denmark" | location=="Estonia" | location=="Finland" | location=="France" | location=="Germany" | location=="Greece" | location=="Hungary" | location=="Ireland" | location=="Italy" | location=="Latvia" | location=="Lithuania" | location=="Luxembourg" | location=="Malta" | location=="Netherlands" | location=="Poland" | location=="Portugal" | location=="Romania" | location=="Slovakia" | location=="Slovenia" | location=="Spain" | location=="Sweden" 
order iso_* continent location location2
keep if date=="2021-12-31"
bys location2: egen total_deaths_l2=sum(total_deaths)
bys location2: egen total_cases_l2=sum(total_cases)
bys location2: egen populationl2=sum(population)



gen total_cases_per_million_l2=total_cases_l2/populationl2 *1000000
gen total_deaths_per_million_l2=total_deaths_l2/populationl2 *1000000
duplicates drop location2, force
gsort -total_deaths_per_million_l2
gen rank_death=_n
gsort -total_cases_per_million_l2
gen rank_cases=_n




keep if location=="Austria" | location=="Belgium" | location=="Bulgaria" | location=="Croatia" | location=="Cyprus" | location=="Czechia" | location=="Denmark" | location=="Estonia" | location=="Finland" | location=="France" | location=="Germany" | location=="Greece" | location=="Hungary" | location=="Ireland" | location=="Italy" | location=="Latvia" | location=="Lithuania" | location=="Luxembourg" | location=="Malta" | location=="Netherlands" | location=="Poland" | location=="Portugal" | location=="Romania" | location=="Slovakia" | location=="Slovenia" | location=="Spain" | location=="Sweden" | location=="Peru" | location=="China" | location=="United States" | location=="Chile" | location=="Brazil" | location=="Mexico" | location=="Argentina" 
duplicates drop location2, force
keep location2 total_cases_per_million_l2 total_deaths_per_million_l2 rank_cases rank_death