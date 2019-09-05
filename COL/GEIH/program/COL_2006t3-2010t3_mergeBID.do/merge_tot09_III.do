		******************************
		***BASE TOTAL NACIONAL 2009***
		******TERCER TRIMESTRE********
		******************************

/*
cd "\\sdssrv03\Surveys\Colombia\2009\GEIH\Datos" 

use IIItrimestre_cab.dta
append using IIItrimestre_res.dta

gen temp=fex_c/3
replace fex_c=round(temp,1)
drop temp
compress
saveold "\\sdssrv03\Surveys\Colombia\2009\GEIH\Datos\col09.dta", replace
*/

*Yessenia L -> Agrego el ingreso homologado
*----------------------------------------------
/*
clear
use "\\sdssrv03\Surveys\survey\COL\GEIH\2009\a\data_orig\personas 2009.dta", clear
egen idh=concat(directorio secuencia_p)
sort idh
save "\\sdssrv03\Surveys\survey\COL\GEIH\2009\a\data_orig\personas 2009.dta", replace
*/

clear
use "\\sdssrv03\Surveys\survey\COL\GEIH\2009\a\data_orig\hogares 2009.dta", clear
egen idh=concat(directorio secuencia_p)
sort idh
merge idh using "\\sdssrv03\Surveys\survey\COL\GEIH\2009\a\data_orig\personas 2009.dta"
tab _merge
drop _merge idh
egen id =concat (directorio secuencia_p orden)
sort id
destring mes, replace
keep if mes>=7 & mes<=9
keep  id nper-fex_dpto_c pet- ingtot
save "Y:\survey\COL\GEIH\2009\a\data_merge\pov_2009t3.dta", replace

clear
use "\\sdssrv03\Surveys\\survey\COL\GEIH\2009\t3\data_merge\COL_2009t3.dta", clear
cap egen id =concat (DIRECTORIO SECUENCIA_P ORDEN)
sort id
merge id using "Y:\survey\COL\GEIH\2009\a\data_merge\pov_2009t3.dta"
tab _merge
drop _merge
save "\\sdssrv03\Surveys\\survey\COL\GEIH\2009\t3\data_merge\COL_2009t3.dta", replace



