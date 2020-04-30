# get setup date
V_SETUP_DATE=$( ls -lact --full-time /etc | tail -1 | awk '{ print $6 }' )
V_SETUP_DATE2=$( df -h / | grep '^/' | cut -d' ' -f1 | xargs tune2fs -l | grep 'Filesystem created:' | sed -e 'sX  X Xg' -e 'sX^.: [^ ]* XX' | awk '{ printf "%s-%02d-%02d\n",$4,(index("JanFebMarAprMayJunJulAugSepOctNovDec",$1)+2)/3,$2 }' )
if [ "$V_SETUP_DATE" != "$V_SETUP_DATE2" ]
then
        V_SETUP_DATE="$V_SETUP_DATE,$V_SETUP_DATE2"
fi
