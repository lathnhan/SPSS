* Encoding: windows-1252.
* cross-sectional cleaning of w15 SCQ height and weight data.
* for the generated (w15) cases, this program also tallies hieght and weight data from past waves. 

* the following needs to be done when updating this syntax file for future waves: .
* .
* the common strings listed below need to be updated (do this using the 'find and replace' (control-H) facility).
*    ohhscqid / oscq04 / release 150 / o150u /150u / tiff5 / dir5 / ohgsex / obmhtcm / obmhtft / obmhtin / obmwtkg / obmwtst / obmwtlb / obmi / w15 / wave 15.
* .
* countvar (the total number of potential blank variables in the current wave SCQ) needs to be manually reset - note: this is not necessary if using data file oscq04b.
* .
* BMI variables from last year's wave need to be added (in the section headed 'obtain BMI data from earlier waves').
*    - this involves adding four lines of syntax (get / sort cases / match files / save) immediately below the section heading.
*    - once these four lines have been added and the (above) control-H operation has been done: .
*        the 'x' in the variable xlstbcn in (what is now) the second 'save' command below the above-mentioned heading needs to be changed back to last year's wave.
* .
* the 'formats' and the two 'write' commands in the section which creates the output listing of past smoking data need to be updated (careful of the spacing).

* extract certain variables from 'Rperson' and merge it with 'nscq04b' to form the w14 working file.
get file='x:\hilda\release 150\files\spss 150u\Rperson o150u.sav'.
select if ohhscqid ne 'Unmat'.
sort cases by ohhscqid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=ohhscqid xwaveid ohgsex obmi.
* get file='x:\editing\wave 9\scq stamp\iscq04-stamp.sav'.
get file='x:\editing\wave 15\scq data\oscq04b.sav'.
sort cases by ohhscqid.
match files file=* / in=in04b / file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / in=inRperson / by ohhscqid.
value labels inRperson 0 'no' 1 'yes' / in04b 0 'no' 1 'yes'.
crosstabs inRperson by in04b.
* there should not be blank SCQs in 'oscq04.sav', but search for (and remove) any instances just in case.
* compute blank=0.
* count countvar=igh1 to iscage (-4).
* if countvar eq 432 blank=1.
* frequencies blank.
* select if blank eq 0.
* if the w15 height and weight variables have already been inspected in the past, do not bring them up again.
* compute prevseen=0.
* if obmhtcm_st eq 1 and obmhtft_st eq 1 and obmhtin_st eq 1 and obmwtkg_st eq 1 and obmwtst_st eq 1 and obmwtlb_st eq 1 prevseen=1.
* select if prevseen eq 0.
* if the w15 dataset is not yet complete, there may be participants who do not yet have an xwaveid.
* if there are missing xwaveids, then matching with past waves will not work properly.
* hence the following line, to ensure that only those who have an xwaveid are carried forward and matched with past waves.
* if the w15 dataset is complete, then the following line of syntax will have no effect on the operation of this program.
select if inRperson eq 1.
sort cases by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid ohgsex ohhscqid obmhtcm to obmwtlb obmi tiff5 dir5.

* obtain height and weight data from earlier waves and append to w15 working file.
* wave 13.
get file='x:\hilda\release 150\files\spss 150u\Rperson m150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to obmi mhhscqid mbmhtcm to mbmwtlb mbmi tiff5 dir5.
* wave 12.
get file='x:\hilda\release 150\files\spss 150u\Rperson l150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to mbmi lhhscqid lbmhtcm to lbmwtlb lbmi tiff5 dir5.
* wave 11.
get file='x:\hilda\release 150\files\spss 150u\Rperson k150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to lbmi khhscqid kbmhtcm to kbmwtlb kbmi tiff5 dir5.
* wave 10.
get file='x:\hilda\release 150\files\spss 150u\Rperson j150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to kbmi jhhscqid jbmhtcm to jbmwtlb jbmi tiff5 dir5.
* wave 9.
get file='x:\hilda\release 150\files\spss 150u\Rperson i150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to jbmi ihhscqid ibmhtcm to ibmwtlb ibmi tiff5 dir5.
* wave 8.
get file='x:\hilda\release 150\files\spss 150u\Rperson h150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to ibmi hhhscqid hbmhtcm to hbmwtlb hbmi tiff5 dir5.
* wave 7.
get file='x:\hilda\release 150\files\spss 150u\Rperson g150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to hbmi ghhscqid gbmhtcm to gbmwtlb gbmi tiff5 dir5.
* wave 6.
get file='x:\hilda\release 150\files\spss 150u\Rperson f150u.sav'.
sort cases by xwaveid.
match files file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / file=* by xwaveid.
save outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav' / keep=xwaveid to gbmi fhhscqid fbmhtcm to fbmwtlb fbmi tiff5 dir5.

get file='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\oscq04b-bmi.sav'.

compute htprob=0.
compute wtprob=0.
compute bmprob=0.
* the default is that anyprob=0 (both height and weight data is valid and not missing) unless determined otherwise by the syntax below.
compute anyprob=0.
formats htprob wtprob bmprob anyprob (f1.0).

missing values obmhtcm to obmwtlb obmi (-1,-4,-6).

if missing(obmhtcm) and missing(obmhtft) and missing(obmhtin) htprob=2.
if missing(obmwtkg) and missing(obmwtst) and missing(obmwtlb) wtprob=2.
if missing(obmi) bmprob=2.

* uncover heights outside of the cut-offs - males (sex information from HF).

do if ohgsex eq 1 and obmhtcm ge 0.
if obmhtcm lt 130 htprob=1.
if obmhtcm gt 229 htprob=1.
end if.
do if ohgsex eq 1 and obmhtft ge 0.
if obmhtft lt 4 or (obmhtft eq 4 and (obmhtin le 3 or missing(obmhtin))) htprob=1.
if obmhtft gt 7 or (obmhtft eq 7 and obmhtin gt 6) htprob=1.
end if.

* uncover heights outside of the cut-offs - females (sex information from HF).

do if ohgsex eq 2 and obmhtcm ge 0.
if obmhtcm lt 110 htprob=1.
if obmhtcm gt 210 htprob=1.
end if.
do if ohgsex eq 2 and obmhtft ge 0.
if obmhtft lt 3 or (obmhtft eq 3 and (obmhtin lt 7 or missing(obmhtin))) htprob=1.
if obmhtft ge 7 htprob=1.
end if.

* uncover suspicious heights should by any chance (HF) sex be missing.

do if ohgsex ne 1 and ohgsex ne 2 and obmhtcm ge 0.
if obmhtcm lt 130 htprob=1.
if obmhtcm gt 210 htprob=1.
end if.
do if ohgsex ne 1 and ohgsex ne 2 and obmhtft ge 0.
if obmhtft lt 4 or (obmhtft eq 4 and (obmhtin le 3 or missing(obmhtin))) htprob=1.
if obmhtft ge 7 htprob=1.
end if.

* uncover instances where inches are greater than or equal to 12 (irrespective of sex or feet).
* this also captures instances where feet are blank but inches are given (if inches<12 then captured 

if obmhtin ge 12 htprob=1.

* uncover weights outside of the cut-offs - males (sex information from HF).

do if ohgsex eq 1 and obmwtkg ge 0.
if obmwtkg lt 35 wtprob=1.
if obmwtkg gt 300 wtprob=1.
end if.
do if ohgsex eq 1 and obmwtst ge 0.
if obmwtst lt 5 or (obmwtst eq 5 and (obmwtlb lt 7 or missing(obmwtlb))) wtprob=1.
if obmwtst gt 47 or (obmwtst eq 47 and obmwtlb gt 3) wtprob=1.
end if.

* uncover weights outside of the cut-offs - females (sex information from HF).

do if ohgsex eq 2 and obmwtkg ge 0.
if obmwtkg lt 25 wtprob=1.
if obmwtkg gt 300 wtprob=1.
end if.
do if ohgsex eq 2 and obmwtst ge 0.
if obmwtst lt 3 or (obmwtst eq 3 and (obmwtlb lt 13 or missing(obmwtlb))) wtprob=1.
if obmwtst gt 47 or (obmwtst eq 47 and obmwtlb gt 3) wtprob=1.
end if.

* uncover cases where, in the imperial field, only pounds given, stones left blank.

do if (obmwtst eq 0 or missing(obmwtst)) and obmwtlb gt 0.
compute wtprob=1.
* if lbs measurement is plausible, then not a problem case.
if ohgsex eq 1 and (obmwtlb ge 77 and obmwtlb le 661) wtprob=0.
if ohgsex eq 2 and (obmwtlb ge 55 and obmwtlb le 661) wtprob=0.
end if.

* uncover cases where, in the imperial field, stones and pounds are both given, but pounds are greater than 13.

if obmwtst gt 0 and obmwtlb gt 13 wtprob=1.

* uncover suspicious weights should by any chance (HF) sex be missing.

do if ohgsex ne 1 and ohgsex ne 2 and obmwtkg ge 0.
if obmwtkg lt 35 wtprob=1.
if obmwtkg gt 300 wtprob=1.
end if.
do if ohgsex ne 1 and ohgsex ne 2 and obmwtst ge 0.
if obmwtst lt 5 or (obmwtst eq 5 and (obmwtlb lt 7 or missing(obmwtlb))) wtprob=1.
if obmwtst gt 47 or (obmwtst eq 47 and obmwtlb gt 3) wtprob=1.
end if.
do if ohgsex ne 1 and ohgsex ne 2 and obmwtlb ge 0.
if (obmwtst eq 0 or missing(obmwtst)) and obmwtlb gt 0 wtprob=1.
if (obmwtst eq 0 or missing(obmwtst)) and (obmwtlb ge 77 and obmwtlb le 661) wtprob=0.
end if.

* uncover cases where the derived cross-sectional BMI variable is too high or too low.
* for a particular SCQ ID, if 'ibmi' is less than 'miobmi' or greater than 'maxbmi', then that SCQ ID is flagged for checking.

compute miobmi=15.
compute maxbmi=50.
if obmi ge 0 and (obmi lt miobmi or obmi gt maxbmi) bmprob=1.

* list potential problem cases.

temporary.
select if htprob eq 1 or wtprob eq 1 or bmprob eq 1.
list xwaveid ohhscqid obmhtcm obmhtft obmhtin obmwtkg obmwtst obmwtlb ohgsex htprob wtprob bmprob.

* note that by default, the derived variable BMI is missing if either (or both) of height and weight are missing.
* if all height data is missing, but weight data is valid (and not missing), set anyprob to 2.
if htprob eq 2 and wtprob eq 0 anyprob=2.
* if height data is valid (and not missing), but all weight data is missing, set anyprob to 3.
if htprob eq 0 and wtprob eq 2 anyprob=3.
* if all height and weight variables are blank and/or implausible, set anyprob to 4.
if htprob eq 2 and wtprob eq 2 anyprob=4.
* if any height, weight or BMI variable for a given SCQ has an identified issue, set anyprob to 1.
*    (this particular decision tree overrides any of the above).
if any(1,htprob,wtprob,bmprob) anyprob=1.
variable labels 
 htprob 'SCQs containing an issue with height (as a proportion of all SCQs)' / 
 wtprob 'SCQs containing an issue with weight (as a proportion of all SCQs)' / 
 bmprob 'SCQs containing an issue with (derived variable) BMI (as a proportion of all SCQs)' / 
 anyprob 'SCQs containing any one or more of height, weight, or BMI issues (as a proportion of all SCQs)'.
value labels 
 htprob 0 'height data OK' 1 'height data containing issues' 2 'height data missing (or deemed implausible)' / 
 wtprob 0 'weight data OK' 1 'weight data containing issues' 2 'weight data missing (or deemed implausible)' / 
 bmprob 0 'BMI (derived) data OK' 1 'BMI (derived) data containing issues' 2 'BMI not able to be derived (due to missing height, weight, or both)' / 
 anyprob 
 1 'SCQs containing any form of anthropometric data issues' 
 0 'SCQs in which both height and weight is valid and not missing' 
 2 'SCQs in which all height data is missing, but weight is valid and not missing' 
 3 'SCQs in which height data is valid and not missing, but all weight data missing' 
 4 'SCQs in which both height and weight data is missing'.
frequencies htprob wtprob bmprob anyprob.
select if anyprob eq 1.
variable labels 
 htprob 'SCQs containing an issue with height (as a proportion of SCQs containing any one or more of height, weight or BMI issues)' / 
 wtprob 'SCQs containing an issue with weight (as a proportion of SCQs containing any one or more of height, weight or BMI issues)' / 
 bmprob 'SCQs containing an issue with (derived variable) BMI (as a proportion of SCQs containing any one or more of height, weight or BMI issues)'.
frequencies htprob wtprob bmprob.

* create a listing of all w15 problem cases, and also include height and weight data from previous waves in the listing (ie create a bmi wide file).

compute casenum=$casenum.
formats casenum obmhtcm obmwtkg obmwtlb mbmhtcm mbmwtkg mbmwtlb lbmhtcm lbmwtkg lbmwtlb kbmhtcm kbmwtkg kbmwtlb jbmhtcm jbmwtkg jbmwtlb ibmhtcm ibmwtkg ibmwtlb hbmhtcm hbmwtkg hbmwtlb gbmhtcm gbmwtkg gbmwtlb fbmhtcm fbmwtkg fbmwtlb (f3).
formats obmhtft obmhtin obmwtst mbmhtft mbmhtin mbmwtst lbmhtft lbmhtin lbmwtst kbmhtft kbmhtin kbmwtst jbmhtft jbmhtin jbmwtst ibmhtft ibmhtin ibmwtst hbmhtft hbmhtin hbmwtst gbmhtft gbmhtin gbmwtst fbmhtft fbmhtin fbmwtst (f2).
do if $casenum=1.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-list-w15-bmi.txt'
 /'num xwaveid  w15 cm ft in kg  st lb  w13  cm  ft in kg  st lb   w12  cm  ft in kg  st lb   w11  cm  ft in kg  st lb   w10  cm  ft in kg  st lb  w9  cm  ft in kg  st lb   w8  cm  ft in kg  st lb  w7 cm  ft in kg  st lb w6  cm  ft in kg  st lb'.
end if.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-list-w15-bmi.txt'
 /casenum ' ' xwaveid '  ' ohhscqid ' ' obmhtcm ' ' obmhtft ' ' obmhtin ' ' obmwtkg ' ' obmwtst ' ' obmwtlb ' ' mhhscqid ' ' mbmhtcm ' ' mbmhtft ' ' mbmhtin ' ' mbmwtkg ' ' mbmwtst ' ' mbmwtlb '  '
 lhhscqid ' ' lbmhtcm ' ' lbmhtft ' ' lbmhtin ' ' lbmwtkg ' ' lbmwtst ' ' lbmwtlb ' '  
  khhscqid ' ' kbmhtcm ' ' kbmhtft ' ' kbmhtin ' ' kbmwtkg ' ' kbmwtst ' ' kbmwtlb '  ' 
  jhhscqid ' ' jbmhtcm ' ' jbmhtft ' ' jbmhtin ' ' jbmwtkg ' ' jbmwtst ' ' jbmwtlb '  ' 
  ihhscqid ' ' ibmhtcm ' ' ibmhtft ' ' ibmhtin ' ' ibmwtkg ' ' ibmwtst ' ' ibmwtlb '  ' 
  hhhscqid ' ' hbmhtcm ' ' hbmhtft ' ' hbmhtin ' ' hbmwtkg ' ' hbmwtst ' ' hbmwtlb '  ' 
  ghhscqid ' ' gbmhtcm ' ' gbmhtft ' ' gbmhtin ' ' gbmwtkg ' ' gbmwtst ' ' gbmwtlb '  ' 
  fhhscqid ' ' fbmhtcm ' ' fbmhtft ' ' fbmhtin ' ' fbmwtkg ' ' fbmwtst ' ' fbmwtlb ' '.
exe.

* create a spreadsheet of w15 problem cases.

string htproba wtproba bmproba ohgsexa (a3).
if htprob eq 1 htproba='ht'.
if wtprob eq 1 wtproba='wt'.
if bmprob eq 1 bmproba='bmi'.
if ohgsex eq 1 ohgsexa='M'.
if ohgsex eq 2 ohgsexa='F'.

string tempid (a8).
compute tab=9.
formats tab (pib).
compute tempid=concat("'",ltrim(rtrim(ohhscqid)),"'").
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-fix-w15-bmi-xsect.xls' / "* " casenum ".".
do repeat
 y= obmhtcm obmhtft obmhtin obmwtkg obmwtst obmwtlb  /
 z='obmhtcm' 'obmhtft' 'obmhtin' 'obmwtkg' 'obmwtst' 'obmwtlb'.
do if z eq 'obmhtcm' or z eq 'obmhtft' or z eq 'obmhtin'.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-fix-w15-bmi-xsect.xls'
 /"if ohhscqid eq " tempid " and " tab z tab " eq " tab y tab " " z tab " = " tab y  tab " ." tab ohgsexa tab htproba tab tab bmproba tab mbmhtcm tab mbmhtft tab mbmhtin.
end if.
do if z eq 'obmwtkg' or z eq 'obmwtst' or z eq 'obmwtlb'.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-fix-w15-bmi-xsect.xls'
 /"if ohhscqid eq " tempid " and " tab z tab " eq " tab y tab " " z tab " = " tab y  tab " ." tab ohgsexa tab tab wtproba tab bmproba tab mbmwtkg tab mbmwtst tab mbmwtlb.
end if.
end repeat.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-fix-w15-bmi-xsect.xls'/tab.
exe.

* create batch file to display TIFFs of interest.

string out1 out2 (a200).
compute out2=concat('copy "', ltrim(rtrim(dir5)),"\", tiff5, '"',' "c:\temp\temp.tiff"').
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-open-w15-bmi-xsect.bat'/'@echo SCQ ID  ' ohhscqid .
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-open-w15-bmi-xsect.bat'/out2.
write outfile='C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15-bmi-xsect\final\RemoveThisFromFilename-open-w15-bmi-xsect.bat'/'@"C:\Program Files\Microsoft Office\Office14\OIS.exe" "c:\temp\temp.tiff"'.
execute.

*******************************************************************************************************************************************.
* calculation of BMI in Simon's program (reference only).
* the conversion factors / formulae used in deriving the variable ibmi in Simon's program are as follows.
* BMI = kg / (metres ** 2).
* cm = rnd(inches * 2.54).
* ft = inches * 12.
* kg = lb/(2.20462262).
* st = lb * 14.

/* *************************** */

/*              BMI            */

/* *************************** */

* weight in kg.

do if hbmwtst > -1 and hbmwtlb > -1.

compute lb=14*hbmwtst+hbmwtlb.

else if hbmwtst > -1.

compute lb=14*hbmwtst.

else if hbmwtlb > -1.

compute lb=hbmwtlb.

end if.

compute kg=hbmwtkg.

if kg < 0 and lb > 0 kg = lb/(2.20462262) .

if kg < 0 kg = $sysmis.

 * height in cm.

do if hbmhtft > -1 and hbmhtin > -1.

compute inches=12*hbmhtft+hbmhtin.

else if hbmhtft > -1.

compute inches=12*hbmhtft.

else if hbmhtin > -1.

compute inches=hbmhtin.

end if.

compute cm=hbmhtcm.

if (cm <= 0 and inches > 0) cm = rnd(inches * 2.54) .

if (cm>0 and inches>0 and hscage ge 7) cm = rnd(inches * 2.54) . /* if aged > 45 use imperial in preference */

if (cm < 0) cm = $sysmis.

compute metres = cm/100.

*Metric BMI  = ( Weight in Kilograms / ( Height in Meters ) squared ) .

compute bmi = kg/(metres**2).

compute bmi= (rnd(bmi*10))/10.              /* adjust  to 1 decimal place */

 rename vars (cm kg bmi = hbmht hbmwt hbmi).