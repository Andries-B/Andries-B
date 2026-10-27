#!/bin/bash
#
# diag
#
# created: 2026-10-27
# changed: 2026-10-27
# author: A. Broekema

DIAG='itam_diag.txt'


eval_to_log ()
{
	echo          >> $DIAG
	echo "--- $@" >> $DIAG
	eval $@ >> $DIAG
}


echo "ITAM report" > $DIAG
eval_to_log date
eval_to_log uptime
eval_to_log uname -a
eval_to_log cat /etc/lsb-release
eval_to_log ifconfig -a
eval_to_log df -h
eval_to_log free -t

#dpkg-query --show --showformat='${Package}\t${Version}\n'
eval_to_log dpkg-query --show --showformat=\'\${Package}\\t\${Version}\\n\'

