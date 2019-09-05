* (versi�n Stata 13)
clear
set more off
*________________________________________________________________________________________________________________*

 * Activar si es necesario (dejar desactivado para evitar sobreescribir la base y dejar la posibilidad de 
 * utilizar un loop)
 * Los datos se obtienen de las carpetas que se encuentran en el servidor: \\Sdssrv03\surveys
 * Se tiene acceso al servidor �nicamente al interior del BID.
 * El servidor contiene las bases de datos MECOvI.
 *________________________________________________________________________________________________________________*
 

global ruta = "\\Sdssrv03\surveys"

local PAIS BRA
local ENCUESTA PNAD
local ANO "2003"
local ronda m9 
local log_file = "$ruta\harmonized\\`PAIS'\\`ENCUESTA'\log\\`PAIS'_`ANO'`ronda'_variablesBID.log"
local base_in  = "$ruta\survey\\`PAIS'\\`ENCUESTA'\\`ANO'\\`ronda'\data_merge\\`PAIS'_`ANO'`ronda'.dta"
local base_out = "$ruta\harmonized\\`PAIS'\\`ENCUESTA'\data_arm\\`PAIS'_`ANO'`ronda'_BID.dta"
                        
capture log close
log using "`log_file'", replace 


/***************************************************************************
                 BASES DE DATOS DE ENCUESTA DE HOGARES - SOCIOMETRO 
Pa�s: Brasil
Encuesta: PNAD
Round: m9
Autores: 
Generaci�n nuevas variables LMK: Yessenia Loayza (desloay@hotmail.com)
Modificaci�n 2014: Mayra S�enz - Email: mayras@iadb.org - saenzmayra.a@gmail.com
versi�n 2010: Yanira Oviedo
�ltima versi�n: Yessenia Loayza - Email: desloay@hotmail.com | yessenial@iadb.org
�ltima modificaci�n: Daniela Zuluaga E-mail: danielazu@iadb.org, da.zuluaga@hotmail.com
Fecha �ltima modificaci�n: Octubre de 2017

							SCL/LMK - IADB
****************************************************************************/
****************************************************************************/
*Nota: Bases de datos con nuevos pesos (descargadas el 30 septiembre 2013)

use `base_in', clear

*****************
*** region_ci ***
*****************
*YL: generacion "region_c" proyecto maps America.	
destring uf, replace	
gen region_c = uf
label define region_c ///
11 "Rond�nia" ///
12 "Acre" ///
13 "Amazonas" ///
14 "Roraima" ///
15 "Par�" ///
16 "Amap�" ///
17 "Tocantins" ///
21 "Maranh�o" ///
22 "Piau�" ///
23 "Cear�" ///
24 "Rio Grande do Norte" ///
25 "Para�ba" ///
26 "Pernambuco" ///
27 "Alagoas" ///
28 "Sergipe" ///
29 "Bahia" ///
31 "Minas Gerais" ///
32 "Esp�rito Santo" ///
33 "Rio de Janeiro" ///
35 "S�o Paulo" ///
41 "Paran�" ///
42 "Santa Catarina" ///
43 "Rio Grande do Sul" ///
50 "Mato Grosso do Sul" ///
51 "Mato Grosso" ///
52 "Goi�s" ///
53 "Distrito Federal"
label value region_c region_c

************************
*** region seg�n BID ***
************************
gen region_BID_c=4 
label var region_BID_c "Regiones BID"
label define region_BID_c 1 "Centroam�rica_(CID)" 2 "Caribe_(CCB)" 3 "Andinos_(CAN)" 4 "Cono_Sur_(CSC)"
label value region_BID_c region_BID_c

/********************************/
/*    vARIABLES DEL HOGAR	*/
/********************************/

***************
****idh_ch*****
***************
sort uf v0102 v0103 v0403
egen idh_ch=group(uf v0102 v0103 v0403)
label variable idh_ch "ID del hogar"

gen idp_ci=v0301
gen factor_ch=v4611
gen zona_c=1 if v4728>=1 & v4728<=3
replace zona_c=0 if v4728>=4 & v4728<=8
gen str3 pais_c="BRA"
gen anio_c=2003
gen mes_c=9
gen relacion_ci=v0402
replace relacion_ci=5 if v0402==5|v0402==6|v0402==8
replace relacion_ci=6 if v0402==7
label define relacion_ci 1 "Jefe" 2 "Conyuge" 3 "Hijo" 4 "Otros Parientes" 5 "Otros no Parientes" 6 "Servicio Domestico"
label values relacion_ci relacion_ci

/************************************************************************/
/*			vARIABLES DE INFRAESTRUCTURA DEL HOGAR		*/
/************************************************************************/	
gen aguared_ch=(v0212==2 | v0213==1)
gen aguadist_ch=1 if v0211==1 |v0213==1
replace aguadist_ch=2 if v0214==2
replace aguadist_ch=3 if v0214==4
replace aguadist_ch=0 if v0214==9 
gen aguamala_ch=(v0212==6) /*"Otra"*/	
gen aguamide_ch=.
gen luz_ch=(v0219==1)
replace luz_ch=. if v0219==9
gen luzmide_ch=.
gen combust_ch=(v0223==1|v0223==2|v0223==5)
replace combust_ch=. if v0223==9
gen bano_ch=(v0215==1)
replace bano_ch=. if v0215==9
gen banoex_ch=(v0216==2)
replace banoex_ch=. if bano_ch==0 | bano_ch==.|v0216==9
gen des1_ch=1 if v0217>=1 & v0217<=3
replace des1_ch=2 if v0217==4
replace des1_ch=3 if v0217>=5
replace des1_ch=0 if bano_ch==0
replace des1_ch=. if v0217==9

*************
***des2_ch***
*************
*El indicador deber�a ser una reclasificaci�n de des1_ch, por ello se cambia aqu�: 
gen des2_ch=0 if des1_ch==0
replace des2_ch=1 if des1_ch==1 | des1_ch==2 
replace des2_ch=2 if des1_ch==3
label var des2_ch "Tipo de desague sin incluir definici�n MDG"
label def des2_ch 0"No tiene servicio sanitario" 1"Conectado a red general, c�mara s�ptica, pozo o letrina"
label def des2_ch 2"Cualquier otro caso", add
label val des2_ch des2_ch

gen piso_ch=.

**************
***pared_ch***
**************
* Se cambia la construcci�n de la variable incluyendo: tapia sin revestir y de paja 
/*
gen pared_ch=0
replace pared_ch=1 if v0203==1 | v0203==2 |v0203==4
replace pared_ch=2 if v0203==6 | v0203==3 |v0203==5
replace pared_ch=. if v0203==9
label var pared_ch "Materiales de construcci�n de las paredes"
label def pared_ch 0"No permanentes" 1"Permanentes" 2"Otros materiales:otros"
label val pared_ch pared_ch
*/
* MGR Jul, 2015: se modifica sint�xis para incluir opci�n 5 (paja) como material impermanente
gen pared_ch=0 if v0203==5 
replace pared_ch=1 if v0203==1 | v0203==2 |v0203==4
replace pared_ch=2 if v0203==6 | v0203==3 
replace pared_ch=. if v0203==9
label var pared_ch "Materiales de construcci�n de las paredes"
label def pared_ch 0"No permanentes" 1"Permanentes" 2"Otros materiales:otros"
label val pared_ch pared_ch

**************
***techo_ch***
**************
/*
*No se inclu�an los techos de paja
gen techo_ch=0
replace techo_ch=1 if v0204<=5
replace techo_ch=2 if v0204==7 |v0204==6
replace techo_ch=. if v0204==9
label var techo_ch "Materiales de construcci�n del techo"
*/
* MGR Jul, 2015: se modifica sint�xis para incluir opci�n 6 (paja) como material impermanente
gen techo_ch=0 if v0204==6
replace techo_ch=1 if v0204<=5
replace techo_ch=2 if v0204==7
replace techo_ch=. if v0204==9
label var techo_ch "Materiales de construcci�n del techo"

gen resid_ch=0 if v0218==1 | v0218==2
replace resid_ch=1 if v0218==3
replace resid_ch=2 if v0218==4 | v0218==5
replace resid_ch=3 if v0218==6
replace resid_ch=. if v0218==9

**Daniela Zuluaga- Enero 2018: Se agregan las variables aguamejorada_ch y banomejorado_ch cuya sintaxis fue elaborada por Mayra Saenz**
	
*********************
***aguamejorada_ch***
*********************
gen aguamejorada_ch = 1 if v0212 == 2 | v0212 ==4
replace aguamejorada_ch = 0 if v0212 == 6
				
*********************
***banomejorado_ch***
*********************
gen banomejorado_ch = 1 if (v0215 == 1 & (v0217 >= 1 & v0217 <=3) & v0216 == 2 )
replace banomejorado_ch = 0 if (v0215 == 1 & (v0217 >= 1 & v0217 <=3) & v0216 == 4) | v0215 == 3 | (v0215 == 1 & (v0217 >= 4 & v0217<=7))

gen dorm_ch=v0206
replace dorm_ch=. if v0206==99 |v0206==-1
gen cuartos_ch=v0205
replace cuartos_ch=. if v0205==99 | v0205==-1
gen cocina_ch=.
gen refrig_ch=(v0228==2 |v0228==4)
replace refrig_ch=. if v0228==9
gen freez_ch=(v0229==1)
replace freez_ch=. if v0229==9
gen auto_ch=.
gen telef_ch=(v2020==2)
replace telef_ch=. if v2020==9
capture gen compu_ch=(v0231==1)
capture gen internet_ch=(v0232==2)
gen cel_ch=(v0220==2)
gen viv1_ch=1 if v0202==2
replace viv1_ch=2 if v0202==4
replace viv1_ch=3 if v0202==6
gen viv2_ch=(viv1_ch==1 | viv1_ch==2)
replace viv2_ch=. if viv1_ch==.
gen viviprop_ch=0 if v0207==3
replace viviprop_ch=1 if v0207==1
replace viviprop_ch=2 if v0207==2
replace viviprop_ch=4 if v0207>=4
replace viviprop_ch=. if v0207==9
gen vivialq_ch=v0208
replace vivialq_ch=. if vivialq_ch>=999999999 | vivialq_ch<0
gen vivialqimp_ch=.

/************************************************************************/
/*				vARIABLES DEMOGRAFICAS			*/
/************************************************************************/
****************
***miembros_ci***
****************
gen miembros_ci=(relacion_ci<5)
label variable miembros_ci "Miembro del hogar"

*************************
*** VARIABLES DE RAZA ***
*************************

* MGR Oct. 2015: modificaciones realizadas en base a metodolog�a enviada por SCL/GDI Maria Olga Pe�a

/*COR OU RACA v0404
2 BRANCA
4 PRETA
6 AMARELA
8 PARDA
0 INDIGENA
9 IGNORADA*/

gen raza_ci=.
replace raza_ci= 1 if  (v0404 ==0)
replace raza_ci= 2 if  (v0404 ==4 | v0404 ==8)
replace raza_ci= 3 if (v0404==2 | v0404==6 | v0404== 9)& raza_ci==.
label define raza_ci 1 "Ind�gena" 2 "Afro-descendiente" 3 "Otros"
label value raza_ci raza_ci 
label value raza_ci raza_ci
label var raza_ci "Raza o etnia del individuo" 

gen raza_idioma_ci=.

gen id_ind_ci = 0
replace id_ind_ci=1 if raza_ci==1
label define id_ind_ci 1 "Ind�gena" 0 "Otros" 
label value id_ind_ci id_ind_ci 
label var id_ind_ci  "Indigena" 

gen id_afro_ci = 0
replace id_afro_ci=1 if raza_ci==2
label define id_afro_ci 1 "Afro-descendiente" 0 "Otros" 
label value id_afro_ci id_afro_ci 
label var id_afro_ci "Afro-descendiente" 

gen factor_ci=v4611 /*AUN CUANDO HAY UN FACTOR DE PERSONAS ES IDENTICO AL DE HOGARES, EXCEPTO PARA EL '93 EN DONDE SE REGISTRAN vALORES NEGATIvOS! PARA HOMOGENEIZAR,A TODOS LES PONEMOS EL FACTOR DE EXPANSION DEL HOGAR*/
gen sexo_ci=1 if v0302==2
replace sexo_ci=2 if v0302==4
gen edad_ci=v8005
replace edad_ci=. if edad_ci==999
gen civil_ci=.
capture replace civil_ci=1 if v1001==3 & v1003==3 /*EN ALGUNOS A�OS NO ESTA EL MODULO DE NUPCIALIDAD!*/
capture replace civil_ci=2 if v1001==1
capture replace civil_ci=3 if v1004==2
capture replace civil_ci=4 if v1004==4
gen jefe_ci=(v0402==1)
sort idh_ch
by idh_ch: egen byte nconyuges_ch=sum(relacion_ci==2) 
by idh_ch: egen byte nhijos_ch=sum(relacion_ci==3)
by idh_ch: egen byte notropari_ch=sum(relacion_ci==4)
by idh_ch: egen byte notronopari_ch=sum(relacion_ci==5)
by idh_ch: egen byte nempdom_ch=sum(relacion_ci==6)
gen byte clasehog_ch=0
replace clasehog_ch=1 if nhijos_ch==0 & nconyuges_ch==0 & notropari_ch==0 & notronopari_ch==0 /*Unipersonal*/
replace clasehog_ch=2 if nhijos_ch>0 & notropari_ch==0 & notronopari_ch==0 /*Nuclear (child with or without spouse but without other relatives)*/
replace clasehog_ch=2 if nhijos_ch==0 & nconyuges_ch>0 & notropari_ch==0 & notronopari_ch==0 /*Nuclear (spouse with or without children but without other relatives)*/
replace clasehog_ch=3 if notropari_ch>0 & notronopari_ch==0 /*Ampliado*/
replace clasehog_ch=4 if ((nconyuges_ch>0 | nhijos_ch>0 | notropari_ch>0) & (notronopari_ch>0))/*Compuesto (some relatives plus non relative)*/
replace clasehog_ch=5 if nhijos_ch==0 & nconyuges_ch==0 & notropari_ch==0 & notronopari_ch>0 /*Corresidente*/
sort idh_ch
by idh_ch:egen byte nmiembros_ch=sum(relacion_ci>0 & relacion_ci<5) if miembros_ci==1
by idh_ch:egen byte nmayor21_ch=sum((relacion_ci>0 & relacion_ci<5) & (edad_ci>=21 & edad_ci<=98))
by idh_ch:egen byte nmenor21_ch=sum((relacion_ci>0 & relacion_ci<5) & (edad_ci<21))
by idh_ch:egen byte nmayor65_ch=sum((relacion_ci>0 & relacion_ci<5) & (edad_ci>=65))
by idh_ch:egen byte nmenor6_ch=sum((relacion_ci>0 & relacion_ci<5) & (edad_ci<6))
by idh_ch:egen byte nmenor1_ch=sum((relacion_ci>0 & relacion_ci<5) & (edad_ci<1))

/******************************************************************************/
/*				vARIABLES DE DEMANDA LABORAL		      */
/******************************************************************************/

/************************************************************************************************************************/


****************
****condocup_ci*
****************
gen condocup_ci=.
replace condocup_ci=1 if (v9001==1 | v9002==2 | v9003==1 | v9004==2)
replace condocup_ci=2 if  v9004==4 & (v9115==1 & (v9119>=1 & v9119<=8)) /*tomaron alguna providencia en la semana de referencia*/
replace condocup_ci=3 if  condocup_ci!=1 & condocup_ci!=2
replace condocup_ci=4 if edad_ci<10
label define condocup_ci 1"ocupados" 2"desocupados" 3"inactivos" 4"menor 10 a�os"
label value condocup_ci condocup_ci
label var condocup_ci "Condicion de ocupacion utilizando definicion del pais"

/*
Definiciones:
* Popula��o ocupada: Aquelas pessoas que, num determinado per�odo de refer�ncia,
trabalharam ou tinham trabalho mas n�o trabalharam (por exemplo, pessoas em f�rias).

* Popula��o Desocupada: aquelas pessoas que n�o tinham trababalho, num determinado 
per�odo de refer�ncia, mas estavam dispostas a trabalhar, e que, para isso, tomaram
alguma provid�ncia efetiva (consultando pessoas, jornais, etc.).

Popula��o N�o Economicamente Ativa: pessoas n�o classificadas como ocupadas ou 
desocupadas

PET: >=10 a�os de edad
*/

****************
*afiliado_ci****
****************

gen afiliado_ci=.
label var afiliado_ci "Afiliado a la Seguridad Social"

****************
*cotizando_ci***
****************
gen cotizando_ci=0     if condocup_ci==1 | condocup_ci==2 
replace cotizando_ci=1 if (v9059==1 | v9099==1 | v9103==1 | v9120==2) & cotizando_ci==0 /*solo a emplead@s y asalariad@s, difiere con los otros paises*/
label var cotizando_ci "Cotizante a la Seguridad Social"

gen cotizapri_ci=0     if condocup_ci==1 | condocup_ci==2 
replace cotizapri_ci=1 if (v9059==1) & cotizando_ci==0 
label var cotizapri_ci "Cotizante a la Seguridad Social por su trabajo principal"

gen cotizasec_ci=0     if condocup_ci==1 | condocup_ci==2 
replace cotizasec_ci=1 if (v9099==1) & cotizando_ci==0 
label var cotizasec_ci "Cotizante a la Seguridad Social por su trabajo secundario"

gen cotizaotros_ci=0     if condocup_ci==1 | condocup_ci==2 
replace cotizaotros_ci=1 if (v9103==1 | v9120==2) & cotizando_ci==0 
label var cotizaotros_ci "Cotizante a la Seguridad Social por otro trabajos o por aporte privado"

********************
*** instcot_ci *****
********************
gen instcot_ci=.
label var instcot_ci "instituci�n a la cual cotiza"

*****************
*tipocontrato_ci*
*****************
gen tipocontrato_ci=. /*solo se pregunta si tiene o no contrato*/
label var tipocontrato_ci "Tipo de contrato segun su duracion en act principal"
label define tipocontrato_ci 1 "Permanente/indefinido" 2 "Temporal" 3 "Sin contrato/verbal" 
label value tipocontrato_ci tipocontrato_ci

*************
**pension_ci*
*************
*sum v1252 v1255 v1258 v1261
* 2014, 01 revision MLO
foreach var of varlist v1252 v1255 v1258 v1261{ 
replace `var'=. if `var'>=999999 | `var'==-1
}

gen pension_ci=0 
replace pension_ci=1 if (v1252>0 & v1252!=.) | (v1255>0 & v1255!=.) | (v1258>0 & v1258!=.) | (v1261>0 & v1261!=.) /*A todas las per mayores de diez a�os*/
label var pension_ci "1=Recibe pension contributiva"
 
*************
*ypen_ci*
*************
*sum v1252 v1255 v1258 v1261
egen ypen_ci=rsum (v1252 v1255 v1258 v1261)
replace ypen_ci=. if ypen_ci<=0
label var ypen_ci "valor de la pension contributiva"

****************
*instpen_ci*****
****************
gen instpen_ci=.
label var instpen_ci "Institucion proveedora de la pension - variable original de cada pais" 

***************
*pensionsub_ci*
***************
/*DZ Octubre 2017- Creacion de la variable  pension subsidiada*
http://dds.cepal.org/bdps/programa/?id=43
segun la fuente, el monto bpc para adultos mayores fue de 240 reales. Se encuentran beneficiarios con dicho monto*/
gen pensionsub_ci=(v1273==240)
label var pensionsub_ci "1=recibe pension subsidiada / no contributiva"


*****************
**  ypensub_ci  *
*****************
/*DZ Octubre 2017- Creacion de la variable valor de la pension subsidiada*
http://dds.cepal.org/bdps/programa/?id=43
segun la fuente, el monto bpc para adultos mayores fue de 240 reales. Se encuentran beneficiarios con dicho monto*/
gen ypensub_ci=v1273 if v1273==240
label var ypensub_ci "Valor de la pension subsidiada / no contributiva"

*************
*cesante_ci* 
*************
generat cesante_ci=0 if condocup_ci==2
replace cesante_ci=1 if (v9067==1 | v9106==2) & condocup_ci==2
label var cesante_ci "Desocupado - definicion oficial del pais"

*****************
*region /area ***
*****************
gen region=.	
replace region=1	if uf>=11 & uf<=17
replace region=2	if uf>=21 & uf<=29
replace region=3	if uf>=31 & uf<=35
replace region=4	if uf>=41 & uf<=43
replace region=5	if uf>=50 & uf<=53
label define region 1"norte" 2"Nordeste" 3"Sudeste/leste" 4"sul" 5"Centro_Oeste"
label value region region
label var region "distribuci�n regional del pa�s"

gen area=.
replace area=1 if zona_c==1
replace area=2 if zona_c==0
replace area=3 if v4107==1
label define area 1"urbana" 2"rural" 3"metropolitana" 
label value area area
label var area "area del pais"


*********
*lp_ci***
*********
gen lp_ci=.
replace lp_ci=146.841012357408	if region==4	& area==1		/*sur-urbana*/
replace lp_ci=133.675956043434	if region==4	& area==2		/*sur-rural */
replace lp_ci=149.879102226625	if region==2	& area==1		/*noreste-urbana*/
replace lp_ci=133.675956043434	if region==2	& area==2		/*noreste-rural*/
replace lp_ci=117.472809873084	if region==3	& area==1		/*sudeste-urbano*/
replace lp_ci=100.256967045417	if region==3	& area==2		/*sudeste-rural*/
replace lp_ci=153.929888804528	if region==1	& area==1		/*norte-urbano*/
replace lp_ci=134.688652752119	if region==1	& area==2		/*norte-rural */
replace lp_ci=124.561686333046	if region==5	& area==1		/*centro oeste-urbano*/
replace lp_ci=109.371236781489	if region==5	& area==2		/*centro oeste-rural */
replace lp_ci=167.094945118502	if uf==33	& area==3		/*Rio de janeiro-metropolitano*/
replace lp_ci=141.777529199239	if uf==33	& area==1		/*Rio de janeiro-urbano*/
replace lp_ci=127.599776240789	if uf==33	& area==2		/*Rio de janeiro-rural*/
replace lp_ci=168.107641698768	if uf==35	& area==3		/*Sao Paulo-metropolitano*/
replace lp_ci=148.866405646359	if uf==35	& area==1		/*Sao paulo-urbano*/
replace lp_ci=121.523596425303	if uf==35	& area==2		 /*Sao paulo-rural*/
replace lp_ci=144.815619068457	if uf==53	& area==3		/*Distrito federal-metropolitana*/
replace lp_ci=186.336181170911	if region==4	& area==3	& uf==43	/*Porto alegre: sur-metropolitana-rio grande de sul*/
replace lp_ci=153.929888804528	if region==4	& area==3	& uf==41	/*curitiba:     sur-metropolitana-paran�*/
replace lp_ci=132.663259463168	if region==2	& area==3	& uf==23	/*Fortaleza:    noreste-metropolitana-cear�*/
replace lp_ci=174.183821565622	if region==2	& area==3	& uf==26	/*recife:       noreste-metropolitana-pernambuco*/
replace lp_ci=164.056855120865	if region==2	& area==3	& uf==29	/*salvador:     noreste-metropolitana-bahia*/
replace lp_ci=130.637866174217	if region==3	& area==3	& uf==31	/*belo horizonte:sureste-metropolitana-minas gerais*/
replace lp_ci=148.866405646359	if region==1	& area==3	& uf==15	/*belem: noreste-metropolitana-par�*/
label var lp_ci "Linea de pobreza oficial del pais"

***********
*lpe_ci ***
***********
gen lpe_ci=.				
replace lpe_ci=73.420506178704	if region==4	& area==1		/*sur-urbana*/
replace lpe_ci=66.8379780217169	if region==4	& area==2		/*sur-rural */
replace lpe_ci=74.9395511133126	if region==2	& area==1		/*noreste-urbana*/
replace lpe_ci=66.8379780217169	if region==2	& area==2		/*noreste-rural*/
replace lpe_ci=58.7364049365422	if region==3	& area==1		/*sudeste-urbano*/
replace lpe_ci=50.1284835227087	if region==3	& area==2		/*sudeste-rural*/
replace lpe_ci=76.964944402264	if region==1	& area==1		/*norte-urbano*/
replace lpe_ci=67.3443263760597	if region==1	& area==2		/*norte-rural */
replace lpe_ci=62.2808431665232	if region==5	& area==1		/*centro oeste-urbano*/
replace lpe_ci=54.6856183907443	if region==5	& area==2		/*centro oeste-rural */
replace lpe_ci=83.5474725592511	if uf==33	& area==3		/*Rio de janeiro-metropolitano*/
replace lpe_ci=70.8887645996197	if uf==33	& area==1		/*Rio de janeiro-urbano*/
replace lpe_ci=63.7998881203947	if uf==33	& area==2		/*Rio de janeiro-rural*/
replace lpe_ci=84.0538208493839	if uf==35	& area==3		/*Sao Paulo-metropolitano*/
replace lpe_ci=74.4332028231797	if uf==35	& area==1		/*Sao paulo-urbano*/
replace lpe_ci=60.7617982126516	if uf==35	& area==2		 /*Sao paulo-rural*/
replace lpe_ci=72.4078095342283	if uf==53	& area==3		/*Distrito federal-metropolitana*/
replace lpe_ci=93.1680905854553	if region==4	& area==3	& uf==43	/*Porto alegre: sur-metropolitana-rio grande de sul*/
replace lpe_ci=76.964944402264	if region==4	& area==3	& uf==41	/*curitiba:     sur-metropolitana-paran�*/
replace lpe_ci=66.331629731584	if region==2	& area==3	& uf==23	/*Fortaleza:    noreste-metropolitana-cear�*/
replace lpe_ci=87.0919107828111	if region==2	& area==3	& uf==26	/*recife:       noreste-metropolitana-pernambuco*/
replace lpe_ci=82.0284275604325	if region==2	& area==3	& uf==29	/*salvador:     noreste-metropolitana-bahia*/
replace lpe_ci=65.3189330871083	if region==3	& area==3	& uf==31	/*belo horizonte:sureste-metropolitana-minas gerais*/
replace lpe_ci=74.4332028231797	if region==1	& area==3	& uf==15	/*belem: noreste-metropolitana-par�*/
label var lpe_ci "Linea de indigencia oficial del pais"
drop area


*************
**salmm_ci***
*************
gen salmm_ci=240
label var salmm_ci "Salario minimo legal"

*************
***tecnica_ci**
*************
gen tecnica_ci=. /*No se puede identificar educaci�n t�cnica superior*/
label var tecnica_ci "=1 formacion terciaria tecnica"	

************
***emp_ci***
************
gen emp_ci=(condocup_ci==1)

****************
***desemp_ci***
****************
gen desemp_ci=(condocup_ci==2)

*************
***pea_ci***
*************
gen pea_ci=(emp_ci==1 | desemp_ci==1)

****************
***formal_ci ***
****************
gen formal_ci=(cotizando_ci==1)

/*************************************************************************************************************************/
gen ocupa_ci=.
replace ocupa_ci=1 if v4810==2 | v4810==3 & emp_ci==1
replace ocupa_ci=2 if v4810==1 & emp_ci==1
replace ocupa_ci=3 if v4810==4 & emp_ci==1
replace ocupa_ci=4 if v4810==6 & emp_ci==1
replace ocupa_ci=5 if v4810==5 & emp_ci==1
replace ocupa_ci=6 if v4810==7 & emp_ci==1
replace ocupa_ci=7 if v4810==8 & emp_ci==1
replace ocupa_ci=8 if v4810==9 & emp_ci==1 
replace ocupa_ci=9 if v4810==10 & emp_ci==1

gen rama_ci=.
replace rama_ci=1 if v9907>1101 & v9907<5002
replace rama_ci=2 if v9907>=10000 & v9907<=14004 
replace rama_ci=3 if v9907>=15010 & v9907<=37000 
replace rama_ci=4 if v9907>=40010 & v9907<=41000 
replace rama_ci=5 if v9907>=45005 & v9907<=45999 
replace rama_ci=6 if v9907>=50010 & v9907<=55030
replace rama_ci=7 if v9907>=60010 & v9907<=64020
replace rama_ci=8 if v9907>=65000 & v9907<=70002
replace rama_ci=9 if v9907>=71010 & v9907<=99000
replace rama_ci=. if emp_ci==0
label define rama_ci 1 "Agricultura, Caza, Civicultura y Pesca" 2 "Explotaci�n de minas y Canteras" 3 "Industrias Manufactureras" 4 "Electricidad, Gas y Agua" 5 "Construcci�n" 6 "Comercio al por mayor y menor, Restaurantes y Hoteles" 7 "Transporte y Almacenamiento" 8 "Establecimientos Financieros, Seguros y Bienes Inmuebles" 9 "Servicios Sociales, Comunales y personales" 
label values rama_ci rama_ci


/*EN TODOS LOS A�OS, EXCEPTO EN EL '96, '97 Y '01 SE DESCRIBEN LAS CONDICIONES LABORALES DE LOS NI�OS DE ENTRE 5 Y 9 A�OS.
ESTO QUIERE DECIR QUE HAY QUE TENER EN CUENTA QUE EN ESOS A�OS LOS INGRESOS DE ESTOS NI�OS vAN A vALER 0, CUANDO EN OTROS 
A�OS TIENEN UN vALOR POSITIvO. PARA MANTENER LA COMPARABILIDAD ACROSS TIME, SOLO SE DEBEN AGARRAR LOS INGRESOS DE LOS 
MAYORES DE 10 A�OS, A MENOS QUE SE vAYAN A EXCLUIR LOS A�OS 1996 Y 1997! ==>> CREAMOS DOS vARIABLES DE INGRESO, UNA QUE LOS 
TIENE EN CUENTA (ej: ylmprik_ci) Y OTRA QUE NO (ylmpri_ci original)*/ 


*****************
***horaspri_ci***
*****************

gen horaspri_ci=v9058
replace horaspri_ci=. if horaspri_ci==99 |horaspri_ci==-1 | v4714!=1 /*Necesitamos que s�lo se fije en los empleados "adultos"*/
gen horasprik_ci=horaspri_ci
capture replace horasprik_ci=v0713 if edad_ci>=5 & edad_ci<=9
replace horasprik_ci=. if edad_ci>=5 & edad_ci<=9 & (horasprik_ci==99 | horasprik_ci==-1| emp_ci==0)

*2014,01 revision MLO
replace horaspri_ci=. if horaspri_ci<0 | horaspri_ci>150

*****************
***horastot_ci***
*****************
*gen horastot_ci=.
*2014, 01 incorporacio MLO
replace v9058 = . if v9058 == -1 | v9058 == 99
replace v9101 = . if v9101 == -1 | v9101 == 99
replace v9105 = . if v9105 == -1 | v9105 == 99

egen horastot_ci = rsum(v9058 v9101 v9105) 
replace horastot_ci = . if  (horaspri_ci==. & v9101==. & v9105==.) | v4714!=1 /*Necesitamos que s�lo se fije en los empleados "adultos"*/
replace horastot_ci = . if horastot_ci < 0
replace horastot_ci = . if horastot_ci > 150


gen ylmpri_ci=v9532 
replace ylmpri_ci=. if v9532==-1 | v9532>=999999 | v4714!=1 

gen ylmprik_ci=v9532
replace ylmprik_ci=. if v9532==-1 | v9532>=999999 | emp_ci==0 
capture replace ylmprik_ci=v7122 if edad_ci>=5 & edad_ci<=9
capture replace ylmprik_ci=. if  edad_ci>=5 & edad_ci<=9 & (v7122==-1 | v7122>=999999 |emp_ci==0)

gen ylnmpri_ci=v9535 if edad_ci>=10
replace ylnmpri_ci=. if v9535==-1 | v9535>=999999 | v4714!=1

gen ylnmprik_ci=v9535
replace ylnmprik_ci=. if v9535==-1 | v9535>=999999 | emp_ci==0
capture replace ylnmprik_ci=v7125 if edad_ci>=5 & edad_ci<=9
capture replace ylnmprik_ci=. if edad_ci>=5 & edad_ci<=9 & (v7125==-1 | v7125>=999999 | emp_ci==0)

/*TODAS LAS vARIABLES "SECUNDARIAS": ylmsec_ci, ylnmsec_ci, ylmotros_ci, ylnmotros_ci Y durades_ci ESTAN CREADAS S�LO PARA 
LOS MAYORES DE 10 A�OS. POR LO TANTO LAS vARIABLES AGREGADAS CON SUFIJO k EN REALIDAD S�LO SE REFIEREN A LA ACTIvIDAD 
PRINCIPAL DE LOS NI�OS*/

gen ylmsec_ci=v9982 if edad_ci>=10
replace ylmsec_ci=. if v9982==-1 | v9982>=999999 | v4714!=1

gen ylnmsec_ci=v9985 if edad_ci>=10
replace ylnmsec_ci=. if v9985==-1 | v9985>=999999 | v4714!=1

gen ylmotros_ci=v1022 if edad_ci>=10
replace ylmotros_ci=. if v1022==-1 | v1022>=999999 | v4714!=1

gen ylnmotros_ci=v1025 if edad_ci>=10
replace ylnmotros_ci=. if v1025==-1 | v1025>=999999 | v4714!=1

gen nrylmpri_ci=(ylmpri_ci==. & v4714==1)
replace nrylmpri_ci=. if v4714==2

gen nrylmprik_ci=(ylmprik_ci==. & emp_ci==1)
replace nrylmprik_ci=. if emp_ci==0

egen ylm_ci=rsum(ylmpri_ci ylmsec_ci ylmotros_ci)
replace ylm_ci=. if ylmpri_ci==. & ylmsec_ci==. & ylmotros_ci==.

egen ylmk_ci=rsum(ylmprik_ci ylmsec_ci ylmotros_ci)
replace ylmk_ci=. if ylmprik_ci==. & ylmsec_ci==. & ylmotros_ci==.

egen ylnm_ci=rsum(ylnmpri_ci ylnmsec_ci ylnmotros_ci)
replace ylnm_ci=. if ylnmpri_ci==. & ylnmsec_ci==. & ylnmotros_ci==.

egen ylnmk_ci=rsum(ylnmprik_ci ylnmsec_ci ylnmotros_ci)
replace ylnmk_ci=. if ylnmprik_ci==. & ylnmsec_ci==. & ylnmotros_ci==.


foreach var of varlist v1252 v1255 v1258 v1261 v1264 v1267 v1270 v1273{ 
replace `var'=. if `var'>=999999 | `var'==-1
}

egen ynlm_ci=rsum(v1252 v1255 v1258 v1261 v1264 v1267 v1270 v1273) if edad_ci>=10
replace ynlm_ci=. if (v1252==. &  v1255==. &  v1258==. &  v1261==. &  v1264==. &  v1267==. & v1270==. & v1273==.) | ynlm_ci<0

gen ynlnm_ci=.
sort idh_ch 
by idh_ch: egen nrylmpri_ch=max(nrylmpri_ci) if miembros_ci==1
by idh_ch: egen nrylmprik_ch=max(nrylmprik_ci) if miembros_ci==1

by idh_ch: egen ylm_ch=sum(ylm_ci)if miembros_ci==1
by idh_ch: egen ylmk_ch=sum(ylmk_ci) if miembros_ci==1
by idh_ch: egen ylnm_ch=sum(ylnm_ci)if miembros_ci==1
by idh_ch: egen ylnmk_ch=sum(ylnmk_ci) if miembros_ci==1

gen ylmnr_ch=ylm_ch
replace ylmnr_ch=. if nrylmpri_ch==1
gen ylmnrk_ch=ylmk_ch
replace ylmnrk_ch=. if nrylmprik_ch==1

by idh_ch: egen ynlm_ch=sum(ynlm_ci)if miembros_ci==1
gen ynlnm_ch=.
*2015, 03 modificacion MLO
*gen ylmhopri_ci=ylmpri_ci/(horaspri_ci*4.2)
gen ylmhopri_ci=ylmpri_ci/(horaspri_ci*4.3)
gen ylmhoprik_ci=ylmprik_ci/(horasprik_ci*4.3)
replace ylmhopri_ci=. if ylmhopri_ci<=0
replace ylmhoprik_ci=. if ylmhoprik_ci<=0

gen rentaimp_ch=.
gen autocons_ch=.
gen autocons_ci=.
gen remesas_ci=.
sort idh_ch
gen remesas_ch=.

replace v1091=. if v1091==99 | v1091==-1
replace v1092=. if v1092==99 | v1092==-1


*Yanira Oviedo, Junio 2010: Se estaba multiplicando por 12, pero al ser un valor anual, deber�a dividirse 
/*gen aux1=v1091/12
egen durades_ci=rsum(aux1 v1092) if  v4714!=1 & edad_ci>=10
replace durades_ci=. if (v1091==. & v1092==.) */
*MLO 03,2014
gen durades_ci=.

replace v9611=. if v9611==99 | v9611==-1
replace v9612=. if v9612==99 | v9612==-1
gen aux2=v9612/12
egen antiguedad_ci=rsum(v9611 aux2) if emp_ci==1
replace antiguedad_ci=. if v9611==. & v9612==. 

drop aux*

/******************************************************************************************/
/*					vARIABLES DEL MERCADO LABORAL			  			*/
/******************************************************************************************/
gen desalent_ci=.
gen subemp_ci=.
gen tiempoparc_ci=.

gen categopri_ci=1 if v9029==4 | (v9008>=8 & v9008<=10)
replace categopri_ci=1 if v0708==4 | v0711==4
replace categopri_ci=2 if v0708==3 | v9029==3 |v0711==3 |(v9008>=5 & v9008<=7)
replace categopri_ci=3 if v0708==1 | v0708==2 |v9029==1 |v9029==2 |v0711==1 |v0711==2 | (v9008>=1 & v9008<=4)
replace categopri_ci=4 if (v0708>=5 & v0708<=8) |(v9029>=5 & v9029<=8) |(v0711>=5 & v0711<=8) | (v9008>=11 & v9008<=13)
replace categopri_ci=. if emp_ci!=1

gen categosec_ci=1 if v9092==4
replace categosec_ci=2 if v9092==3
replace categosec_ci=3 if v9092==1
replace categosec_ci=4 if v9092==5 |v9092==6
replace categosec_ci=. if emp_ci!=1 
gen nempleos_ci=1 if v9005==1
replace nempleos_ci=2 if v9005>1 & v9005!=.
/*
gen firmapeq=1 if v9008==1 & v9040<=4 /*v9008=Empleado permanente en el Agro*/
replace firmapeq=0 if v9008==1 & (v9040==6 | v9040==8) /*v9008=Empleado permanente en el Agro*/
replace firmapeq=1 if (v9008>=2 & v9008<=4) & ((v9013==1 & v9014<=6) | v9013==3) /*v9008= Algun tipo de empleado en el Agro*/
replace firmapeq=0 if (v9008>=2 & v9008<=4) & (v9013==1 & (v9014==8 | v9014==0)) /*v9008= Algun tipo de empleado en el Agro*/
replace firmapeq=1 if v9008==5 & ((v9049==1 & v9050<=6) | v9049==3) /*v9008=Cuenta propia en Servicios Auxiliares*/ 
replace firmapeq=0 if v9008==5 & v9049==1 & v9050==8 /*v9008=Cuenta propia en Servicios Auxiliares*/ 
replace firmapeq=1 if v9008==6 | v9008==7 /*Cuenta Propia en Agro o en otra actividad*/
replace firmapeq=0 if (v9008==8 | v9029==4) & ((v9048==0 | v9048==8) | ((v9048==2 | v9048==4) & v9049==1 & v9050>=6)) /*Empleador en los servicios auxiliares Agricolas o Empleador NO Agro*/
replace firmapeq=1 if (v9008==8 | v9029==4) & ((v9048<=6 & v9049==3) | ((v9048==2 | v9048==4) & v9049==1 & v9050<=4)) /*Empleador en los servicios auxiliares Agricolas o Empleador NO Agro*/
replace firmapeq=1 if (v9008==9 | v9008==10) & ((v9016==2 & v9017<=5 & v9018==4) | (v9016==2 & v9017<=3 & v9018==2 & v9019<=3) | (v9016==4 & v9018==2 & v9019<=5) | (v9016==4 & v9018==4)) /*Empleador en Agro u otras actividades*/
replace firmapeq=0 if (v9008==9 | v9008==10) & ((v9016==2 & (v9017==7 | v9017==8)) | (v9016==4 & v9018==2 & v9019>=5)) /*Empleador en Agro u otras actividades*/
replace firmapeq=1 if (v9008>=11 & v9008<=13) | (v9029>=5 & v9029<=7) /*Trabajador No remunerado*/
replace firmapeq=1 if v9029==1 & (v9032==2 & v9040<=4)  /*Empleado NO Agricola*/
replace firmapeq=0 if v9029==1 & (v9032==2 & (v9040==6 | v9040==8)) /*Empleado NO Agricola*/
/*Los empleados NO Agricolas que trabajan en el sector PUBLICO o que son empleados domesticos no tienen tama�o de firma!*/
replace firmapeq=1 if v9029==3 & (v9049==3 | (v9049==1 | v9050<=6))/*Cuenta Propia NO Agricola*/
replace firmapeq=0 if v9029==3 & (v9049==1 | (v9050==8 | v9050==0))/*Cuenta Propia NO Agricola*/
/*Que pasa con los trabajadores no remunerados? Se incluyen en tama�o de firma?*/

ren firmapeq firmapeq_ci
*cambio introducido el 06/13/05*
*/

gen spublico_ci=(v9032==4)
replace spublico_ci=. if v9032==9




					****************************
					***	vARIABLES EDUCATIvAS ***
					****************************

*------------------------------------------------------------------------------------------------------------------
*YANIRA, Ag 2010: SE HACE UNA CORRECI�N SOBRE LAS vARIABLES DE EDUCACI�N. PUES LA vARIABLE DE INSUMO PARA CONSTRUIR 
*A�OS DE EDUCACI�N NO SE TUvO EN CUENTA UN CAMBIO EN LAS OPCIONES DE LAS vARIABLES INSUMO. LO CUAL GENER� UN ERROR
*------------------------------------------------------------------------------------------------------------------



**************
**asiste_ci***
**************

gen asiste_ci=(v0602==2)
label var asiste_ci "Personas que actualmente asisten a un centro de ense�anza"


*************
***aedu_ci***
*************
*Modificado Mayra S�enz 12/10/2014
*gen aedu_ci=.
* Si se genera con . se generan alrededor de 10% de hogares con jefe de hogar con missing en educaci�n.
gen aedu_ci=0
label var aedu_ci "Anios de educacion"


*PARA LOS QUE NO ASISTEN
*************************

*Pre-escolar, creche o alfabetizaci�n de adultos
replace aedu_ci=0 if (v0607==8| v0607==9 | v0607==10) & asiste_ci==0

	*Sistema antiguo
*Elementar (prim�rio) - se asume que el m�ximo es 4 - Anteriormente se permit�a 6 pero no 5
replace aedu_ci=0  if v0607==1 & v0610==. & v0611!=1 & asiste_ci==0
replace aedu_ci=min(v0610,4) if v0607==1 & v0610>=1 & v0610<=6 & asiste_ci==0
*Medio 1 ciclo (ginasial, etc) - se asume que el m�ximo es 8
replace aedu_ci=min(v0610+4,8) if v0607==2 & v0610>=1 & v0610<=5 & asiste_ci==0
replace aedu_ci=4  if v0607==2 & v0610==. & v0611!=1 & asiste_ci==0
*Medio 2 ciclo (cientifico, clasico, etc, etc) - se asume que el m�ximo es 11, pero
*bajo la l�gica anterior deber�an se 12, ya que se permite hasta 4 a�os adicionales en este nivel
*Aunque solo es necesario tener 11 a�os de educaci�n para completar la secundaria
replace aedu_ci=min(v0610+8,12) if v0607==3 & v0610>=1 & v0610<=4 & asiste_ci==0
replace aedu_ci=8  if v0607==3 & v0610==. & v0611!=1 & asiste_ci==0

	*Sistema nuevo
*Primeiro grau - Bajo este sistema la primaria llega hasta el grado 8
replace aedu_ci=min(v0610,8) if v0607==4 & v0610>=1 & v0610<=8 & asiste_ci==0
replace aedu_ci=0  if v0607==4 & v0610==. & v0611!=1 & asiste_ci==0
*Segundo grau - Secundaria son 4 a�os m�s
replace aedu_ci=min(v0610+8,12) if v0607==5 & v0610>=1 & v0610<=4 & asiste_ci==0
replace aedu_ci=8 if v0607==5 & v0610==. & v0611!=1 & asiste_ci==0

*Superior
replace aedu_ci=min(v0610+11,17) if v0607==6 & v0610>=1 & v0610<=8 & asiste_ci==0
replace aedu_ci=11 if v0607==6 & v0610==. & v0611!=1 & asiste_ci==0

*Maestria o doctorado  
*Para este ciclo no se pregunta el �ltimo a�o aprobado. Por lo tanto se supone que si termin� el ciclo 
*el individuo cuenta con 19 a�os de educaci�n (2 a�os m�s de educaci�n), si el individuo no termin� se le agrega 
*1 a�o m�s de eduaci�n para quedar con 18 ya que si el �ltimo ciclo m�s alto alcanzado es postgrado, el individuo 
*por lo menos tuvo que cursar 1 a�o en ese nivel
replace aedu_ci=18 if v0607==7 & v0611==3 & asiste_ci==0
replace aedu_ci=19 if v0607==7 & v0611==1 & asiste_ci==0


*PARA LOS QUE ASISTEN
**********************

*Pre-escolar, creche o alfabetizaci�n de adultos
replace aedu_ci=0 if (v0603==6| v0603==7 | v0603==8) & asiste_ci==1

*Regular de 1� grau/ Supletivo de 1� grau   (se asume que el m�ximo es 8) 
replace aedu_ci=0  if (v0603==1 | v0603==3) & v0605==. & asiste_ci==1
replace aedu_ci=min(v0605-1,7) if (v0603==1 | v0603==3) & v0605>=1 & v0605<=8 & asiste_ci==1
*Regular de 2� grau/ Supletivo de 2� grau   (se asume que el m�ximo es 4, pero con 3 basta para completar el ciclo)
replace aedu_ci=min(v0605-1+8,11) if (v0603==2 | v0603==4) & v0605>=1 & v0605<=4 & asiste_ci==1
replace aedu_ci=8  if (v0603==2 | v0603==4) & v0605==. & asiste_ci==1

*Pre-vestibular
replace aedu_ci=11  if v0603==9 & asiste_ci==1

*Superior
replace aedu_ci=min(v0605+11-1,17) if v0603==5 & v0605>=1 & v0605<=8 & asiste_ci==1
replace aedu_ci=11 if v0603==5 & v0605==. & asiste_ci==1

*Maestria o doctorado  
*Si el �ltimo ciclo m�s alto alcanzado es postgrado, el individuo por lo menos tuvo que cursar 1 a�o en ese nivel
replace aedu_ci=18 if v0603==10  & asiste_ci==1

*Se deja s�lo la informaci�n de las personas con 5 a�os o m�s
replace aedu_ci=. if edad_ci<5



**************
***eduno_ci***
**************
gen byte eduno_ci=0
replace eduno_ci=1 if aedu_ci==0
replace eduno_ci=. if aedu_ci==.
label variable eduno_ci "Cero anios de educacion"

**************
***edupi_ci***
**************
gen byte edupi_ci=0
replace edupi_ci=1 if aedu_ci>0 & aedu_ci<8
replace edupi_ci=. if aedu_ci==.
label variable edupi_ci "Primaria incompleta"

**************
***edupc_ci***
**************
gen byte edupc_ci=0
replace edupc_ci=1 if aedu_ci==8
replace edupc_ci=. if aedu_ci==.
label variable edupc_ci "Primaria completa"

**************
***edusi_ci***
**************
gen byte edusi_ci=0
replace edusi_ci=1 if aedu_ci>8 & aedu_ci<11
replace edusi_ci=. if aedu_ci==.
label variable edusi_ci "Secundaria incompleta"

**************
***edusc_ci***
**************
gen byte edusc_ci=0
replace edusc_ci=1 if aedu_ci==11
replace edusc_ci=. if aedu_ci==.
label variable edusc_ci "Secundaria completa"

**************
***eduui_ci***
**************
gen byte eduui_ci=0
replace eduui_ci=1 if aedu_ci>11 & aedu_ci<17
replace eduui_ci=. if aedu_ci==.
label variable eduui_ci "Universitaria incompleta"

**************
***eduuc_ci***
**************
gen byte eduuc_ci=0
replace eduuc_ci=1 if aedu_ci>=17
replace eduuc_ci=. if aedu_ci==.
label variable eduuc_ci "Universitaria completa o mas"

***************
***edus1i_ci***
***************
*La secundaria s�lo dura 4 a�os. No puede divirse en ciclos
gen edus1i_ci=.
label variable edus1i_ci "1er ciclo de la secundaria incompleto" 

***************
***edus2i_ci***
***************
gen byte edus2i_ci=.
label variable edus2i_ci "2do ciclo de la secundaria incompleto" 

***************
***edus2c_ci***
***************
gen edus2c_ci=.
label variable edus2c_ci "2do ciclo de la secundaria completo" 

***************
***edupre_ci***
***************
gen byte edupre_ci=.
label variable edupre_ci "Educacion preescolar"

**************
***eduac_ci***
**************
gen byte eduac_ci=.
label variable eduac_ci "Superior universitario vs superior no universitario"


foreach var of varlist edu* {
replace `var'=. if aedu_ci==.
}

******************
***pqnoasist_ci***
******************
gen pqnoasis_ci=.
label var pqnoasis_ci "Razones para no asistir a la escuela"

**Daniela Zuluaga- Enero 2018: Se agrega la variable pqnoasis1_ci cuya sintaxis fue elaborada por Mayra Saenz**
	
**************
*pqnoasis1_ci*
**************
gen pqnoasis1_ci = .

***************
***repite_ci***
***************
gen repite_ci=.
label var repite_ci "Personas que han repetido al menos un a�o o grado"

***************
***edupub_ci***
***************
gen edupub_ci=(v6002==2)
label var  edupub_ci "Personas que asisten a centros de ense�anza p�blicos"

*******************
***tamemp_ci*******
*******************
gen tamemp_ci=1 if v9019==1 | v9019==3 | v9019==5 |v9017==1 | v9017==3 | v9017==5 | v9040==2 | v9040==4 | v9048==2 | v9048==4 | v9048==6 
replace tamemp_ci=2 if v9019==7 | v9017==7 | v9040==6 | v9048==8
replace tamemp_ci=3 if v9019==8 | v9017==8 | v9040==8 | v9048==0

* rev MLO, 2015, 03
* se incorporan cuenta propia y trabajadores agricolas
recode tamemp_ci . =1 if v9049==3
replace tamemp_ci=1 if v9014==2 |  v9014==4 |  v9014==6
replace tamemp_ci=1 if v9049==3 | v9050==6 | v9050==4 | v9050==2 | v9052==2 | v9052==4 | v9052==6
replace tamemp_ci=2 if v9014==8 | v9052==8
replace tamemp_ci=3 if v9014==0 | v9050==8 | v9052==0 

label var  tamemp_ci "Tama�o de Empresa" 
label define tama�o 1"Peque�a" 2"Mediana" 3"Grande"
label values tamemp_ci tama�o

******************
***categoinac_ci**
******************
gen categoinac_ci=1 if (v9122==2 | v9123==1) & condocup_ci==3
replace categoinac_ci=2 if v0602==2 & condocup_ci==3
replace categoinac_ci=3 if v9121==1 & condocup_ci==3
recode categoinac_ci .=4 if condocup_ci==3
label var  categoinac_ci "Condici�n de Inactividad" 
label define inactivo 1"Pensionado" 2"Estudiante" 3"Hogar" 4"Otros"
label values categoinac_ci inactivo


*variables que faltan generar
gen tcylmpri_ci=.
gen tcylmpri_ch=.
gen edus1c_ci=.
gen repiteult_ci=.
gen vivi1_ch =.
gen vivi2_ch =.
gen tipopen_ci=.
gen ylmho_ci=. 
gen vivitit_ch=.

/*_____________________________________________________________________________________________________*/
* Asignaci�n de etiquetas e inserci�n de variables externas: tipo de cambio, Indice de Precios al 
* Consumidor (2011=100), Paridad de Poder Adquisitivo (PPA 2011),  l�neas de pobreza
/*_____________________________________________________________________________________________________*/


do "$ruta\harmonized\_DOCS\\Labels&ExternalVars_Harmonized_DataBank.do"

/*_____________________________________________________________________________________________________*/
* Verificaci�n de que se encuentren todas las variables armonizadas 
/*_____________________________________________________________________________________________________*/

order region_BID_c region_c pais_c anio_c mes_c zona_c factor_ch	idh_ch	idp_ci	factor_ci sexo_ci edad_ci ///
raza_idioma_ci  id_ind_ci id_afro_ci raza_ci  relacion_ci civil_ci jefe_ci nconyuges_ch nhijos_ch notropari_ch notronopari_ch nempdom_ch ///
clasehog_ch nmiembros_ch miembros_ci nmayor21_ch nmenor21_ch nmayor65_ch nmenor6_ch	nmenor1_ch	condocup_ci ///
categoinac_ci nempleos_ci emp_ci antiguedad_ci	desemp_ci cesante_ci durades_ci	pea_ci desalent_ci subemp_ci ///
tiempoparc_ci categopri_ci categosec_ci rama_ci spublico_ci tamemp_ci cotizando_ci instcot_ci	afiliado_ci ///
formal_ci tipocontrato_ci ocupa_ci horaspri_ci horastot_ci	pensionsub_ci pension_ci tipopen_ci instpen_ci	ylmpri_ci nrylmpri_ci ///
tcylmpri_ci ylnmpri_ci ylmsec_ci ylnmsec_ci	ylmotros_ci	ylnmotros_ci ylm_ci	ylnm_ci	ynlm_ci	ynlnm_ci ylm_ch	ylnm_ch	ylmnr_ch  ///
ynlm_ch	ynlnm_ch ylmhopri_ci ylmho_ci rentaimp_ch autocons_ci autocons_ch nrylmpri_ch tcylmpri_ch remesas_ci remesas_ch	ypen_ci	ypensub_ci ///
salmm_ci tc_c ipc_c lp19_c lp31_c lp5_c lp_ci lpe_ci aedu_ci eduno_ci edupi_ci edupc_ci	edusi_ci edusc_ci eduui_ci eduuc_ci	edus1i_ci ///
edus1c_ci edus2i_ci edus2c_ci edupre_ci eduac_ci asiste_ci pqnoasis_ci pqnoasis1_ci	repite_ci repiteult_ci edupub_ci tecnica_ci ///
aguared_ch aguadist_ch aguamala_ch aguamide_ch luz_ch luzmide_ch combust_ch	bano_ch banoex_ch des1_ch des2_ch piso_ch aguamejorada_ch banomejorado_ch  ///
pared_ch techo_ch resid_ch dorm_ch cuartos_ch cocina_ch telef_ch refrig_ch freez_ch auto_ch compu_ch internet_ch cel_ch ///
vivi1_ch vivi2_ch viviprop_ch vivitit_ch vivialq_ch	vivialqimp_ch , first




compress


saveold "`base_out'", replace


log close


