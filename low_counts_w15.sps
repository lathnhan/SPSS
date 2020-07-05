* Encoding: windows-1252.
* copy images.

delete variables out out2.

string out  (a200).
string out2 (a200).
do if any(pg2,2).
compute out=concat('copy "', ltrim(rtrim(dir2)),"\", tiff2, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 2'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg3,1,2).
compute out=concat('copy "', ltrim(rtrim(dir3)),"\", tiff3, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 3'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg4,1,2,3).
compute out=concat('copy "', ltrim(rtrim(dir4)),"\", tiff4, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 4'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg5,1,2).
compute out=concat('copy "', ltrim(rtrim(dir5)),"\", tiff5, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 5'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg6,1,2).
compute out=concat('copy "', ltrim(rtrim(dir6)),"\", tiff6, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 6'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg7,1,2,3).
compute out=concat('copy "', ltrim(rtrim(dir7)),"\", tiff7, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 7'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg8,1,2).
compute out=concat('copy "', ltrim(rtrim(dir8)),"\", tiff8, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 8'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg9,1,2).
compute out=concat('copy "', ltrim(rtrim(dir9)),"\", tiff9, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 9'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg10,1,2).
compute out=concat('copy "', ltrim(rtrim(dir10)),"\", tiff10, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 10'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg11,1,2).
compute out=concat('copy "', ltrim(rtrim(dir11)),"\", tiff11, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 11'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg12,1,2).
compute out=concat('copy "', ltrim(rtrim(dir12)),"\", tiff12, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 12'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg13,1,2).
compute out=concat('copy "', ltrim(rtrim(dir13)),"\", tiff13, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 13'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg14,1,2).
compute out=concat('copy "', ltrim(rtrim(dir14)),"\", tiff14, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 14'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg15,1).
compute out=concat('copy "', ltrim(rtrim(dir15)),"\", tiff15, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 15'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg16,1).
compute out=concat('copy "', ltrim(rtrim(dir16)),"\", tiff16, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 16'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg17,2,3,4).
compute out=concat('copy "', ltrim(rtrim(dir17)),"\", tiff17, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 17'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg18,2).
compute out=concat('copy "', ltrim(rtrim(dir18)),"\", tiff18, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 18'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.
else if any(pg19,1,2).
compute out=concat('copy "', ltrim(rtrim(dir19)),"\", tiff19, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\Scanned images\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 19'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/out.

end if.
execute.

**************open*********

delete variables out out2.
string out  (a200).
string out2 (a200).
do if any(pg2,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 2'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg3,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 3'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg4,1,2,3).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 4'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg5,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 5'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg6,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 6'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg7,1,2,3).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 7'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg8,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 8'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg9,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 9'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg10,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 10'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg11,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 11'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg12,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 12'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg13,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 13'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg14,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 14'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg15,1).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 15'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg16,1).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 16'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg17,2,3,4).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 17'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg18,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 18'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.
else if any(pg19,1,2).
compute out=concat('@"CHUONG TRINH MO FILE SCAN"',' "DUONG DAN DEN FILE SCAN\',ltrim(rtrim(ohhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/'@echo SCQ ID  ' ohhscqid ' Page: 19'.
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount-open.bat'/out.

end if.
execute.

*write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W15\SCQ low count\W15-lowcount.bat'/'@"C:\Program Files\Microsoft Office\Office14\OIS.exe" /A "page=1&pagemode=none" "c:\temp\temp.tiff"'.
