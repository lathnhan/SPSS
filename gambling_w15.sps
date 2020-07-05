* Encoding: windows-1252.
*the rule of value taking priority.
*stem is "no" (code 1) if value is unambiguously 0.
*stem is "yes" (code 2) if value is unambiguously greater than 0.

save translate outfile = 'X:\Editing\wave 15\SCQ Gambling\w15-gambling-id.csv' / type=csv / keep=ohhscqid.

*These are the two automatic cleans that Simon will implement for the gambling questions.

*if use in (-4,-5,1) and (amount>0 or amount=-7) then use=2. /*assume yes*/
*if use=-4 and amount=0 then use=1. /*assume no*/

