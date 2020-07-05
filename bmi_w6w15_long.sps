* Encoding: windows-1252.
set width=255 pri=on mpri=no.

/* Create data file */

set width=255.
get file='X:\HILDA\Release 150\Files\SPSS 150u\Master o150u.sav'.

sort cases by ohhpid.
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson o150u.sav'/by ohhpid.
sort cases by ohhpid.
match files file=*/table='X:\Editing\wave 15\tiff locations\o-final-scq-dir.sav'/by ohhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= otiff1 to otiff20 odir1 to odir20).

sort cases by nhhpid.
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson n150u.sav'/by nhhpid. 
sort cases by nhhpid.
match files file=*/table='X:\Editing\wave 14\tiff locations\n-final-scq-dir.sav'/by nhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= ntiff1 to ntiff20 ndir1 to ndir20).

sort cases by mhhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson m150u.sav'/by mhhpid.
sort cases by mhhpid .
match files file=*/table='X:\Editing\wave 13\tiff locations\m-final-scq-dir.sav'/by mhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= mtiff1 to mtiff20 mdir1 to mdir20).

sort cases by lhhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson l150u.sav'/by lhhpid.
sort cases by lhhpid .
match files file=*/table='X:\Editing\wave 12\tiff locations\l-final-scq-dir.sav'/by lhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= ltiff1 to ltiff20 ldir1 to ldir20).

sort cases by khhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson k150u.sav'/by khhpid.
sort cases by khhpid .
match files file=*/table='X:\Editing\wave 11\tiff locations\k-final-scq-dir.sav'/by khhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= ktiff1 to ktiff20 kdir1 to kdir20).

sort cases by jhhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson j150u.sav'/by jhhpid.
sort cases by jhhpid .
match files file=*/table='X:\Editing\wave 10\tiff locations\j-final-scq-dir.sav'/by jhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= jtiff1 to jtiff20 jdir1 to jdir20).

sort cases by ihhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson i150u.sav'/by ihhpid.
sort cases by ihhpid .
match files file=*/table='X:\Editing\wave 9\tiff locations\i-final-scq-dir.sav'/by ihhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= itiff1 to itiff20 idir1 to idir20).

sort cases by hhhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson h150u.sav'/by hhhpid.
sort cases by hhhpid .
match files file=*/table='X:\Editing\wave 8\tiff locations\h-final-scq-dir.sav'/by hhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= htiff1 to htiff20 hdir1 to hdir20).

sort cases by ghhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson g150u.sav'/by ghhpid.
sort cases by ghhpid .
match files file=*/table='X:\Editing\wave 7\tiff locations\g-final-scq-dir.sav'/by ghhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= gtiff1 to gtiff20 gdir1 to gdir20).

sort cases by fhhpid .
match files file=*/table='X:\HILDA\Release 150\Files\SPSS 150u\Rperson f150u.sav'/by fhhpid.
sort cases by fhhpid .
match files file=*/table='X:\Editing\wave 6\tiff locations\f-final-scq-dir.sav'/by fhhpid.
ren vars (tiff1 to tiff20 dir1 to dir20= ftiff1 to ftiff20 fdir1 to fdir20).

save outfile='e:\temp\w6w15bmi.sav'.

/* ********************* */

* convert all weights to kilograms */ /* COMMENT START AND END MISSING */
/* convert all heights to centimetres */  /* !! COMMENT START AND END MISSING */

get file='e:\temp\w6w15bmi.sav'.
define kgcm (!pos=!tokens(1)).
do if !concat(!1,bmwtst) > -1 and !concat(!1,bmwtlb) > -1.
compute !concat(!1,lb)=14*!concat(!1,bmwtst)+!concat(!1,bmwtlb).
else if !concat(!1,bmwtst) > -1.
compute !concat(!1,lb)=14*!concat(!1,bmwtst).
else if !concat(!1,bmwtlb) > -1.
compute !concat(!1,lb)=!concat(!1,bmwtlb).
end if.
compute !concat(!1,kg)=!concat(!1,bmwtkg).
if !concat(!1,kg) < 0 and !concat(!1,lb) > 0 !concat(!1,kg) = !concat(!1,lb)/(2.20462262) .
if !concat(!1,kg) < 0 !concat(!1,kg) = $sysmis.
do if !concat(!1,bmhtft) > -1 and !concat(!1,bmhtin) > -1.
compute !concat(!1,inches)=12*(!concat(!1,bmhtft))+!concat(!1,bmhtin).
else if !concat(!1,bmhtft) > -1.
compute !concat(!1,inches)=12*!concat(!1,bmhtft).
else if !concat(!1,bmhtin) > -1.
compute !concat(!1,inches)=!concat(!1,bmhtin).
end if.
compute !concat(!1,cm)=!concat(!1,bmhtcm).
if ( !concat(!1,cm) <= 0 and !concat(!1,inches) > 0) !concat(!1,cm) = rnd(!concat(!1,inches) * 2.54) .
if ( !concat(!1,cm)>0 and !concat(!1,inches)>0 and !concat(!1,scage) ge 7) !concat(!1,cm) = rnd(!concat(!1,inches) * 2.54) . /* if aged > 45 use imperial in preference */
if ( !concat(!1,cm) < 0) !concat(!1,cm) = $sysmis.
compute !concat(!1,metres) = (!concat(!1,cm))/100.
format !concat(!1,metres) (f8.2).
match files file=*/drop=!concat(!1,lb) !concat(!1,inches) !concat(!1,cm) .   
!enddefine.
kgcm f.
kgcm g.
kgcm h.
kgcm i.
kgcm j.
kgcm k.
kgcm l.
kgcm m.
kgcm n
kgcm o.
save outfile='e:\temp\w6w15bmi.sav'  /keep=xwaveid fhhpid ghhpid hhhpid ihhpid jhhpid khhpid lhhpid mhhpid nhhpid ohhpid
 fhgage fbmwtst fbmwtlb fbmwtkg fbmhtin fbmhtft fbmhtcm fbmi fmetres fkg ftiff1 to ftiff20 fdir1 to fdir20
 ghgage gbmwtst gbmwtlb gbmwtkg gbmhtin gbmhtft gbmhtcm gbmi gmetres gkg gtiff1 to gtiff20 gdir1 to gdir20
 hhgage hbmwtst hbmwtlb hbmwtkg hbmhtin hbmhtft hbmhtcm hbmi hmetres hkg htiff1 to htiff20 hdir1 to hdir20
 ihgage ibmwtst ibmwtlb ibmwtkg ibmhtin ibmhtft ibmhtcm ibmi imetres ikg itiff1 to itiff20 idir1 to idir20
 jhgage jbmwtst jbmwtlb jbmwtkg jbmhtin jbmhtft jbmhtcm jbmi jmetres jkg jtiff1 to jtiff20 jdir1 to jdir20
 khgage kbmwtst kbmwtlb kbmwtkg kbmhtin kbmhtft kbmhtcm kbmi kmetres kkg ktiff1 to ktiff20 kdir1 to kdir20
 lhgage lbmwtst lbmwtlb lbmwtkg lbmhtin lbmhtft lbmhtcm lbmi lmetres lkg ltiff1 to ltiff20 ldir1 to ldir20
 mhgage mbmwtst mbmwtlb mbmwtkg mbmhtin mbmhtft mbmhtcm mbmi mmetres mkg mtiff1 to mtiff20 mdir1 to mdir20
 nhgage nbmwtst nbmwtlb nbmwtkg nbmhtin nbmhtft nbmhtcm nbmi nmetres nkg ntiff1 to ntiff20 ndir1 to ndir20
ohgage obmwtst obmwtlb obmwtkg obmhtin obmhtft obmhtcm obmi ometres okg otiff1 to otiff20 odir1 to odir20.

/* ********************* */

get file='e:\temp\w6w15bmi.sav'.

*select if any(xwaveid,
* '0100028', '0100044', '0100188', '0100206', '0100208', '0100280', '0100282', '0100355', '0100376', '0100389',
* '0100392', '0100447', '0100643', '0100645', '0100651', '0100729', '0100895', '0100896', '0101007', '0101216', 
* '0101416', '0101540', '0101606', '0101759', '0102148', '0102241', '0102321', '0102654', '0102811', '1100120').

missing values fbmi gbmi hbmi ibmi jbmi kbmi lbmi mbmi nbmi obmi (lo thru -1).
compute medbmi=median(fbmi,gbmi,hbmi,ibmi,jbmi,kbmi,lbmi,mbmi,nbmi,obmi). 
/* !! COMMA MISSING, medbmi not created*/
/* extract any case with a bmi variation greater than 10 */

SELECT IF
 ~range(fbmi,medbmi-10,medbmi+10) |
 ~range(gbmi,medbmi-10,medbmi+10) |
 ~range(hbmi,medbmi-10,medbmi+10) |
 ~range(ibmi,medbmi-10,medbmi+10) |
 ~range(jbmi,medbmi-10,medbmi+10) |
 ~range(kbmi,medbmi-10,medbmi+10) |
 ~range(lbmi,medbmi-10,medbmi+10) |
 ~range(mbmi,medbmi-10,medbmi+10) |
 ~range(nbmi,medbmi-10,medbmi+10) |
 ~range(obmi,medbmi-10,medbmi+10).
execute.
show n.
 /* !! FULLSTOP MISSING */

missing values fmetres gmetres hmetres imetres jmetres kmetres lmetres mmetres nmetres ometres (lo thru -1).
compute medmetres=median(fmetres,gmetres,hmetres,imetres,jmetres,kmetres,lmetres,mmetres,nmetres,ometres).
missing values fkg gkg hkg ikg jkg kkg lkg mkg nkg okg (lo thru -1).
compute medkg=median(fkg,gkg,hkg,ikg,jkg,kkg,lkg,mkg,nkg,okg).
compute minkg=min(fkg,gkg,hkg,ikg,jkg,kkg,lkg,mkg,nkg,okg).

formats medbmi (f8.1) medmetres (f8.2) medkg (f8.1).
*n of cases 20.

sort cases by xwaveid.
compute tab=10.
formats tab (pib1).

compute fdiff=abs(fbmi-medbmi).
compute gdiff=abs(gbmi-medbmi).
compute hdiff=abs(hbmi-medbmi).
compute idiff=abs(ibmi-medbmi).
compute jdiff=abs(jbmi-medbmi).
compute kdiff=abs(kbmi-medbmi).
compute ldiff=abs(lbmi-medbmi).
compute mdiff=abs(mbmi-medbmi).
compute ndiff=abs(nbmi-medbmi).
compute odiff=abs(obmi-medbmi).

compute maxdiff = max(fdiff,gdiff,hdiff,idiff,jdiff,kdiff,ldiff,mdiff,ndiff,odiff).

sort cases by maxdiff (d).

compute kg100=(any(1,fkg>(minkg+100),gkg>(minkg+100),hkg>(minkg+100),ikg>(minkg+100),jkg>(minkg+100),kkg>(minkg+100),lkg>(minkg+100),mkg>(minkg+100),nkg>(minkg+100),okg>(minkg+100))).
freq vars=kg100.

compute heightdecline= (any(1,(gmetres-hmetres>0.1),(hmetres-imetres>0.1),(imetres-jmetres>0.1),(jmetres-kmetres>0.1),(kmetres-lmetres>0.1),(lmetres-mmetres>0.1),(mmetres-nmetres>0.1),(nmetres-ometres>0.1))).
freq vars=heightdecline.

*echo " tab w6 tab w7 tab w8 tab w9 tab w10 tab w11 tab w12 tab w13 tab w14 ".
*print/xwaveid tab fhhscqid tab ghhscqid tab hhhscqid tab ihhscqid tab jhhscqid tab khhscqid tab lhhscqid tab mhhscqid tab nhhscqid .
*exe.
*print/xwaveid tab fbmi tab gbmi tab hbmi tab ibmi tab jbmi tab kbmi tab lbmi tab mbmi tab tab nbmi tab medbmi.
*exe.
*print/xwaveid tab fmetres tab gmetres tab hmetres tab imetres tab jmetres tab kmetres tab lmetres tab mmetres tab nmetres.
*exe.
*print/xwaveid tab fkg tab gkg tab hkg tab ikg tab jkg tab kkg tab lkg tab mkg nkg.
*exe.

string space1 space2 (a1).
save translate/type=xlsx/version=12/outfile='X:\Editing\wave 15\SCQ bmi\w15-bmi-long\w6w15 outlier kg100 bmi.xlsx'/keep=
 xwaveid fbmi    gbmi    hbmi    ibmi    jbmi    kbmi    lbmi    mbmi  nbmi obmi   medbmi  maxdiff  space1
         fmetres gmetres hmetres imetres jmetres kmetres lmetres mmetres nmetres ometres medmetres heightdecline
         fkg     gkg     hkg     ikg     jkg     kkg     lkg     mkg   nkg  okg  medkg   kg100 ohgage
 /fieldnames/replace.

SELECT IF kg100=1. /* IF REPEATED: IF if */
string caseno (a3).
compute caseno=string($casenum+1,n3).
string out06 to out09 out10 to out15 (a200). /* !! OUT13 -> OUT14 need a string for w14 too */
if ftiff5 ne '' out06=concat('copy "', ltrim(rtrim(fdir5)),"\", ftiff5, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w06.tiff"').
if gtiff6 ne '' out07=concat('copy "', ltrim(rtrim(gdir6)),"\", gtiff6, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w07.tiff"').
if htiff5 ne '' out08=concat('copy "', ltrim(rtrim(hdir5)),"\", htiff5, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w08.tiff"').
if itiff6 ne '' out09=concat('copy "', ltrim(rtrim(idir6)),"\", itiff6, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w09.tiff"').
if jtiff5 ne '' out10=concat('copy "', ltrim(rtrim(jdir5)),"\", jtiff5, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w10.tiff"').
if ktiff6 ne '' out11=concat('copy "', ltrim(rtrim(kdir6)),"\", ktiff6, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w11.tiff"').
if ltiff5 ne '' out12=concat('copy "', ltrim(rtrim(ldir5)),"\", ltiff5, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w12.tiff"').
if mtiff6 ne '' out13=concat('copy "', ltrim(rtrim(mdir6)),"\", mtiff6, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w13.tiff"').
if ntiff5 ne '' out14=concat('copy "', ltrim(rtrim(ndir5)),"\", ntiff5, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w14.tiff"').
if otiff6 ne '' out15=concat('copy "', ltrim(rtrim(odir5)),"\", otiff6, '"',' "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\w15.tiff"').
string outx (a200).
compute outx='start "" "C:\Program Files\Microsoft Office\Office14\OIS.exe" "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\"'. 
write outfile="X:\Editing\wave 15\SCQ bmi\w15-bmi-long\w6w15 multiple bmi kg100 tiffs.bat"
 //'del /q "C:\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ bmi\*.*"'/out06/out07/out08/out09/out10/out11/out12/out13/out14/out15/outx/"@echo " xwaveid " " caseno /"pause". 
EXECUTE.

/* ******************* */
