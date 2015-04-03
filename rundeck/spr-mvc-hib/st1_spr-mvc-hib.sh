
echo -e "INFO: stopping tomcat7"

sudo service tomcat7 stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping tomcat7"
    echo -e "INFO: Trying to restart tomcat7"
    sudo service tomcat7 restart > /dev/null 2>&1
    if [ $exst -ne 0 ]; then
        echo -e "ERROR: problems with restarting tomcat7"
        exit 1
    elif [ $exst -eq 0 ]; then
        echo -e "INFO: tomcat7 restarted"
    fi
elif [ $exst -eq 0 ]; then
    echo -e "INFO: tomcat7 stoped"
fi

echo -e "INFO: Installing @option.spr-mvc-hib_ver@.el6.x86_64.rpm"
sudo rpm -Uhv /home/ec2-user/RPMS/@option.spr-mvc-hib_ver@.el6.x86_64.rpm > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: Was not installed: @option.spr-mvc-hib_ver@.el6.x86_64.rpm"
    exit1
elif [ $exst -eq 0 ]; then
    echo -e "INFO: Installed: @option.spr-mvc-hib_ver@.el6.x86_64.rpm"
fi

echo -e "INFO: starting tomcat7"

sudo service tomcat7 start > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with starting tomcat7"
    echo -e "INFO: Trying to restart tomcat7"
    sudo service tomcat7 restart > /dev/null 2>&1
    if [ $exst -ne 0 ]; then
        echo -e "ERROR: problems with restarting tomcat7"
        exit 1
    elif [ $exst -eq 0 ]; then
        echo -e "INFO: tomcat7 restarted"
    fi
elif [ $exst -eq 0 ]; then
    echo -e "INFO: tomcat7 started"
fi

echo -e "INFO: finish"