	**************************************************
	*** LECTURA BASES PLANAS TERCER TRIMESTRE 2007 ***
	************ CABECERAS MUNICIPALES ***************
	**************************************************



****************************
**LECTURA DEL MES DE JULIO**
****************************

clear

cd "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\txt\"


*** VIVIENDA ***

clear
infix I_DPTO 297-298 FEXHOG 299-306 I_ESTR 317-317 MPIO 318-322 SEGMENTO 323-325 REGIS 326-327 ///
DIRECTORIO 328-335 SECUENCIA_ENCUESTA 336-343 SECUENCIA_P 344-351 AREA 352-353  ///
P4000 1-1 P4010 2-2 P4020 3-3 P4030S1 4-4 P4030S1A1 5-5 P4030S2 6-6 P4030S3 7-7 P4030S4 8-8 P4030S4A1 9-9 ///
P4030S5 10-10 P4040 11-11 P5000 12-13 P5010 14-15 P5020 16-16 P5030 17-17 P5040 18-18 P5050 19-20 ///
P5060 21-21 P5070 22-22 P5080 23-23 P5090 24-24 str P5090S1 25-54 P5100 55-64 P5110 65-74 P5120 75-75  ///
P5130 76-85 P5140 86-95 P5160S1 96-96 P5160S1A1 97-106 P5160S2 107-107 P5160S2A1 108-117 P5240 118-118 ///
P5250 119-128 P5230 129-129 P5150S1A1 130-130 P5150S1A2 131-131 P5150S1A3 132-132 P5150S1A4 133-133 ///
P5150S1A5 134-134 P5150S1A6 135-135 P5150S1A9 136-136 P5150S2A1 137-137 P5150S2A2 138-138 P5150S2A3 139-139 ///
P5150S2A4 140-140 P5150S2A5 141-141 P5150S2A6 142-142 P5150S2A9 143-143 P5150S3A1 144-144 P5150S3A2 145-145 ///
P5150S3A3 146-146 P5150S3A4 147-147 P5150S3A5 148-148 P5150S3A6 149-149 P5150S3A9 150-150 P5150S4A1 151-151 ///
P5150S4A2 152-152 P5150S4A3 153-153 P5150S4A4 154-154 P5150S4A5 155-155 P5150S4A6 156-156 P5150S4A9 157-157 ///
P5150S5A1 158-158 P5150S5A2 159-159 P5150S5A3 160-160 P5150S5A4 161-161 P5150S5A5 162-162 P5150S5A6 163-163 ///
P5150S5A9 164-164 P5150S6A1 165-165 P5150S6A2 166-166 P5150S6A3 167-167 P5150S6A4 168-168 P5150S6A5 169-169 ///
P5150S6A6 170-170 P5150S6A9 171-171 P5150S7A1 172-172 P5150S7A2 173-173 P5150S7A3 174-174 P5150S7A4 175-175 ///
P5150S7A5 176-176 P5150S7A6 177-177 P5150S7A9 178-178 P5150S8A1 179-179 P5150S8A2 180-180 P5150S8A3 181-181 ///
P5150S8A4 182-182 P5150S8A5 183-183 P5150S8A6 184-184 P5150S8A9 185-185 P5170 186-186 P5180 187-187 ///
P5180S1 188-197 P5180S2 198-207 P5185S1 208-208 P5185S2 209-209 P5185S3 210-210 P5185S4 211-211 P5185S5 212-212 ///
P5185S6 213-213 P5185S7 214-214 P5185S8 215-215 P5185S9 216-216 str P5185S9A1 217-246 str P5190S1A1 247-257 ///
P5190S2 258-258 P5190S2A1 259-268 P5210S1 269-269 P5210S2 270-270 P5210S3 271-271 P5210S4 272-272 P5210S5 273-273 ///
P5210S6 274-274 P5210S7 275-275 P5210S8 276-276 P5210S9 277-277 P5210S10 278-278 P5210S11 279-279 P5210S12 280-280 ///
P5210S13 281-281 P5210S14 282-282 P5210S15 283-283 P5210S16 284-284 P5210S17 285-285 P5210S18 286-286 ///
P5210S19 287-287 P5210S20 288-288 P5210S21 289-289 P5210S22 290-290 P5210S23 291-291 P5210S24 292-292 ///
P5220 293-293 P5220S1 294-295 using sas01cab07.TXT

gen ANO = 2007
gen MES = 7


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\vivienda7.dta", replace

*** CARACTERISTICAS GENERALES / EDUCACION  ***
clear
infix I_DPTO 118-119 FEX1 120-127 FEXHOG 128-135 I_ESTR 136-136 MPIO 137-141 SEGMENTO 142-144 ///
REGIS 145-146 DIRECTORIO 147-154 SECUENCIA_ENCUESTA 155-162 SECUENCIA_P 163-170 ORDEN 171-172 CLASE 173-173 ///
P6016 1-2 P6020 3-3 P6030S1 4-5 P6030S2 6-7 P6030S3 8-11 P6040  12-14 P6050  15-15 P6080 16-16 /// 
str P6080S1 17-46 P6060 47-47 P6060S1 48-48 P6070 49-49 P6090 50-50 P6140 51-51 P6150 52-54 P6100 55-55 ///
P6110 56-56 P6120 57-66 P6125 67-67 P6160 68-68 P6170 69-69 P6175 70-70 P6180 71-71 P6180S1 72-81 ///
P6180S2 82-91 P6190 92-92 P6190S1 93-102 P6200 103-103 P6200S1 104-113 P6210 114-114 P6210S1 115-116 ///
P6220 117-117 AREA 173-174 using SAS10cab07.TXT

gen ANO = 2007
gen MES = 7


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\educacion7.dta", replace


*** FUERZA DE TRABAJO ***

clear
infix I_DPTO 108-109 FEX1 110-117 FEXHOG 118-125 I_ESTR 126-126 MPIO  127-131 SEGMENTO 132-134 ///
REGIS 135-136 DIRECTORIO 137-144 SECUENCIA_ENCUESTA 145-152 SECUENCIA_P 153-160 ORDEN 161-162  ///
CLASE 163-163 AREA 163-164 P6230 1-2 P6240 3-3  str P6240S1 4-33 P6250 34-34 P6260 35-35 P6270 36-36 ///
P6280 37-37 P6290 38-38 str P6290S1 39-68 P6300 69-69 P6310 70-71 str P6310S1 72-101 P6320 102-102 P6330 103-103 ///
P6340 104-104 P6350 105-106 P6351 107-107 using SAS50cab07.TXT

gen ANO = 2007
gen MES = 7


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\ftrab7.dta", replace


*** OCUPADOS ***
clear
infix I_DPTO 1199-1200 FEX1 1201-1208 FEXHOG 1209-1216 I_ESTR 1217-1217 MPIO 1218-1222 SEGMENTO 1223-1225 ///
REGIS 1226-1227 DIRECTORIO 1228-1235 SECUENCIA_ENCUESTA 1236-1243 SECUENCIA_P 1244-1251 ORDEN 1252-1253 ///
CLASE 1254-1254 AREA 1254-1255 OFICIO 1-2 RAMA2D 3-4 P6440 5-5 P6450 6-6 P6460 7-7 P6460S1 8-9 P6465S1 10-10 ///
P6465S1A1 11-20 P6465S2 21-21 P6465S2A1 22-31 P6660S1 32-32 P6660S1A1 33-42 P6660S2 43-43 P6660S2A1 44-53 ///
P6400 54-54 P6422 55-55 P6424S1 56-56 P6424S2 57-57 P6424S3 58-58 P6424S4 59-59 P6426 60-62 P6430 63-63 ///
str P6430S1 64-93 P6480 94-94 str P6480S1 95-124 P6490 125-125 str P6490S1 126-155 P6500 156-165 P6510 166-166 ///
P6510S1 167-176 P6510S2 177-186 P6590 187-187  P6590S1 188-197 P6600 198-198 P6600S1 199-208 P6610 209-209 ///
P6610S1 210-219 P6620 220-220 P6620S1 221-230 P6585S1 231-231 P6585S1A1 232-241 P6585S1A2 242-251 P6585S2 252-252 /// 
P6585S2A1 253-262 P6585S2A2 263-272 P6585S3 273-273 P6585S3A1 274-283 P6585S3A2 284-293 P6585S4 294-294 ///
P6585S4A1 295-304 P6530 305-305 P6530S1 306-315 P6540 316-316 P6540S1 317-326 P6540S2 327-336 P6550 337-337 ///
P6550S1 338-347 P6550S2 348-357 P6560 358-358 P6560S1 359-368 P6560S2 369-378 P6570 379-379 P6570S1 380-389 ///
P6570S2 390-399 P6580 400-400 P6580S1 401-410 P6580S2 411-420 P6625 421-421 P6625S1 422-431 P6630S1 432-432 ///
P6630S1A1 433-442 P6630S2 443-443 P6630S2A1 444-453 P6630S3 454-454 P6630S3A1 455-464 P6630S4 465-465 P6630S4A1 466-475 ///
P6630S5 476-476 P6630S5A1 477-486 P6640 487-487 P6642S1 488-489 P6642S2 490-491 P6642S2A1 492-493 P6643S1 494-495 ///
P6643S2 496-497 P6643S2A1 498-499 P6644S1 500-501 P6644S2 502-503 P6644S2A1 504-505 P7650 506-506 P7660 507-510 ///
P7670 511-512 P7680 513-513 P7690 514-517 P7700 518-519 P7710 520-520 P7720 521-524 P7730 525-526 P6765 527-527 ///
str P6765S1 528-557 P6772 558-558 P6774 559-559 P7620 560-560 str P7620S1 561-590 P7630 591-591 str P7630S1 592-621 P7640S1 622-623 ///
P7640S2 624-625 P7640S3 626-627 P7640S4 628-629 P7640S5 630-631 P7640S6 632-633 P7640S7 634-635 P7640S8 636-637 ///
P7640S9 638-639 P7640S10 640-641 P7640S11 642-643 P7640S12 644-645 P7640S13 646-647 P7640S14 648-649 str P7640S14A1 650-679 ///
P6750 680-689 P6760 690-691 P550 692-701 P6780 702-702 str P6780S1 703-732 P6782 733-733 P6784 734-734 P7740 735-735 ///
P7750 736-739 P7760 740-741 P7770 742-742 P7780 743-746 P7790 747-748 P6790 749-750 P6800 751-753 P6810 754-754 ///
str P6810S1 755-784 P6850 785-787 P6830 788-788 str P6830S1 789-818 P6835 819-819 P6835S1 820-821 P6835S2 822-823 ///
P6836 824-824 P6836S1 825-826 P6836S2 827-828 P6837 829-829 P6837S1 830-831 P6837S2 832-833 P6870 834-834 ///
P6880 835-836 str P6880S1 837-866 P6895 867-867 P6900 868-869 str P6900S1 870-899 P6910 900-901 str P6910S1 902-931 P6920 932-932 ///
P6930 933-933 P6940 934-934 P6950 935-944 P6960 945-946 P6970 947-948 str P6970S1 949-978 P6980S1 979-979 P6980S2 980-980 ///
P6980S3 981-981 P6980S4 982-982 P6980S5 983-983 P6980S6 984-984 P6980S7 985-985 str P6980S7A1 986-1015 P6980S8 1016-1016 ///
P6990 1017-1017 P7000 1018-1018 P7019 1019-1019 P7020 1020-1020 P7022 1021-1021 P7024 1022-1022 P7026 1023-1025 ///
P7028 1026-1026 str P7028S1 1027-1056 P7040 1057-1057 P7045 1058-1059 P7050 1060-1060 str P7050S1 1061-1090 P7070 1091-1100 ///
P7080 1101-1110 P7090 1111-1111 P7100 1112-1113 P7110 1114-1114 P7120 1115-1115 P7130 1116-1116 P7140S1 1117-1117 ///
P7140S2 1118-1118 P7140S3 1119-1119 P7140S4 1120-1120 P7140S5 1121-1121 P7140S6 1122-1122 P7140S7 1123-1123 ///
P7140S8 1124-1124 P7140S9 1125-1125 str P7140S9A1 1126-1155 P7150 1156-1156 P7160 1157-1157 P7170S1 1158-1158 ///
P7170S2 1159-1159 P7170S3 1160-1160 P7170S4 1161-1161 P7170S5 1162-1162 P7170S6 1163-1163 P7180 1164-1164 /// 
P7190 1165-1165 P7200 1166-1166 P7240 1167-1168 str P7240S1 1169-1198 using SAS60cab07.TXT

gen ANO = 2007
gen MES = 7


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\ocupados7.dta", replace



*** DESOCUPADOS ***

clear 

infix I_DPTO 239-240 FEX1 241-248 FEXHOG 249-256 I_ESTR 258-258 MPIO 259-263 SEGMENTO 264-266 REGIS 269-270 ///
DIRECTORIO 271-278 SECUENCIA_ENCUESTA 279-286 SECUENCIA_P 287-294 ORDEN 295-302 CLASE 303-303 AREA 303-304 ///
P7250 1-3 P7260 4-6 OFICIO1 7-8 P7280 9-9 str P7280S1 10-39 P7290 40-40 P7300 41-41 P7310 42-42 P7320 43-45 ///
OFICIO2 46-47 RAMA2D_D 48-49 P7350 50-50 str P7350S1 51-80 P7360 81-81 P7370 82-82 P7380 83-84 str P7380S1 85-114 ///
P7390 115-115 str P7390S1 116-145 P7400 146-146 P7410 147-148 str P7410S1 149-178 P7420S1 179-179 P7420S2 180-180 ///
P7420S3 181-181 P7420S4 182-182 P7420S5 183-183 P7420S6 184-184 P7420S7 185-185 str P7420S7A1 186-215 P7420S8 216-216 ///
P7422 217-217 P7422S1 218-227 P7424 228-228 P7424S1 229-238 using SAS70cab07.TXT

gen ANO = 2007
gen MES = 7


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\desocupados7.dta", replace


*** INACTIVOS ***
clear 
infix I_DPTO 58-59 FEX1 60-67 FEXHOG 68-75 I_ESTR 76-76 MPIO 77-81 SEGMENTO 82-84 REGIS 85-86 ///
DIRECTORIO 87-94 SECUENCIA_ENCUESTA 95-102 SECUENCIA_P 103-110 ORDEN 111-118 CLASE 119-119 AREA 119-120 ///
P7430 1-1 P7440 2-2 P7450 3-3 str P7450S1 4-33 P7460 34-34 P7470 35-35 P7472 36-36 P7472S1 37-46 P7490 47-47 ///
P7490S1 48-57 using SAS80cab07.TXT

gen ANO = 2007
gen MES = 7

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\inactivos7.dta", replace


*** OTRAS ACTIVIDADES ***
clear
infix I_DPTO 37-38 FEX1 39-46 FEXHOG 47-54 I_ESTR 55-55 MPIO 56-60 SEGMENTO 61-63 REGIS 64-65  ///
DIRECTORIO 66-73 SECUENCIA_ENCUESTA 74-81 SECUENCIA_P 82-89 ORDEN 90-97 CLASE 98-98 AREA 98-99  ///
P7480S1 1-1 P7480S1A1 2-3 P7480S2 4-4 P7480S2A1 5-6 P7480S3 7-7 P7480S3A1 8-9 P7480S4 10-10  ///
P7480S4A1 11-12 P7480S5 13-13 P7480S5A1 14-15 P7480S6 16-16 P7480S6A1 17-18 P7480S7 19-19 P7480S7A1 20-21  ///
P7480S8 22-22 P7480S8A1 23-24 P7480S9 25-25 P7480S9A1 26-27 P7480S10 28-28 P7480S10A1 29-30 P7480S11 31-31  ///
P7480S11A1 32-33 P7480S12 34-34 P7480S12A1 35-36 using SAS90cab07.TXT

gen ANO = 2007
gen MES = 7

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\otrasactividades7.dta", replace


*** OTROS INGRESOS ***
clear
infix P7495 1-2 P7500S1 3-3 P7500S1A1 4-13 P7500S2 14-14 P7500S2A1 15-24 P7500S3 25-25 P7500S3A1 26-35  ///
P7505 36-37 P7510S1 38-38 P7510S1A1 39-48 P7510S2 49-49 P7510S2A1 50-59 P7510S3 60-60 P7510S3A1 61-70  ///
P7510S4 71-71 P7510S4A1 72-81 P7510S5 82-82 P7510S5A1 83-92 P7510S6 93-93 P7510S6A1 94-103 I_DPTO 104-105  ///
FEX1 106-113 FEXHOG 114-121 I_ESTR 122-122 MPIO 123-127 SEGMENTO 128-130 REGIS 131-132 DIRECTORIO 133-140  /// 
SECUENCIA_ENCUESTA 141-148 SECUENCIA_P 149-156 ORDEN 157-164 CLASE 165-165 AREA 165-166 using SAS95cab07.TXT

gen ANO = 2007
gen MES = 7

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0707\CABECERA\Stata\otrosingresos7.dta", replace




*****************************
**LECTURA DEL MES DE AGOSTO**
*****************************

clear

cd "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\txt\"


*** VIVIENDA ***

clear
infix I_DPTO 297-298 FEXHOG 299-306 I_ESTR 317-317 MPIO 318-322 SEGMENTO 323-325 REGIS 326-327 ///
DIRECTORIO 328-335 SECUENCIA_ENCUESTA 336-343 SECUENCIA_P 344-351 AREA 352-353  ///
P4000 1-1 P4010 2-2 P4020 3-3 P4030S1 4-4 P4030S1A1 5-5 P4030S2 6-6 P4030S3 7-7 P4030S4 8-8 P4030S4A1 9-9 ///
P4030S5 10-10 P4040 11-11 P5000 12-13 P5010 14-15 P5020 16-16 P5030 17-17 P5040 18-18 P5050 19-20 ///
P5060 21-21 P5070 22-22 P5080 23-23 P5090 24-24 str P5090S1 25-54 P5100 55-64 P5110 65-74 P5120 75-75  ///
P5130 76-85 P5140 86-95 P5160S1 96-96 P5160S1A1 97-106 P5160S2 107-107 P5160S2A1 108-117 P5240 118-118 ///
P5250 119-128 P5230 129-129 P5150S1A1 130-130 P5150S1A2 131-131 P5150S1A3 132-132 P5150S1A4 133-133 ///
P5150S1A5 134-134 P5150S1A6 135-135 P5150S1A9 136-136 P5150S2A1 137-137 P5150S2A2 138-138 P5150S2A3 139-139 ///
P5150S2A4 140-140 P5150S2A5 141-141 P5150S2A6 142-142 P5150S2A9 143-143 P5150S3A1 144-144 P5150S3A2 145-145 ///
P5150S3A3 146-146 P5150S3A4 147-147 P5150S3A5 148-148 P5150S3A6 149-149 P5150S3A9 150-150 P5150S4A1 151-151 ///
P5150S4A2 152-152 P5150S4A3 153-153 P5150S4A4 154-154 P5150S4A5 155-155 P5150S4A6 156-156 P5150S4A9 157-157 ///
P5150S5A1 158-158 P5150S5A2 159-159 P5150S5A3 160-160 P5150S5A4 161-161 P5150S5A5 162-162 P5150S5A6 163-163 ///
P5150S5A9 164-164 P5150S6A1 165-165 P5150S6A2 166-166 P5150S6A3 167-167 P5150S6A4 168-168 P5150S6A5 169-169 ///
P5150S6A6 170-170 P5150S6A9 171-171 P5150S7A1 172-172 P5150S7A2 173-173 P5150S7A3 174-174 P5150S7A4 175-175 ///
P5150S7A5 176-176 P5150S7A6 177-177 P5150S7A9 178-178 P5150S8A1 179-179 P5150S8A2 180-180 P5150S8A3 181-181 ///
P5150S8A4 182-182 P5150S8A5 183-183 P5150S8A6 184-184 P5150S8A9 185-185 P5170 186-186 P5180 187-187 ///
P5180S1 188-197 P5180S2 198-207 P5185S1 208-208 P5185S2 209-209 P5185S3 210-210 P5185S4 211-211 P5185S5 212-212 ///
P5185S6 213-213 P5185S7 214-214 P5185S8 215-215 P5185S9 216-216 str P5185S9A1 217-246 str P5190S1A1 247-257 ///
P5190S2 258-258 P5190S2A1 259-268 P5210S1 269-269 P5210S2 270-270 P5210S3 271-271 P5210S4 272-272 P5210S5 273-273 ///
P5210S6 274-274 P5210S7 275-275 P5210S8 276-276 P5210S9 277-277 P5210S10 278-278 P5210S11 279-279 P5210S12 280-280 ///
P5210S13 281-281 P5210S14 282-282 P5210S15 283-283 P5210S16 284-284 P5210S17 285-285 P5210S18 286-286 ///
P5210S19 287-287 P5210S20 288-288 P5210S21 289-289 P5210S22 290-290 P5210S23 291-291 P5210S24 292-292 ///
P5220 293-293 P5220S1 294-295 using sas01cab08.TXT

gen ANO = 2007
gen MES = 8


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\vivienda8.dta", replace

*** CARACTERISTICAS GENERALES / EDUCACION  ***
clear
infix I_DPTO 118-119 FEX1 120-127 FEXHOG 128-135 I_ESTR 136-136 MPIO 137-141 SEGMENTO 142-144 ///
REGIS 145-146 DIRECTORIO 147-154 SECUENCIA_ENCUESTA 155-162 SECUENCIA_P 163-170 ORDEN 171-172 CLASE 173-173 ///
P6016 1-2 P6020 3-3 P6030S1 4-5 P6030S2 6-7 P6030S3 8-11 P6040  12-14 P6050  15-15 P6080 16-16 /// 
str P6080S1 17-46 P6060 47-47 P6060S1 48-48 P6070 49-49 P6090 50-50 P6140 51-51 P6150 52-54 P6100 55-55 ///
P6110 56-56 P6120 57-66 P6125 67-67 P6160 68-68 P6170 69-69 P6175 70-70 P6180 71-71 P6180S1 72-81 ///
P6180S2 82-91 P6190 92-92 P6190S1 93-102 P6200 103-103 P6200S1 104-113 P6210 114-114 P6210S1 115-116 ///
P6220 117-117 AREA 173-174 using SAS10cab08.TXT

gen ANO = 2007
gen MES = 8


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\educacion8.dta", replace


*** FUERZA DE TRABAJO ***

clear
infix I_DPTO 108-109 FEX1 110-117 FEXHOG 118-125 I_ESTR 126-126 MPIO  127-131 SEGMENTO 132-134 ///
REGIS 135-136 DIRECTORIO 137-144 SECUENCIA_ENCUESTA 145-152 SECUENCIA_P 153-160 ORDEN 161-162  ///
CLASE 163-163 AREA 163-164 P6230 1-2 P6240 3-3  str P6240S1 4-33 P6250 34-34 P6260 35-35 P6270 36-36 ///
P6280 37-37 P6290 38-38 str P6290S1 39-68 P6300 69-69 P6310 70-71 str P6310S1 72-101 P6320 102-102 P6330 103-103 ///
P6340 104-104 P6350 105-106 P6351 107-107 using SAS50cab08.TXT

gen ANO = 2007
gen MES = 8


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\ftrab8.dta", replace


*** OCUPADOS ***
clear
infix I_DPTO 1199-1200 FEX1 1201-1208 FEXHOG 1209-1216 I_ESTR 1217-1217 MPIO 1218-1222 SEGMENTO 1223-1225 ///
REGIS 1226-1227 DIRECTORIO 1228-1235 SECUENCIA_ENCUESTA 1236-1243 SECUENCIA_P 1244-1251 ORDEN 1252-1253 ///
CLASE 1254-1254 AREA 1254-1255 OFICIO 1-2 RAMA2D 3-4 P6440 5-5 P6450 6-6 P6460 7-7 P6460S1 8-9 P6465S1 10-10 ///
P6465S1A1 11-20 P6465S2 21-21 P6465S2A1 22-31 P6660S1 32-32 P6660S1A1 33-42 P6660S2 43-43 P6660S2A1 44-53 ///
P6400 54-54 P6422 55-55 P6424S1 56-56 P6424S2 57-57 P6424S3 58-58 P6424S4 59-59 P6426 60-62 P6430 63-63 ///
str P6430S1 64-93 P6480 94-94 str P6480S1 95-124 P6490 125-125 str P6490S1 126-155 P6500 156-165 P6510 166-166 ///
P6510S1 167-176 P6510S2 177-186 P6590 187-187  P6590S1 188-197 P6600 198-198 P6600S1 199-208 P6610 209-209 ///
P6610S1 210-219 P6620 220-220 P6620S1 221-230 P6585S1 231-231 P6585S1A1 232-241 P6585S1A2 242-251 P6585S2 252-252 /// 
P6585S2A1 253-262 P6585S2A2 263-272 P6585S3 273-273 P6585S3A1 274-283 P6585S3A2 284-293 P6585S4 294-294 ///
P6585S4A1 295-304 P6530 305-305 P6530S1 306-315 P6540 316-316 P6540S1 317-326 P6540S2 327-336 P6550 337-337 ///
P6550S1 338-347 P6550S2 348-357 P6560 358-358 P6560S1 359-368 P6560S2 369-378 P6570 379-379 P6570S1 380-389 ///
P6570S2 390-399 P6580 400-400 P6580S1 401-410 P6580S2 411-420 P6625 421-421 P6625S1 422-431 P6630S1 432-432 ///
P6630S1A1 433-442 P6630S2 443-443 P6630S2A1 444-453 P6630S3 454-454 P6630S3A1 455-464 P6630S4 465-465 P6630S4A1 466-475 ///
P6630S5 476-476 P6630S5A1 477-486 P6640 487-487 P6642S1 488-489 P6642S2 490-491 P6642S2A1 492-493 P6643S1 494-495 ///
P6643S2 496-497 P6643S2A1 498-499 P6644S1 500-501 P6644S2 502-503 P6644S2A1 504-505 P7650 506-506 P7660 507-510 ///
P7670 511-512 P7680 513-513 P7690 514-517 P7700 518-519 P7710 520-520 P7720 521-524 P7730 525-526 P6765 527-527 ///
str P6765S1 528-557 P6772 558-558 P6774 559-559 P7620 560-560 str P7620S1 561-590 P7630 591-591 str P7630S1 592-621 P7640S1 622-623 ///
P7640S2 624-625 P7640S3 626-627 P7640S4 628-629 P7640S5 630-631 P7640S6 632-633 P7640S7 634-635 P7640S8 636-637 ///
P7640S9 638-639 P7640S10 640-641 P7640S11 642-643 P7640S12 644-645 P7640S13 646-647 P7640S14 648-649 str P7640S14A1 650-679 ///
P6750 680-689 P6760 690-691 P550 692-701 P6780 702-702 str P6780S1 703-732 P6782 733-733 P6784 734-734 P7740 735-735 ///
P7750 736-739 P7760 740-741 P7770 742-742 P7780 743-746 P7790 747-748 P6790 749-750 P6800 751-753 P6810 754-754 ///
str P6810S1 755-784 P6850 785-787 P6830 788-788 str P6830S1 789-818 P6835 819-819 P6835S1 820-821 P6835S2 822-823 ///
P6836 824-824 P6836S1 825-826 P6836S2 827-828 P6837 829-829 P6837S1 830-831 P6837S2 832-833 P6870 834-834 ///
P6880 835-836 str P6880S1 837-866 P6895 867-867 P6900 868-869 str P6900S1 870-899 P6910 900-901 str P6910S1 902-931 P6920 932-932 ///
P6930 933-933 P6940 934-934 P6950 935-944 P6960 945-946 P6970 947-948 str P6970S1 949-978 P6980S1 979-979 P6980S2 980-980 ///
P6980S3 981-981 P6980S4 982-982 P6980S5 983-983 P6980S6 984-984 P6980S7 985-985 str P6980S7A1 986-1015 P6980S8 1016-1016 ///
P6990 1017-1017 P7000 1018-1018 P7019 1019-1019 P7020 1020-1020 P7022 1021-1021 P7024 1022-1022 P7026 1023-1025 ///
P7028 1026-1026 str P7028S1 1027-1056 P7040 1057-1057 P7045 1058-1059 P7050 1060-1060 str P7050S1 1061-1090 P7070 1091-1100 ///
P7080 1101-1110 P7090 1111-1111 P7100 1112-1113 P7110 1114-1114 P7120 1115-1115 P7130 1116-1116 P7140S1 1117-1117 ///
P7140S2 1118-1118 P7140S3 1119-1119 P7140S4 1120-1120 P7140S5 1121-1121 P7140S6 1122-1122 P7140S7 1123-1123 ///
P7140S8 1124-1124 P7140S9 1125-1125 str P7140S9A1 1126-1155 P7150 1156-1156 P7160 1157-1157 P7170S1 1158-1158 ///
P7170S2 1159-1159 P7170S3 1160-1160 P7170S4 1161-1161 P7170S5 1162-1162 P7170S6 1163-1163 P7180 1164-1164 /// 
P7190 1165-1165 P7200 1166-1166 P7240 1167-1168 str P7240S1 1169-1198 using SAS60cab08.TXT

gen ANO = 2007
gen MES = 8


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\ocupados8.dta", replace



*** DESOCUPADOS ***

clear 

infix I_DPTO 239-240 FEX1 241-248 FEXHOG 249-256 I_ESTR 258-258 MPIO 259-263 SEGMENTO 264-266 REGIS 269-270 ///
DIRECTORIO 271-278 SECUENCIA_ENCUESTA 279-286 SECUENCIA_P 287-294 ORDEN 295-302 CLASE 303-303 AREA 303-304 ///
P7250 1-3 P7260 4-6 OFICIO1 7-8 P7280 9-9 str P7280S1 10-39 P7290 40-40 P7300 41-41 P7310 42-42 P7320 43-45 ///
OFICIO2 46-47 RAMA2D_D 48-49 P7350 50-50 str P7350S1 51-80 P7360 81-81 P7370 82-82 P7380 83-84 str P7380S1 85-114 ///
P7390 115-115 str P7390S1 116-145 P7400 146-146 P7410 147-148 str P7410S1 149-178 P7420S1 179-179 P7420S2 180-180 ///
P7420S3 181-181 P7420S4 182-182 P7420S5 183-183 P7420S6 184-184 P7420S7 185-185 str P7420S7A1 186-215 P7420S8 216-216 ///
P7422 217-217 P7422S1 218-227 P7424 228-228 P7424S1 229-238 using SAS70cab08.TXT

gen ANO = 2007
gen MES = 8


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\desocupados8.dta", replace


*** INACTIVOS ***
clear 
infix I_DPTO 58-59 FEX1 60-67 FEXHOG 68-75 I_ESTR 76-76 MPIO 77-81 SEGMENTO 82-84 REGIS 85-86 ///
DIRECTORIO 87-94 SECUENCIA_ENCUESTA 95-102 SECUENCIA_P 103-110 ORDEN 111-118 CLASE 119-119 AREA 119-120 ///
P7430 1-1 P7440 2-2 P7450 3-3 str P7450S1 4-33 P7460 34-34 P7470 35-35 P7472 36-36 P7472S1 37-46 P7490 47-47 ///
P7490S1 48-57 using SAS80cab08.TXT

gen ANO = 2007
gen MES = 8

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\inactivos8.dta", replace


*** OTRAS ACTIVIDADES ***
clear
infix I_DPTO 37-38 FEX1 39-46 FEXHOG 47-54 I_ESTR 55-55 MPIO 56-60 SEGMENTO 61-63 REGIS 64-65  ///
DIRECTORIO 66-73 SECUENCIA_ENCUESTA 74-81 SECUENCIA_P 82-89 ORDEN 90-97 CLASE 98-98 AREA 98-99  ///
P7480S1 1-1 P7480S1A1 2-3 P7480S2 4-4 P7480S2A1 5-6 P7480S3 7-7 P7480S3A1 8-9 P7480S4 10-10  ///
P7480S4A1 11-12 P7480S5 13-13 P7480S5A1 14-15 P7480S6 16-16 P7480S6A1 17-18 P7480S7 19-19 P7480S7A1 20-21  ///
P7480S8 22-22 P7480S8A1 23-24 P7480S9 25-25 P7480S9A1 26-27 P7480S10 28-28 P7480S10A1 29-30 P7480S11 31-31  ///
P7480S11A1 32-33 P7480S12 34-34 P7480S12A1 35-36 using SAS90cab08.TXT

gen ANO = 2007
gen MES = 8

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\otrasactividades8.dta", replace


*** OTROS INGRESOS ***
clear
infix P7495 1-2 P7500S1 3-3 P7500S1A1 4-13 P7500S2 14-14 P7500S2A1 15-24 P7500S3 25-25 P7500S3A1 26-35  ///
P7505 36-37 P7510S1 38-38 P7510S1A1 39-48 P7510S2 49-49 P7510S2A1 50-59 P7510S3 60-60 P7510S3A1 61-70  ///
P7510S4 71-71 P7510S4A1 72-81 P7510S5 82-82 P7510S5A1 83-92 P7510S6 93-93 P7510S6A1 94-103 I_DPTO 104-105  ///
FEX1 106-113 FEXHOG 114-121 I_ESTR 122-122 MPIO 123-127 SEGMENTO 128-130 REGIS 131-132 DIRECTORIO 133-140  /// 
SECUENCIA_ENCUESTA 141-148 SECUENCIA_P 149-156 ORDEN 157-164 CLASE 165-165 AREA 165-166 using SAS95cab08.TXT

gen ANO = 2007
gen MES = 8

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0708\CABECERA\Stata\otrosingresos8.dta", replace


*********************************
**LECTURA DEL MES DE SEPTIEMBRE**
*********************************

clear

cd "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\txt\"


*** VIVIENDA ***

clear
infix I_DPTO 297-298 FEXHOG 299-306 I_ESTR 317-317 MPIO 318-322 SEGMENTO 323-325 REGIS 326-327 ///
DIRECTORIO 328-335 SECUENCIA_ENCUESTA 336-343 SECUENCIA_P 344-351 AREA 352-353  ///
P4000 1-1 P4010 2-2 P4020 3-3 P4030S1 4-4 P4030S1A1 5-5 P4030S2 6-6 P4030S3 7-7 P4030S4 8-8 P4030S4A1 9-9 ///
P4030S5 10-10 P4040 11-11 P5000 12-13 P5010 14-15 P5020 16-16 P5030 17-17 P5040 18-18 P5050 19-20 ///
P5060 21-21 P5070 22-22 P5080 23-23 P5090 24-24 str P5090S1 25-54 P5100 55-64 P5110 65-74 P5120 75-75  ///
P5130 76-85 P5140 86-95 P5160S1 96-96 P5160S1A1 97-106 P5160S2 107-107 P5160S2A1 108-117 P5240 118-118 ///
P5250 119-128 P5230 129-129 P5150S1A1 130-130 P5150S1A2 131-131 P5150S1A3 132-132 P5150S1A4 133-133 ///
P5150S1A5 134-134 P5150S1A6 135-135 P5150S1A9 136-136 P5150S2A1 137-137 P5150S2A2 138-138 P5150S2A3 139-139 ///
P5150S2A4 140-140 P5150S2A5 141-141 P5150S2A6 142-142 P5150S2A9 143-143 P5150S3A1 144-144 P5150S3A2 145-145 ///
P5150S3A3 146-146 P5150S3A4 147-147 P5150S3A5 148-148 P5150S3A6 149-149 P5150S3A9 150-150 P5150S4A1 151-151 ///
P5150S4A2 152-152 P5150S4A3 153-153 P5150S4A4 154-154 P5150S4A5 155-155 P5150S4A6 156-156 P5150S4A9 157-157 ///
P5150S5A1 158-158 P5150S5A2 159-159 P5150S5A3 160-160 P5150S5A4 161-161 P5150S5A5 162-162 P5150S5A6 163-163 ///
P5150S5A9 164-164 P5150S6A1 165-165 P5150S6A2 166-166 P5150S6A3 167-167 P5150S6A4 168-168 P5150S6A5 169-169 ///
P5150S6A6 170-170 P5150S6A9 171-171 P5150S7A1 172-172 P5150S7A2 173-173 P5150S7A3 174-174 P5150S7A4 175-175 ///
P5150S7A5 176-176 P5150S7A6 177-177 P5150S7A9 178-178 P5150S8A1 179-179 P5150S8A2 180-180 P5150S8A3 181-181 ///
P5150S8A4 182-182 P5150S8A5 183-183 P5150S8A6 184-184 P5150S8A9 185-185 P5170 186-186 P5180 187-187 ///
P5180S1 188-197 P5180S2 198-207 P5185S1 208-208 P5185S2 209-209 P5185S3 210-210 P5185S4 211-211 P5185S5 212-212 ///
P5185S6 213-213 P5185S7 214-214 P5185S8 215-215 P5185S9 216-216 str P5185S9A1 217-246 str P5190S1A1 247-257 ///
P5190S2 258-258 P5190S2A1 259-268 P5210S1 269-269 P5210S2 270-270 P5210S3 271-271 P5210S4 272-272 P5210S5 273-273 ///
P5210S6 274-274 P5210S7 275-275 P5210S8 276-276 P5210S9 277-277 P5210S10 278-278 P5210S11 279-279 P5210S12 280-280 ///
P5210S13 281-281 P5210S14 282-282 P5210S15 283-283 P5210S16 284-284 P5210S17 285-285 P5210S18 286-286 ///
P5210S19 287-287 P5210S20 288-288 P5210S21 289-289 P5210S22 290-290 P5210S23 291-291 P5210S24 292-292 ///
P5220 293-293 P5220S1 294-295 using sas01cab09.TXT

gen ANO = 2007
gen MES = 9


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\vivienda9.dta", replace


*** CARACTERISTICAS GENERALES / EDUCACION  ***
clear
infix I_DPTO 118-119 FEX1 120-127 FEXHOG 128-135 I_ESTR 136-136 MPIO 137-141 SEGMENTO 142-144 ///
REGIS 145-146 DIRECTORIO 147-154 SECUENCIA_ENCUESTA 155-162 SECUENCIA_P 163-170 ORDEN 171-172 CLASE 173-173 ///
P6016 1-2 P6020 3-3 P6030S1 4-5 P6030S2 6-7 P6030S3 8-11 P6040  12-14 P6050  15-15 P6080 16-16 /// 
str P6080S1 17-46 P6060 47-47 P6060S1 48-48 P6070 49-49 P6090 50-50 P6140 51-51 P6150 52-54 P6100 55-55 ///
P6110 56-56 P6120 57-66 P6125 67-67 P6160 68-68 P6170 69-69 P6175 70-70 P6180 71-71 P6180S1 72-81 ///
P6180S2 82-91 P6190 92-92 P6190S1 93-102 P6200 103-103 P6200S1 104-113 P6210 114-114 P6210S1 115-116 ///
P6220 117-117 AREA 173-174 using SAS10cab09.TXT

gen ANO = 2007
gen MES = 9


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\educacion9.dta", replace


*** FUERZA DE TRABAJO ***

clear
infix I_DPTO 108-109 FEX1 110-117 FEXHOG 118-125 I_ESTR 126-126 MPIO  127-131 SEGMENTO 132-134 ///
REGIS 135-136 DIRECTORIO 137-144 SECUENCIA_ENCUESTA 145-152 SECUENCIA_P 153-160 ORDEN 161-162  ///
CLASE 163-163 AREA 163-164 P6230 1-2 P6240 3-3  str P6240S1 4-33 P6250 34-34 P6260 35-35 P6270 36-36 ///
P6280 37-37 P6290 38-38 str P6290S1 39-68 P6300 69-69 P6310 70-71 str P6310S1 72-101 P6320 102-102 P6330 103-103 ///
P6340 104-104 P6350 105-106 P6351 107-107 using SAS50cab09.TXT

gen ANO = 2007
gen MES = 9


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\ftrab9.dta", replace


*** OCUPADOS ***
clear
infix I_DPTO 1199-1200 FEX1 1201-1208 FEXHOG 1209-1216 I_ESTR 1217-1217 MPIO 1218-1222 SEGMENTO 1223-1225 ///
REGIS 1226-1227 DIRECTORIO 1228-1235 SECUENCIA_ENCUESTA 1236-1243 SECUENCIA_P 1244-1251 ORDEN 1252-1253 ///
CLASE 1254-1254 AREA 1254-1255 OFICIO 1-2 RAMA2D 3-4 P6440 5-5 P6450 6-6 P6460 7-7 P6460S1 8-9 P6465S1 10-10 ///
P6465S1A1 11-20 P6465S2 21-21 P6465S2A1 22-31 P6660S1 32-32 P6660S1A1 33-42 P6660S2 43-43 P6660S2A1 44-53 ///
P6400 54-54 P6422 55-55 P6424S1 56-56 P6424S2 57-57 P6424S3 58-58 P6424S4 59-59 P6426 60-62 P6430 63-63 ///
str P6430S1 64-93 P6480 94-94 str P6480S1 95-124 P6490 125-125 str P6490S1 126-155 P6500 156-165 P6510 166-166 ///
P6510S1 167-176 P6510S2 177-186 P6590 187-187  P6590S1 188-197 P6600 198-198 P6600S1 199-208 P6610 209-209 ///
P6610S1 210-219 P6620 220-220 P6620S1 221-230 P6585S1 231-231 P6585S1A1 232-241 P6585S1A2 242-251 P6585S2 252-252 /// 
P6585S2A1 253-262 P6585S2A2 263-272 P6585S3 273-273 P6585S3A1 274-283 P6585S3A2 284-293 P6585S4 294-294 ///
P6585S4A1 295-304 P6530 305-305 P6530S1 306-315 P6540 316-316 P6540S1 317-326 P6540S2 327-336 P6550 337-337 ///
P6550S1 338-347 P6550S2 348-357 P6560 358-358 P6560S1 359-368 P6560S2 369-378 P6570 379-379 P6570S1 380-389 ///
P6570S2 390-399 P6580 400-400 P6580S1 401-410 P6580S2 411-420 P6625 421-421 P6625S1 422-431 P6630S1 432-432 ///
P6630S1A1 433-442 P6630S2 443-443 P6630S2A1 444-453 P6630S3 454-454 P6630S3A1 455-464 P6630S4 465-465 P6630S4A1 466-475 ///
P6630S5 476-476 P6630S5A1 477-486 P6640 487-487 P6642S1 488-489 P6642S2 490-491 P6642S2A1 492-493 P6643S1 494-495 ///
P6643S2 496-497 P6643S2A1 498-499 P6644S1 500-501 P6644S2 502-503 P6644S2A1 504-505 P7650 506-506 P7660 507-510 ///
P7670 511-512 P7680 513-513 P7690 514-517 P7700 518-519 P7710 520-520 P7720 521-524 P7730 525-526 P6765 527-527 ///
str P6765S1 528-557 P6772 558-558 P6774 559-559 P7620 560-560 str P7620S1 561-590 P7630 591-591 str P7630S1 592-621 P7640S1 622-623 ///
P7640S2 624-625 P7640S3 626-627 P7640S4 628-629 P7640S5 630-631 P7640S6 632-633 P7640S7 634-635 P7640S8 636-637 ///
P7640S9 638-639 P7640S10 640-641 P7640S11 642-643 P7640S12 644-645 P7640S13 646-647 P7640S14 648-649 str P7640S14A1 650-679 ///
P6750 680-689 P6760 690-691 P550 692-701 P6780 702-702 str P6780S1 703-732 P6782 733-733 P6784 734-734 P7740 735-735 ///
P7750 736-739 P7760 740-741 P7770 742-742 P7780 743-746 P7790 747-748 P6790 749-750 P6800 751-753 P6810 754-754 ///
str P6810S1 755-784 P6850 785-787 P6830 788-788 str P6830S1 789-818 P6835 819-819 P6835S1 820-821 P6835S2 822-823 ///
P6836 824-824 P6836S1 825-826 P6836S2 827-828 P6837 829-829 P6837S1 830-831 P6837S2 832-833 P6870 834-834 ///
P6880 835-836 str P6880S1 837-866 P6895 867-867 P6900 868-869 str P6900S1 870-899 P6910 900-901 str P6910S1 902-931 P6920 932-932 ///
P6930 933-933 P6940 934-934 P6950 935-944 P6960 945-946 P6970 947-948 str P6970S1 949-978 P6980S1 979-979 P6980S2 980-980 ///
P6980S3 981-981 P6980S4 982-982 P6980S5 983-983 P6980S6 984-984 P6980S7 985-985 str P6980S7A1 986-1015 P6980S8 1016-1016 ///
P6990 1017-1017 P7000 1018-1018 P7019 1019-1019 P7020 1020-1020 P7022 1021-1021 P7024 1022-1022 P7026 1023-1025 ///
P7028 1026-1026 str P7028S1 1027-1056 P7040 1057-1057 P7045 1058-1059 P7050 1060-1060 str P7050S1 1061-1090 P7070 1091-1100 ///
P7080 1101-1110 P7090 1111-1111 P7100 1112-1113 P7110 1114-1114 P7120 1115-1115 P7130 1116-1116 P7140S1 1117-1117 ///
P7140S2 1118-1118 P7140S3 1119-1119 P7140S4 1120-1120 P7140S5 1121-1121 P7140S6 1122-1122 P7140S7 1123-1123 ///
P7140S8 1124-1124 P7140S9 1125-1125 str P7140S9A1 1126-1155 P7150 1156-1156 P7160 1157-1157 P7170S1 1158-1158 ///
P7170S2 1159-1159 P7170S3 1160-1160 P7170S4 1161-1161 P7170S5 1162-1162 P7170S6 1163-1163 P7180 1164-1164 /// 
P7190 1165-1165 P7200 1166-1166 P7240 1167-1168 str P7240S1 1169-1198 using SAS60cab09.TXT

gen ANO = 2007
gen MES = 9


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\ocupados9.dta", replace



*** DESOCUPADOS ***

clear 

infix I_DPTO 239-240 FEX1 241-248 FEXHOG 249-256 I_ESTR 258-258 MPIO 259-263 SEGMENTO 264-266 REGIS 269-270 ///
DIRECTORIO 271-278 SECUENCIA_ENCUESTA 279-286 SECUENCIA_P 287-294 ORDEN 295-302 CLASE 303-303 AREA 303-304 ///
P7250 1-3 P7260 4-6 OFICIO1 7-8 P7280 9-9 str P7280S1 10-39 P7290 40-40 P7300 41-41 P7310 42-42 P7320 43-45 ///
OFICIO2 46-47 RAMA2D_D 48-49 P7350 50-50 str P7350S1 51-80 P7360 81-81 P7370 82-82 P7380 83-84 str P7380S1 85-114 ///
P7390 115-115 str P7390S1 116-145 P7400 146-146 P7410 147-148 str P7410S1 149-178 P7420S1 179-179 P7420S2 180-180 ///
P7420S3 181-181 P7420S4 182-182 P7420S5 183-183 P7420S6 184-184 P7420S7 185-185 str P7420S7A1 186-215 P7420S8 216-216 ///
P7422 217-217 P7422S1 218-227 P7424 228-228 P7424S1 229-238 using SAS70cab09.TXT

gen ANO = 2007
gen MES = 9


save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\desocupados9.dta", replace


*** INACTIVOS ***
clear 
infix I_DPTO 58-59 FEX1 60-67 FEXHOG 68-75 I_ESTR 76-76 MPIO 77-81 SEGMENTO 82-84 REGIS 85-86 ///
DIRECTORIO 87-94 SECUENCIA_ENCUESTA 95-102 SECUENCIA_P 103-110 ORDEN 111-118 CLASE 119-119 AREA 119-120 ///
P7430 1-1 P7440 2-2 P7450 3-3 str P7450S1 4-33 P7460 34-34 P7470 35-35 P7472 36-36 P7472S1 37-46 P7490 47-47 ///
P7490S1 48-57 using SAS80cab09.TXT

gen ANO = 2007
gen MES = 9

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\inactivos9.dta", replace


*** OTRAS ACTIVIDADES ***
clear
infix I_DPTO 37-38 FEX1 39-46 FEXHOG 47-54 I_ESTR 55-55 MPIO 56-60 SEGMENTO 61-63 REGIS 64-65  ///
DIRECTORIO 66-73 SECUENCIA_ENCUESTA 74-81 SECUENCIA_P 82-89 ORDEN 90-97 CLASE 98-98 AREA 98-99  ///
P7480S1 1-1 P7480S1A1 2-3 P7480S2 4-4 P7480S2A1 5-6 P7480S3 7-7 P7480S3A1 8-9 P7480S4 10-10  ///
P7480S4A1 11-12 P7480S5 13-13 P7480S5A1 14-15 P7480S6 16-16 P7480S6A1 17-18 P7480S7 19-19 P7480S7A1 20-21  ///
P7480S8 22-22 P7480S8A1 23-24 P7480S9 25-25 P7480S9A1 26-27 P7480S10 28-28 P7480S10A1 29-30 P7480S11 31-31  ///
P7480S11A1 32-33 P7480S12 34-34 P7480S12A1 35-36 using SAS90cab09.TXT

gen ANO = 2007
gen MES = 9

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\otrasactividades9.dta", replace


*** OTROS INGRESOS ***
clear
infix P7495 1-2 P7500S1 3-3 P7500S1A1 4-13 P7500S2 14-14 P7500S2A1 15-24 P7500S3 25-25 P7500S3A1 26-35  ///
P7505 36-37 P7510S1 38-38 P7510S1A1 39-48 P7510S2 49-49 P7510S2A1 50-59 P7510S3 60-60 P7510S3A1 61-70  ///
P7510S4 71-71 P7510S4A1 72-81 P7510S5 82-82 P7510S5A1 83-92 P7510S6 93-93 P7510S6A1 94-103 I_DPTO 104-105  ///
FEX1 106-113 FEXHOG 114-121 I_ESTR 122-122 MPIO 123-127 SEGMENTO 128-130 REGIS 131-132 DIRECTORIO 133-140  /// 
SECUENCIA_ENCUESTA 141-148 SECUENCIA_P 149-156 ORDEN 157-164 CLASE 165-165 AREA 165-166 using SAS95cab09.TXT

gen ANO = 2007
gen MES = 9

save "${surveysFolder}\Colombia\2007\GEIH\3thquarter\Datos originales\0709\CABECERA\Stata\otrosingresos9.dta", replace


	
