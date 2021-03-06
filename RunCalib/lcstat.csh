#!/bin/csh
setenv MPHOT /p/lscratchh/dawson29/macho_photometry
setenv MSTAR /p/lscratchh/axelrod2/MSTAR
setenv TMP /p/lscratchh/axelrod2/tmp
setenv STAT /p/lscratchh/axelrod2/lcStat

set field=$1

set OUTSTAT=${STAT}/F_$field

if (! -d $OUTSTAT) then
    mkdir $OUTSTAT
endif

foreach f (${MPHOT}/F_$field/*.gz)
	echo $f
	gunzip -c $f > ${TMP}/$f:t:r
	./lcStats.py ${TMP}/$f:t:r ${OUTSTAT}/$f:t:r.lcstat ${MSTAR}/DumpStar_$field.txt
	rm -f ${TMP}/$f:t:r
end
