#!/bin/sh

#file path set
shelldir="/home/trade/shell"
bakdir="./bakfile"
destdir="./destfile"
backupshell="backup.sh"

shellfile="${shelldir}/${backupshell}"
bakfile="${bakdir}/${backupshell}"
destfile="${destdir}/${backupshell}"

#copy shell
cp ${shellfile} ${bakfile}


#cus code set
pigzcode='tar -cvf - $BAKPATH 2>>${LocalBackupPath}/${BAKPATH}.log |pigz -p 6 > ${BAKPATH}.tar.gz'

#get edit linenum
linenum=`grep -n 'tar' ${shellfile} | awk -F ':' '{print $1}'`

#edit file to destfile
sed "${linenum}c ${pigzcode}" ${shellfile} > ${destfile}

#write destfile to shell
#cp ${destfile} ${shellfile}
