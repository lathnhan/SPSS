* Encoding: windows-1252.
set printback=no.
*get file='x:\editing\wave 15\scq data\oscq04b.sav'.
*sort cases by ohhscqid.
*exe.
*save outfile='E:\n\data\oscq04.sav'.
*get file='E:\n\data partial\oscq04.sav' /keep=ohhscqid ohhpid.
*sort cases by ohhscqid.
*match file file='E:\n\data\oscq04.sav'/file=*/in=inpart/by ohhscqid.
*sel if ~inpart.

* get file='x:\editing\wave 15\scq data\oscq03.sav'.
* match files file=*/file='x:\editing\wave 15\scq data\n-final-new-scqs.sav'/in=innew/by ohhscqid.
* exe.

get file='x:\editing\wave 15\scq data\oscq04b.sav'.

get file='X:\Editing\wave 15\scq data\partial-ids.sav'.
sort cases by ohhscqid.
match files file='x:\editing\wave 15\scq data\oscq04b.sav' /in=fromscq
/file='X:\Editing\wave 15\scq data\partial-ids.sav' /in=frompartial
/by ohhscqid.
select if frompartial=0. 
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ life events\Final data\oscq04b-life events-final.sav'.
show n.
exe.

get file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ life events\Final data\oscq04b-life events-final.sav'.

sort cases by ohhscqid.
* save outfile='C:\Laura M\w14\w14-life events\scq data\oscq04b.sav'.
* get file='x:\editing\wave 15\scq data\oscq-dir.sav'.
* sort cases by ohhscqid.
* save outfile='x:\editing\wave 15\scq data\oscq-dir.sav'.
* get file='x:\hilda\release 140\files\spss 14u\Rperson n140u.sav'.
* select if ohhscqid ne 'Unmat'.
* sort cases by ohhscqid.
* match files file=*/ file='x:\editing\wave 15\scq data\oscq04.sav' / file='x:\editing\wave 15\scq data\oscq-dir.sav'/ by ohhscqid.

* the state of the switches determine which type of issues will be searched for and outputted to the spreadsheets.
* if switch1 to switch5 all contain the value 1, then all issue types will be searched for and outputted to the spreadsheets.
* however, testing for issues of any type can be switched off if not required by setting respective switches to 0.
compute switch1=1.   /* test for instances where stem='no' but one (or more) quarters have been answered */
compute switch2=1.   /* test for instances where stem=missing but one (or more) quarters have been answered */
compute switch3=1.   /* test for instances where stem='yes' but none of the quarters have been answered */
compute switch4=1.   /* test for instances where stem=-5 (multi-response) */
compute switch5=1.   /* test for instances where more than seven 'yes' responses */

string 
 mar_1n sep_1n rcl_1n prg_1n bth_1n ins_1n inf_1n dsc_1n drl_1n dfr_1n vio_1n pcm_1n jls_1n 
 jlf_1n rtr_1n frd_1n job_1n prm_1n fni_1n fnw_1n mvd_1n dhm_1n (a6) 
 mar_2n sep_2n rcl_2n prg_2n bth_2n ins_2n inf_2n dsc_2n drl_2n dfr_2n vio_2n pcm_2n jls_2n 
 jlf_2n rtr_2n frd_2n job_2n prm_2n fni_2n fnw_2n mvd_2n dhm_2n (a8) 
 mar_3n sep_3n rcl_3n prg_3n bth_3n ins_3n inf_3n dsc_3n drl_3n dfr_3n vio_3n pcm_3n jls_3n 
 jlf_3n rtr_3n frd_3n job_3n prm_3n fni_3n fnw_3n mvd_3n dhm_3n (a8) 
 mar_4n sep_4n rcl_4n prg_4n bth_4n ins_4n inf_4n dsc_4n drl_4n dfr_4n vio_4n pcm_4n jls_4n 
 jlf_4n rtr_4n frd_4n job_4n prm_4n fni_4n fnw_4n mvd_4n dhm_4n (a5) 
 mar_5n sep_5n rcl_5n prg_5n bth_5n ins_5n inf_5n dsc_5n drl_5n dfr_5n vio_5n pcm_5n jls_5n 
 jlf_5n rtr_5n frd_5n job_5n prm_5n fni_5n fnw_5n mvd_5n dhm_5n (a5).

* the variable 'add' is used in the process of counting the number of items containing type x issues.
* note: a count of items with type 5 issues is not relevant, what is relevant is whether any given SCQ has a type 5 issue or not. 
do repeat add=add1 add2 add3 add4.
compute add=0.
end repeat.
* the variable 'scq' is used in the process of counting the number of SCQs containing type x issues.
do repeat scq=scq1 scq2 scq3 scq4 scq5.
compute scq=0.
end repeat.

* for each type of issue, identify cases for verification with the TIF scans.
* simultaneously, set the output alert messages in the spreadsheets for each issue type, and count the occurrence of issues.

* determine SCQs with type 5 issues in advance of other issues.
do if switch5 eq 1.
count yeses=olemar olesep olercl oleprg olebth oleins oleinf oledsc oledrl oledfr olevio olepcm olejls 
 olejlf olertr olefrd olejob oleprm olefni olefnw olemvd oledhm (2).
if yeses gt 7 scq5=1.
end if.

do repeat stem=olemar olesep olercl oleprg olebth oleins oleinf oledsc oledrl oledfr olevio olepcm olejls 
 olejlf olertr olefrd olejob oleprm olefni olefnw olemvd oledhm 
 / q1=olemarq1 olesepq1 olerclq1 oleprgq1 olebthq1 oleinsq1 oleinfq1 oledscq1 oledrlq1 oledfrq1 olevioq1 olepcmq1 olejlsq1 
 olejlfq1 olertrq1 olefrdq1 olejobq1 oleprmq1 olefniq1 olefnwq1 olemvdq1 oledhmq1 
 / q2=olemarq2 olesepq2 olerclq2 oleprgq2 olebthq2 oleinsq2 oleinfq2 oledscq2 oledrlq2 oledfrq2 olevioq2 olepcmq2 olejlsq2 
 olejlfq2 olertrq2 olefrdq2 olejobq2 oleprmq2 olefniq2 olefnwq2 olemvdq2 oledhmq2 
 / q3=olemarq3 olesepq3 olerclq3 oleprgq3 olebthq3 oleinsq3 oleinfq3 oledscq3 oledrlq3 oledfrq3 olevioq3 olepcmq3 olejlsq3 
 olejlfq3 olertrq3 olefrdq3 olejobq3 oleprmq3 olefniq3 olefnwq3 olemvdq3 oledhmq3 
 / q4=olemarq4 olesepq4 olerclq4 oleprgq4 olebthq4 oleinsq4 oleinfq4 oledscq4 oledrlq4 oledfrq4 olevioq4 olepcmq4 olejlsq4 
 olejlfq4 olertrq4 olefrdq4 olejobq4 oleprmq4 olefniq4 olefnwq4 olemvdq4 oledhmq4 
 / na=olemarna olesepna olerclna oleprgna olebthna oleinsna oleinfna oledscna oledrlna oledfrna oleviona olepcmna olejlsna 
 olejlfna olertrna olefrdna olejobna oleprmna olefnina olefnwna olemvdna oledhmna 
 / flag1=mar_1 sep_1 rcl_1 prg_1 bth_1 ins_1 inf_1 dsc_1 drl_1 dfr_1 vio_1 pcm_1 jls_1 
 jlf_1 rtr_1 frd_1 job_1 prm_1 fni_1 fnw_1 mvd_1 dhm_1 
 / flag1n=mar_1n sep_1n rcl_1n prg_1n bth_1n ins_1n inf_1n dsc_1n drl_1n dfr_1n vio_1n pcm_1n jls_1n 
 jlf_1n rtr_1n frd_1n job_1n prm_1n fni_1n fnw_1n mvd_1n dhm_1n 
 / flag2=mar_2 sep_2 rcl_2 prg_2 bth_2 ins_2 inf_2 dsc_2 drl_2 dfr_2 vio_2 pcm_2 jls_2 
 jlf_2 rtr_2 frd_2 job_2 prm_2 fni_2 fnw_2 mvd_2 dhm_2 
 / flag2n=mar_2n sep_2n rcl_2n prg_2n bth_2n ins_2n inf_2n dsc_2n drl_2n dfr_2n vio_2n pcm_2n jls_2n 
 jlf_2n rtr_2n frd_2n job_2n prm_2n fni_2n fnw_2n mvd_2n dhm_2n 
 / flag3=mar_3 sep_3 rcl_3 prg_3 bth_3 ins_3 inf_3 dsc_3 drl_3 dfr_3 vio_3 pcm_3 jls_3 
 jlf_3 rtr_3 frd_3 job_3 prm_3 fni_3 fnw_3 mvd_3 dhm_3 
 / flag3n=mar_3n sep_3n rcl_3n prg_3n bth_3n ins_3n inf_3n dsc_3n drl_3n dfr_3n vio_3n pcm_3n jls_3n 
 jlf_3n rtr_3n frd_3n job_3n prm_3n fni_3n fnw_3n mvd_3n dhm_3n 
 / flag4=mar_4 sep_4 rcl_4 prg_4 bth_4 ins_4 inf_4 dsc_4 drl_4 dfr_4 vio_4 pcm_4 jls_4 
 jlf_4 rtr_4 frd_4 job_4 prm_4 fni_4 fnw_4 mvd_4 dhm_4 
 / flag4n=mar_4n sep_4n rcl_4n prg_4n bth_4n ins_4n inf_4n dsc_4n drl_4n dfr_4n vio_4n pcm_4n jls_4n 
 jlf_4n rtr_4n frd_4n job_4n prm_4n fni_4n fnw_4n mvd_4n dhm_4n 
 / flag5=mar_5 sep_5 rcl_5 prg_5 bth_5 ins_5 inf_5 dsc_5 drl_5 dfr_5 vio_5 pcm_5 jls_5 
 jlf_5 rtr_5 frd_5 job_5 prm_5 fni_5 fnw_5 mvd_5 dhm_5 
 / flag5n=mar_5n sep_5n rcl_5n prg_5n bth_5n ins_5n inf_5n dsc_5n drl_5n dfr_5n vio_5n pcm_5n jls_5n 
 jlf_5n rtr_5n frd_5n job_5n prm_5n fni_5n fnw_5n mvd_5n dhm_5n.

* type 1 anomaly: stem='no' but one (or more) quarters have been answered.
if switch1 eq 1 and (stem eq 1 and any(1,q1,q2,q3,q4)) flag1=1.
compute flag1n=' '.
if flag1 eq 1 flag1n='no+qtr'.
if flag1 eq 1 add1=add1+1.
leave add1.
* type 2 anomaly: stem=missing but one (or more) quarters have been answered.
if switch2 eq 1 and (value(stem) eq -4 and any(1,q1,q2,q3,q4)) flag2=1.
compute flag2n=' '.
if flag2 eq 1 flag2n='miss+qtr'.
if flag2 eq 1 add2=add2+1.
leave add2.
* type 3 anomaly: stem='yes' but none of the quarters have been answered.
if switch3 eq 1 and (stem eq 2 and na eq 1) flag3=1.
compute flag3n=' '.
if flag3 eq 1 flag3n='yes+miss'.
if flag3 eq 1 add3=add3+1.
leave add3.
* type 4 anomaly: stem=-5 (multi-response).
if switch4 eq 1 and (value(stem) eq -5) flag4=1.
compute flag4n=' '.
if flag4 eq 1 flag4n='multi'.
if flag4 eq 1 add4=add4+1.
leave add4.
* type 5 (potential) anomaly (possibility that 'yes' and 'no' columns have been mixed): more than seven 'yes' responses.
compute flag5n=' '.
if switch5 eq 1 and (scq5 eq 1 and stem eq 2) flag5=1.
if switch5 eq 1 and (scq5 eq 1 and stem eq 2) flag5n='yes>7'.
end repeat.

if any(1,mar_1,sep_1,rcl_1,prg_1,bth_1,ins_1,inf_1,dsc_1,drl_1,dfr_1,vio_1,pcm_1,jls_1, 
 jlf_1,rtr_1,frd_1,job_1,prm_1,fni_1,fnw_1,mvd_1,dhm_1) scq1=1.
if any(1,mar_2,sep_2,rcl_2,prg_2,bth_2,ins_2,inf_2,dsc_2,drl_2,dfr_2,vio_2,pcm_2,jls_2, 
 jlf_2,rtr_2,frd_2,job_2,prm_2,fni_2,fnw_2,mvd_2,dhm_2) scq2=1.
if any(1,mar_3,sep_3,rcl_3,prg_3,bth_3,ins_3,inf_3,dsc_3,drl_3,dfr_3,vio_3,pcm_3,jls_3, 
 jlf_3,rtr_3,frd_3,job_3,prm_3,fni_3,fnw_3,mvd_3,dhm_3) scq3=1.
if any(1,mar_4,sep_4,rcl_4,prg_4,bth_4,ins_4,inf_4,dsc_4,drl_4,dfr_4,vio_4,pcm_4,jls_4, 
 jlf_4,rtr_4,frd_4,job_4,prm_4,fni_4,fnw_4,mvd_4,dhm_4) scq4=1.
* scq5 already done.

* itemcnt monitors the number of items (across all SCQs) that contain a type x issue (assuming type x is switched on).
*    (a given SCQ may have several items which contain a type x issue).
do repeat itemcnt=t1items t2items t3items t4items / add=add1 add2 add3 add4.
compute itemcnt=itemcnt+add.
leave itemcnt.
end repeat.
variable labels 
 t1items 'count of items with stem=no but one (or more) quarters answered' / 
 t2items 'count of items with stem=missing but one (or more) quarters answered' / 
 t3items 'count of items with stem=yes but none of the quarters answered' / 
 t4items 'count of items with stem=-5 (multi-response)'.
descriptives t1items t2items t3items t4items / statistics=max.

* scqcnt monitors the number of SCQs that contain at least one least one type x issue (assuming type x is switched on).
do repeat scqcnt=t1scqs t2scqs t3scqs t4scqs t5scqs / scq=scq1 scq2 scq3 scq4 scq5.
compute scqcnt=scqcnt+scq.
leave scqcnt.
end repeat.
variable labels 
 t1scqs 'count of SCQs in which at least one item has stem=no but one (or more) quarters answered' / 
 t2scqs 'count of SCQs in which at least one item has stem=missing but one (or more) quarters answered' / 
 t3scqs 'count of SCQs in which at least one item has stem=yes but none of the quarters answered' / 
 t4scqs 'count of SCQs in which at least one item has stem=-5 (multi-response)' / 
 t5scqs 'count of SCQs which contain more than seven yes responses'.
descriptives t1scqs t2scqs t3scqs t4scqs t5scqs / statistics=max.

select if any(1,scq1,scq2,scq3,scq4,scq5).
exe.
show n.

* output spreadsheets.
string tempid (a8).
compute tab=9.
formats tab (pib).
compute tempid=concat("'",ltrim(rtrim(ohhscqid)),"'").
compute casenum=$casenum.
formats casenum (f4).
* write outfile='C:\Laura M\w13\w10-life-events-all.xls'/"* " casenum ".".
do if $casenum eq 1.
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-life-events-cases.xls'/' '.
end if.
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-life-events-cases.xls'/"* " casenum ".".

do repeat stem=olemar olesep olercl oleprg olebth oleins oleinf oledsc oledrl oledfr olevio olepcm olejls 
 olejlf olertr olefrd olejob oleprm olefni olefnw olemvd oledhm 
 / q1=olemarq1 olesepq1 olerclq1 oleprgq1 olebthq1 oleinsq1 oleinfq1 oledscq1 oledrlq1 oledfrq1 olevioq1 olepcmq1 olejlsq1 
 olejlfq1 olertrq1 olefrdq1 olejobq1 oleprmq1 olefniq1 olefnwq1 olemvdq1 oledhmq1 
 / q2=olemarq2 olesepq2 olerclq2 oleprgq2 olebthq2 oleinsq2 oleinfq2 oledscq2 oledrlq2 oledfrq2 olevioq2 olepcmq2 olejlsq2 
 olejlfq2 olertrq2 olefrdq2 olejobq2 oleprmq2 olefniq2 olefnwq2 olemvdq2 oledhmq2 
 / q3=olemarq3 olesepq3 olerclq3 oleprgq3 olebthq3 oleinsq3 oleinfq3 oledscq3 oledrlq3 oledfrq3 olevioq3 olepcmq3 olejlsq3 
 olejlfq3 olertrq3 olefrdq3 olejobq3 oleprmq3 olefniq3 olefnwq3 olemvdq3 oledhmq3 
 / q4=olemarq4 olesepq4 olerclq4 oleprgq4 olebthq4 oleinsq4 oleinfq4 oledscq4 oledrlq4 oledfrq4 olevioq4 olepcmq4 olejlsq4 
 olejlfq4 olertrq4 olefrdq4 olejobq4 oleprmq4 olefniq4 olefnwq4 olemvdq4 oledhmq4 
 / na=olemarna olesepna olerclna oleprgna olebthna oleinsna oleinfna oledscna oledrlna oledfrna oleviona olepcmna olejlsna 
 olejlfna olertrna olefrdna olejobna oleprmna olefnina olefnwna olemvdna oledhmna 
 / labstem='olemar' 'olesep' 'olercl' 'oleprg' 'olebth' 'oleins' 'oleinf' 'oledsc' 'oledrl' 'oledfr' 'olevio' 'olepcm' 'olejls' 
 'olejlf' 'olertr' 'olefrd' 'olejob' 'oleprm' 'olefni' 'olefnw' 'olemvd' 'oledhm' 
 / labq1='olemarq1' 'olesepq1' 'olerclq1' 'oleprgq1' 'olebthq1' 'oleinsq1' 'oleinfq1' 'oledscq1' 'oledrlq1' 'oledfrq1' 'olevioq1' 'olepcmq1' 'olejlsq1' 
 'olejlfq1' 'olertrq1' 'olefrdq1' 'olejobq1' 'oleprmq1' 'olefniq1' 'olefnwq1' 'olemvdq1' 'oledhmq1' 
 / labq2='olemarq2' 'olesepq2' 'olerclq2' 'oleprgq2' 'olebthq2' 'oleinsq2' 'oleinfq2' 'oledscq2' 'oledrlq2' 'oledfrq2' 'olevioq2' 'olepcmq2' 'olejlsq2' 
 'olejlfq2' 'olertrq2' 'olefrdq2' 'olejobq2' 'oleprmq2' 'olefniq2' 'olefnwq2' 'olemvdq2' 'oledhmq2' 
 / labq3='olemarq3' 'olesepq3' 'olerclq3' 'oleprgq3' 'olebthq3' 'oleinsq3' 'oleinfq3' 'oledscq3' 'oledrlq3' 'oledfrq3' 'olevioq3' 'olepcmq3' 'olejlsq3' 
 'olejlfq3' 'olertrq3' 'olefrdq3' 'olejobq3' 'oleprmq3' 'olefniq3' 'olefnwq3' 'olemvdq3' 'oledhmq3' 
 / labq4='olemarq4' 'olesepq4' 'olerclq4' 'oleprgq4' 'olebthq4' 'oleinsq4' 'oleinfq4' 'oledscq4' 'oledrlq4' 'oledfrq4' 'olevioq4' 'olepcmq4' 'olejlsq4' 
 'olejlfq4' 'olertrq4' 'olefrdq4' 'olejobq4' 'oleprmq4' 'olefniq4' 'olefnwq4' 'olemvdq4' 'oledhmq4' 
 / labna='olemarna' 'olesepna' 'olerclna' 'oleprgna' 'olebthna' 'oleinsna' 'oleinfna' 'oledscna' 'oledrlna' 'oledfrna' 'oleviona' 'olepcmna' 'olejlsna' 
 'olejlfna' 'olertrna' 'olefrdna' 'olejobna' 'oleprmna' 'olefnina' 'olefnwna' 'olemvdna' 'oledhmna' 
 / item='b18a' 'b18b' 'b18c' 'b18d' 'b18e' 'b18f' 'b18g' 'b18h' 'b18i' 'b18j' 'b18k' 'b18l' 'b18m' 
 'b18n' 'b18o' 'b18p' 'b18q' 'b18r' 'b18s' 'b18t' 'b18u' 'b18v' 
 / flag1=mar_1 sep_1 rcl_1 prg_1 bth_1 ins_1 inf_1 dsc_1 drl_1 dfr_1 vio_1 pcm_1 jls_1 
 jlf_1 rtr_1 frd_1 job_1 prm_1 fni_1 fnw_1 mvd_1 dhm_1 
 / flag1n=mar_1n to dhm_1n 
 / flag2=mar_2 sep_2 rcl_2 prg_2 bth_2 ins_2 inf_2 dsc_2 drl_2 dfr_2 vio_2 pcm_2 jls_2 
 jlf_2 rtr_2 frd_2 job_2 prm_2 fni_2 fnw_2 mvd_2 dhm_2 
 / flag2n=mar_2n to dhm_2n 
 / flag3=mar_3 sep_3 rcl_3 prg_3 bth_3 ins_3 inf_3 dsc_3 drl_3 dfr_3 vio_3 pcm_3 jls_3 
 jlf_3 rtr_3 frd_3 job_3 prm_3 fni_3 fnw_3 mvd_3 dhm_3 
 / flag3n=mar_3n to dhm_3n 
 / flag4=mar_4 sep_4 rcl_4 prg_4 bth_4 ins_4 inf_4 dsc_4 drl_4 dfr_4 vio_4 pcm_4 jls_4 
 jlf_4 rtr_4 frd_4 job_4 prm_4 fni_4 fnw_4 mvd_4 dhm_4 
 / flag4n=mar_4n to dhm_4n 
 / flag5=mar_5 sep_5 rcl_5 prg_5 bth_5 ins_5 inf_5 dsc_5 drl_5 dfr_5 vio_5 pcm_5 jls_5 
 jlf_5 rtr_5 frd_5 job_5 prm_5 fni_5 fnw_5 mvd_5 dhm_5 
 / flag5n=mar_5n to dhm_5n.

* write outfile='X:\Editing\wave 15\SCQ life events\Partial data\w15-life-events-all.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labstem tab " eq " tab stem tab labstem " = " tab stem tab "." tab 
 item tab flag1n tab flag2n tab flag3n tab flag4n tab flag5n.
do if any(1,flag1,flag2,flag3,flag4,flag5).
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labstem tab " eq " tab stem tab labstem " = " tab stem tab "." tab 
 item tab flag1n tab flag2n tab flag3n tab flag4n tab flag5n.
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labq1 tab " eq " tab q1 tab labq1 " = " tab q1 tab ".".
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labq2 tab " eq " tab q2 tab labq2 " = " tab q2 tab ".".
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labq3 tab " eq " tab q3 tab labq3 " = " tab q3 tab ".".
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labq4 tab " eq " tab q4 tab labq4 " = " tab q4 tab ".".
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'
 /"if ohhscqid eq " tab tempid tab " and " tab labna tab " eq " tab na tab labna " = " tab na tab ".".
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events-cases.xls'/' '.
end if.
end repeat.

exe.

* output batch file.

string out2 (a200).
compute out2=concat('copy "', ltrim(rtrim(dir9)),"\", tiff9, '"',' "c:\temp\temp.tiff"').
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events.bat'/'@echo SCQ ID  ' ohhscqid .
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events.bat'/out2.
write outfile='X:\Editing\wave 15\SCQ life events\Final data\w15-final-life-events.bat'/'@"C:\Program Files\Microsoft Office\Office14\OIS.exe" "c:\temp\temp.tiff"'.
execute.

*=========================== end of wave 15 programming ===========================.

