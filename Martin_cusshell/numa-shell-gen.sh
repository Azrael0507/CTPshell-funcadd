#!/bin/sh

#file path set
shelldir="/home/trade/shell"
bakdir="./bakfile"
destdir="./destfile"
startshell="start.sh"
restartshell="restart.sh"

startshellfile="${shelldir}/${startshell}"
restartshellfile="${shelldir}/${restartshell}"
startdestfile="${destdir}/numa${startshell}"
restartdestfile="${destdir}/numa${restartshell}"

#copy shell
cp ${startshellfile} ${bakdir}/
cp ${restartshellfile} ${bakdir}/

#cus code set
argvset='cpuid=$1\nshift 1\nnodeid=$1\nshift 1\n'
numacode='taskset -c ${cpuid} numactl -m ${nodeid} '


#edit file to destfile
sed "s/^\(.*\)\(nohup .*$\)/\1${numacode}\2/g" ${startshellfile} | sed "3i ${argvset}" > ${startdestfile}
sed "s/^\(.*\)\(nohup .*$\)/\1${numacode}\2/g" ${restartshellfile} | sed "3i ${argvset}" > ${restartdestfile}

#write destfile to shell
#cp ${startdestfile} ${shelldir}/
#cp ${restartdestfile} ${shelldir}/
