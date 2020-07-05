* Encoding: windows-1252.

*get file='X:\Editing\wave 16\SCQ life events\Partial data\w16-scq-life-events-extra.sav'.

*copy.
string out4 (a200).
compute out4=concat('copy "', ltrim(rtrim(dir12)),"\", tiff12, '"',' "\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W16\SCQ hours\Part 1\Cases\',ltrim(rtrim(phhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W16\SCQ hours\Part 1\w16-hours-part1-copy-only.bat'/'@echo SCQ ID  ' phhscqid .
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W16\SCQ hours\Part 1\w16-hours-part1-copy-only.bat'/out4.
execute.

*open.
string out6 (a200).
compute out6=concat('@"DUONG DAN CHUONG TRINH MO FILE ANH"',' "DUONG DAN DEN FILE ANH\',ltrim(rtrim(phhscqid)),'.tiff','"').
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W16\SCQ hours\Part 1\w16-hours-part1-open-only.bat'/'@echo SCQ ID  ' phhscqid .
write outfile='\\UoM-File2.unimelb.edu.au\5050\Users\nhanl\Documents\01 HILDA Editing\W16\SCQ hours\Part 1\w16-hours-part1-open-only.bat'/out6.
execute.
