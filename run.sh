##Check if a change is needed to JVM RAM size
[ ! -z $JVM_RAM ] && sed -e "s/Xmx[0-9]\{3,4\}/Xmx$JVM_RAM/" /nxfilter/bin/startup.sh

##Run nxfilter
/nxfilter/bin/startup.sh
