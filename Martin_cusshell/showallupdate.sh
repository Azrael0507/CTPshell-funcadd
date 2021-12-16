#!/bin/sh

#file path set
shelldir="/home/trade/shell"
bakdir="./bakfile"
destdir="./destfile"
ecallshell="showall.sh"

shellfile="${shelldir}/${ecallshell}"
bakfile="${bakdir}/${ecallshell}"
destfile="${destdir}/${ecallshell}"


#copy shell
cp ${shellfile} ${bakfile}
cp ${shellfile} ${destfile}



#cus code set
settlepricecode='elif [ $# -eq 1 ] && [ $1 = "--sp" ]\nthen\n\techo "new instrument count in check.txt"\n\tssh tkernel1 "grep PreSettlementPrice /home/trade/tkernel1/dump/check.txt | wc -l"\n\techo "new instrument count in DepthMarketdata"\n\tssh tkernel1 "awk -F "," '"'"'(\\$6 == 0){print \\$2}'"'"' /home/trade/tkernel1/dump/DepthMarketData.csv |grep -v TAS | wc -l"\n\techo "new instrument list in DepthMarketdata"\n\tssh tkernel1 "awk -F "," '"'"'(\\$6 == 0){print \\$2}'"'"' /home/trade/tkernel1/dump/DepthMarketData.csv |grep -v TAS | sort"'

#get edit linenum
linenum=`grep -n '^else' ${destfile} | awk -F ':' '{print $1}'`

#edit code
sed -i "${linenum}i ${settlepricecode}" ${destfile}


#write destfile to shell
#cp ${destfile} ${shellfile}


