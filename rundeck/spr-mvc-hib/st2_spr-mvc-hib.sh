
echo -e "INFO: stopping crond"

sudo service crond stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping crond"
    echo -e "INFO: Trying to restart crond"
    sudo service crond restart > /dev/null 2>&1
    if [ $exst -ne 0 ]; then
        echo -e "ERROR: problems with restarting crond"
        exit 1
    elif [ $exst -eq 0 ]; then
        echo -e "INFO: crond restarted"
    fi
elif [ $exst -eq 0 ]; then
    echo -e "INFO: crond stoped"
fi

echo -e "INFO: Installing @option.dbase2aws3_ver@.el6.x86_64.rpm"
sudo rpm -Uhv /home/ec2-user/RPMS/@option.dbase2aws3_ver@.el6.x86_64.rpm > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: Was not installed: @option.dbase2aws3_ver@.el6.x86_64.rpm"
    exit1
elif [ $exst -eq 0 ]; then
    echo -e "INFO: Installed: @option.dbase2aws3_ver@.el6.x86_64.rpm"
fi

echo -e "INFO: starting crond"

sudo service crond start > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with starting crond"
    echo -e "INFO: Trying to restart crond"
    sudo service crond restart > /dev/null 2>&1
    if [ $exst -ne 0 ]; then
        echo -e "ERROR: problems with restarting crond"
        exit 1
    elif [ $exst -eq 0 ]; then
        echo -e "INFO: crond restarted"
    fi
elif [ $exst -eq 0 ]; then
    echo -e "INFO: crond started"
fi

echo -e "INFO: finish"
