#!/bin/sh

#file path set
shelldir="/home/trade/shell"
bakdir="./bakfile"
destdir="./destfile"
ecallshell="ecall.sh"

shellfile="${shelldir}/${ecallshell}"
bakfile="${bakdir}/${ecallshell}"
destfile="${destdir}/${ecallshell}"


#copy shell
cp ${shellfile} ${bakfile}
cp ${shellfile} ${destfile}

#envset
#cus code set
numalistset='NumaListFile=`getcfg.sh NumaListFile`'

#edit code
sed -i "18i ${numalistset}" ${destfile}


#startservice change
#cus code set
startcode='\\tnumaargv=$(grep ${svr} ${NumaListFile} | awk '"'"'{print $2,$3}'"'"')\n\tif [ ! "${numaargv}" ]; then\n\t\t$SH $svr $SH_ARG ${BasePath}shell/start.sh $* ">" $svr/log/out &\n\telse\n\t\t$SH $svr $SH_ARG ${BasePath}shell/numastart.sh ${numaargv} $* ">" $svr/log/out &\n\tfi\n'

#get edit linenum
linenum=`grep -n 'shell/start.sh' ${destfile} | awk -F ':' '{print $1}'`

#edit code
sed -i "${linenum}c ${startcode}" ${destfile}


#restartservice change
#cus code set
restartcode='\\tnumaargv=$(grep ${svr} ${NumaListFile} | awk '"'"'{print $2,$3}'"'"')\n\tif [ ! "${numaargv}" ]; then\n\t\t$SH $svr $SH_ARG ${BasePath}shell/restart.sh $* ">" $svr/log/out &\n\telse\n\t\t$SH $svr $SH_ARG ${BasePath}shell/numarestart.sh ${numaargv} $* ">" $svr/log/out &\n\tfi\n'

#get edit linenum
linenum=`grep -n 'shell/restart.sh' ${destfile} | awk -F ':' '{print $1}'`

#edit code
sed -i "${linenum}c ${restartcode}" ${destfile}


#write destfile to shell
#cp ${destfile} ${shellfile}


