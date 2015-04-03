# restart all services and remove temp files
function servrestart {
    echo "INFO: restarting services"
    sudo service rsyslog restart > /dev/null 2>&1
    sudo service zabbix-agent restart > /dev/null 2>&1
    sudo service httpd restart > /dev/null 2>&1
    sudo service tomcat7 restart > /dev/null 2>&1
    sudo service mysqld restart > /dev/null 2>&1
    sudo service rinetd restart > /dev/null 2>&1
    echo "INFO: all services restarted"
    echo "INFO: removing temporary files"
    sudo rm -rf /var/tmp/spr-mvc-hib-configs/ > /dev/null 2>&1
    echo "INFO: finish"
    exit 0
}

echo -e "INFO: downloading configs from SVN"
svn co --username admin --password 159357 https://127.0.0.1:4443/svn/bvc/ops/branches/user/orest-avi16/packages/spr-mvc-hib-configs/src/etc/ /var/tmp/smhetc > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with downloading sources from SVN"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: sources was successfully downloaded from SVN"
fi

echo -e "INFO: stopping all services:"

sudo service rsyslog stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping rsyslog"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: rsyslog stoped"
fi

sudo service zabbix-agent stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping zabbix-agent"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: zabbix-agent stoped"
fi

sudo service httpd stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping httpd"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: httpd stoped"
fi

sudo service tomcat7 stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping tomcat7"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: tomcat7 stoped"
fi

sudo service mysqld stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping mysqld"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: mysqld stoped"
fi

sudo service rinetd stop > /dev/null 2>&1
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: problems with stopping rinetd"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: rinetd stoped"
fi

echo -e "INFO: coping config files"

sudo cp /var/tmp/smhetc/httpd/conf.d/www.testapp.com.conf /etc/httpd/conf.d/www.testapp.com.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/httpd/conf.d/www.testapp.com.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/httpd/conf.d/www.testapp.com.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.conf /etc/rsyslog.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.d/catalina.conf /etc/rsyslog.d/catalina.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.d/catalina.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.d/catalina.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.d/generallog.conf /etc/rsyslog.d/generallog.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.d/generallog.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.d/generallog.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.d/httpd-access.conf /etc/rsyslog.d/httpd-access.conf 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.d/httpd-access.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.d/httpd-access.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.d/httpd-error.conf /etc/rsyslog.d/httpd-error.conf 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.d/httpd-error.conf "
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.d/httpd-error.conf"
fi

sudo cp /var/tmp/smhetc/rsyslog.d/dbase2aws3.conf /etc/rsyslog.d/dbase2aws3.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rsyslog.d/dbase2aws3.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rsyslog.d/dbase2aws3.conf"
fi

sudo cp /var/tmp/smhetc/tomcat7/jmxremote.access /etc/tomcat7/jmxremote.access 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/tomcat7/jmxremote.access "
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/tomcat7/jmxremote.access"
fi

sudo cp /var/tmp/smhetc/tomcat7/server.xml /etc/tomcat7/server.xml 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/tomcat7/server.xml "
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/tomcat7/server.xml"
fi

sudo cp /var/tmp/smhetc/tomcat7/tomcat7.conf /etc/tomcat7/tomcat7.conf
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/tomcat7/tomcat7.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/tomcat7/tomcat7.conf"
fi

sudo cp /var/tmp/smhetc/tomcat7/jmxremote.password /etc/tomcat7/jmxremote.password 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/tomcat7/jmxremote.password"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/tomcat7/jmxremote.password"
fi

sudo cp /var/tmp/smhetc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/zabbix/zabbix_agentd.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/zabbix/zabbix_agentd.conf"
fi

sudo cp /var/tmp/smhetc/rinetd.conf /etc/rinetd.conf 
exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: can't copy /etc/rinetd.conf"
    servrestart
elif [ $exst -eq 0 ]; then
    echo -e "INFO: copied: /etc/rinetd.conf"
fi

echo -e "INFO: all files copied succesfully!"
echo -e "INFO: changing owners and permissions for config files"
sudo chown tomcat:tomcat /etc/tomcat7/jmxremote.access 
sudo chown tomcat:tomcat /etc/tomcat7/server.xml 
sudo chown tomcat:tomcat /etc/tomcat7/tomcat7.conf
sudo chown tomcat:tomcat /etc/tomcat7/jmxremote.password 
sudo chmod 400 /etc/tomcat7/jmxremote.password
echo -e "INFO: owners and permissions for config files was changed"

servrestart
