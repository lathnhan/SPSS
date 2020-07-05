*Extract certain variables from 'Rperson' and merge it with 'oscq04b' to form the w15 working file.
get file='x:\hilda\release 150\files\spss 150u\Rperson o150u.sav'.
select if ohhscqid ne 'Unmat'.
sort cases by ohhscqid.
string osex (a1).
if ohgsex eq 1 osex='M'.
if ohgsex eq 2 osex='F'.
if missing(ohgsex) osex=' '.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=ohhscqid xwaveid osex ohgage.;

libname r150 'X:\HILDA\Release 150\files\SAS 150u';
data rperson_o150u_sa;set r150.rperson_o150u;run;
data rperson_o150u_sa;set rperson_o150u_sa;if ohhscqid ne 'Unmat';
data rperson_o150u_sa;set rperson_o150u_sa;
osex = ' ';
if ohgsex = 1 then osex = 'M';
if ohgsex = 2 then osex = 'F';
if ohgsex = . then osex = ' ';
data rperson_o150u_sa;set rperson_o150u_sa;
keep ohhscqid xwaveid osex ohgage;run;
proc sort data=rperson_o150u_sa;by ohhscqid;run;

*get file='x:\editing\wave 15\scq data\oscq04b.sav'.
sort cases by ohhscqid.
match files file=* / in=in04b / file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / in=inRperson / by ohhscqid.
value labels inRperson 0 'no' 1 'yes' / in04b 0 'no' 1 'yes'.
crosstabs inRperson by in04b.;

proc import datafile='x:\editing\wave 15\scq data\oscq04b.sav' out=oscq04b dbms=sav replace;run;/*There is no SAS version of the data*/
proc sort data=oscq04b;by ohhscqid;run;
data rperson_o150u;merge oscq04b (in=in04bx) rperson_o150u_sa (in=inRpersonx);by ohhscqid;in04b=in04bx;inRperson=inRpersonx;run;
proc format;value indx 0 'no' 1 'yes';run;
data rperson_o150u;set rperson_o150u;format inRperson in04b indx.;run;
proc freq data=rperson_o150u;table inRperson*in04b;run;

* there should not be blank SCQs in 'oscq04.sav', but search for (and remove) any instances just in case.
* compute blank=0.
* count countvar=mgh1 to kscage (-4).
* if countvar eq 396 blank=1.
* frequencies blank.
* select if blank eq 0.

*Select cases with non-missing xwaveid.
select if inRperson eq 1.
sort cases by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid osex ohgage ohhscqid olssmkf  olstbcn tiff5 dir5.;

data rperson_o150u;set rperson_o150u;
keep xwaveid osex ohgage ohhscqid olssmkf olstbcn tiff5 dir5;if inRperson = 1;run;
proc sort data=rperson_o150u;by xwaveid;run;


*Obtain smoking data from previous waves and merge with w15 working file.
*wave 14.
get file='x:\hilda\release 150\files\spss 150u\Rperson n150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to olstbcn nhhscqid nlssmkf nlstbcn tiff5 dir5.
;

data rperson_n150u;set r150.rperson_n150u;keep xwaveid nhhscqid nlssmkf nlstbcn tiff5 dir5;run;
proc sort data=rperson_n150u;by xwaveid;run;

* wave 13.
get file='x:\hilda\release 150\files\spss 150u\Rperson m150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to nlstbcn mhhscqid mlssmkf mlstbcn tiff5 dir5.
;

data rperson_m150u;set r150.rperson_m150u;keep xwaveid mhhscqid mlssmkf mlstbcn;run;
proc sort data=rperson_m150u;by xwaveid;run;

* wave 12.
get file='x:\hilda\release 150\files\spss 150u\Rperson l150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to mlstbcn lhhscqid llssmkf llstbcn tiff5 dir5.
;

data rperson_l150u;set r150.rperson_m150u;keep xwaveid lhhscqid llssmkf llstbcn;run;
proc sort data=rperson_l150u;by xwaveid;run;

* wave 11.
get file='x:\hilda\release 150\files\spss 150u\Rperson k150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to llstbcn khhscqid klssmkf klstbcn tiff5 dir5.
;

data rperson_k150u;set r150.rperson_k150u;keep xwaveid khhscqid klssmkf klstbcn;run;
proc sort data=rperson_k150u;by xwaveid;run;

* wave 10.
get file='x:\hilda\release 150\files\spss 150u\Rperson j150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to klstbcn jhhscqid jlssmkf jlstbcn tiff5 dir5.
;

data rperson_j150u;set r150.rperson_j150u;keep xwaveid jhhscqid jlssmkf jlstbcn;run;
proc sort data=rperson_j150u;by xwaveid;run;

* wave 9.
get file='x:\hilda\release 150\files\spss 150u\Rperson i150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to jlstbcn ihhscqid ilssmkf ilstbcn tiff5 dir5.
;

data rperson_i150u;set r150.rperson_i150u;keep xwaveid ihhscqid ilssmkf ilstbcn;run;
proc sort data=rperson_i150u;by xwaveid;run;

* wave 8.
get file='x:\hilda\release 150\files\spss 150u\Rperson h150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to ilstbcn hhhscqid hlssmkf hlstbcn tiff5 dir5.
;

data rperson_h150u;set r150.rperson_h150u;keep xwaveid hhhscqid hlssmkf hlstbcn;run;
proc sort data=rperson_h150u;by xwaveid;run;

* wave 7.
get file='x:\hilda\release 150\files\spss 150u\Rperson g150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to hlstbcn ghhscqid glssmkf glstbcn tiff5 dir5.
;

data rperson_g150u;set r150.rperson_g150u;keep xwaveid ghhscqid glssmkf glstbcn;run;
proc sort data=rperson_g150u;by xwaveid;run;

* wave 6.
get file='x:\hilda\release 150\files\spss 150u\Rperson f150u.sav'.
sort cases by xwaveid.
match files file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / file=* by xwaveid.
save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav' / keep=xwaveid to glstbcn fhhscqid flssmkf flstbcn tiff5 dir5.
;

data rperson_f150u;set r150.rperson_f150u;keep xwaveid fhhscqid flssmkf flstbcn;run;
proc sort data=rperson_f150u;by xwaveid;run;

data oscq04b_smoking;
merge rperson_o150u rperson_n150u rperson_m150u rperson_l150u rperson_k150u rperson_j150u rperson_i150u rperson_h150u rperson_g150u rperson_f150u;
by xwaveid;run;


*get file='E:\w15\w15-smoking\SCQ smoking\oscq04b-smoking.sav'.

*Extract cases where smoking is high, or smokers with no cigarette consumption, or non-smokers with some cigarette consumption.
compute case=0.
compute highsmok=250.
*if never or no longer smoke and number of smoke  >0.
if any(olssmkf ,1,2) and olstbcn gt 0 case=1. 
*if smoke daily/weekly/often and number of smoke  =0.
if any(olssmkf ,3,4,5) and olstbcn eq 0 case=1.
if olstbcn gt highsmok case=1.

select if case eq 1.
list ohhscqid olssmkf  olstbcn.
;

data oscq04b_smoking;set oscq04b_smoking;
case=0;
highsmok=250;
if olssmkf in (1,2) and olstbcn > 0 then case=1;
if olssmkf in (3,4,5) and olstbcn = 0 then case=1;
if olstbcn > 250 then case=1;
run;

data oscq04b_smoking;set oscq04b_smoking;if case=1;run;
proc print data=oscq04b_smoking;var ohhscqid olssmkf olstbcn;run;


*Create a list of all w15 problem cases, and also include smoking data from previous waves in the listing.
compute casenum=$casenum.
formats olstbcn (f4) casenum nlstbcn mlstbcn llstbcn klstbcn jlstbcn ilstbcn hlstbcn glstbcn flstbcn (f3) ohgage olssmkf nlssmkf mlssmkf  llssmkf klssmkf jlssmkf ilssmkf hlssmkf glssmkf flssmkf (f2).
do if $casenum=1.
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-list-w15-smoking.txt'
 /'num xwaveid sex age  w15   B2 B3   w14    B2 B3   w13    B2 B3   w12    B2 B3   w11    B2 B3   w10    B2 B3   w9     B2 B3   w8    B2 B3   w7    B2 B3   w6    B2 B3'.
end if.
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-list-w15-smoking.txt'
 /'casenum ' ' xwaveid ' ' osex '   ' ohgage ' 
' ohhscqid ' ' olssmkf ' ' olstbcn ' 
' nhhscqid ' ' nlssmkf ' ' nlstbcn '  
' mhhscqid ' ' mlssmkf  ' ' mlstbcn ' 
' lhhscqid ' ' llssmkf ' ' llstbcn ' 
' khhscqid ' ' klssmkf ' ' klstbcn '  
' jhhscqid '  ' jlssmkf ' ' jlstbcn ' 
' ihhscqid ' ' ilssmkf ' ' ilstbcn '  
' hhhscqid ' ' hlssmkf ' ' hlstbcn '  
' ghhscqid ' ' glssmkf ' ' glstbcn '  
' fhhscqid ' ' flssmkf ' ' flstbcn '.
 execute.


*Generate spreadsheet.

write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-fix-w15-smoking.xls'/"* " casenum ".".
string tempid (a8).
compute tab=9.
formats tab (pib).
compute tempid=concat("'",ltrim(rtrim(ohhscqid)),"'").
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-fix-w15-smoking.xls' /"if ohhscqid eq " tempid " and " tab " olssmkf " tab " eq " tab olssmkf  tab " olssmkf " tab " = " tab olssmkf  tab "." .
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-fix-w15-smoking.xls' /"if ohhscqid eq " tempid " and " tab " olstbcn" tab " eq " tab olstbcn tab " olstbcn" tab " = " tab olstbcn tab "." .
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-fix-w15-smoking.xls'/tab.
execute.
;

data fixw15smoking;set oscq04b_smoking;
tempid = catx(" ","'",ohhscqid,"'");
fixolssmkf = catx(' ', 'if ohhscqid =', tempid, 'and olssmkf =', olssmkf, 'then olssmkf =', olssmkf, ';');
fixolstbcn = catx(' ', 'if ohhscqid =', tempid, 'and olstbcn =', olstbcn, 'then olstbcn =', olstbcn, ';');
run;
proc export data=work.fixw15smoking outfile='E:\w15\w15-smoking\SCQ smoking\SAS codes and files\RemoveThisFromFilename-fix-w15-smoking.xls'
dbms=xls replace;run;


*Generate batch file.

string out1 out2 (a200).
compute out2=concat('copy "', ltrim(rtrim(dir5)),"\", tiff5, '"',' "c:\temp\temp.tiff"').
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-open-w15-smoking.bat'/'@echo SCQ ID  ' ohhscqid .
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-open-w15-smoking.bat'/out2.
write outfile='E:\w15\w15-smoking\SCQ smoking\RemoveThisFromFilename-open-w15-smoking.bat'/'@"C:\Program Files\Microsoft Office\Office14\OIS.exe" "c:\temp\temp.tiff"'.
execute.

save outfile='E:\w15\w15-smoking\SCQ smoking\oscq04b-smokingcigcon.xlsx' / keep=xwaveid olstbcn nlstbcn mlstbcn llstbcn klstbcn jlstbcn ilstbcn hlstbcn glstbcn flstbcn.;
