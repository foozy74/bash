#!/bin/bash
 
for I in $( cat esxhost.txt )
do
        sshpass -p 'securePassword' ssh -o StrictHostKeyChecking=no root@$I '/etc/init.d/smartd stop
        chkconfig smartd off' 
done
