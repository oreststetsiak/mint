# Directory, where built package will be located
DESTPACKAGEDIR=%teamcity.agent.jvm.user.home%/RPMS/

# cleanup
function cleanup {
    rm -rf %teamcity.build.checkoutDir%
    rm -rf %teamcity.agent.jvm.user.home%/rpmbuild
    echo -e "INFO: Cleanup finished"
    exit 0
}

# copy *.war file in rpmbuild tree
cp -r %teamcity.build.checkoutDir%/target/spr-mvc-hib.war %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES/usr/share/tomcat7/webapps/

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: Web application archive wasn't copied to rpm build tree"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: Web application archive was copied to rpm build tree"
fi

# building package
rpmbuild -ba %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/spr-mvc-hib.spec --buildroot %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES  > /dev/null 2>&1

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: RPM build failed"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: RPM build finished"
fi

PACKAGENAME=`ls %teamcity.agent.jvm.user.home%/rpmbuild/RPMS/x86_64/`
echo "INFO: RPM was named as: ${PACKAGENAME}"

# creatind destination dir, if it isn't exist
ls $DESTPACKAGEDIR > /dev/null 2>&1
if [ $? -ne 0 ]; then
    mkdir $DESTPACKAGEDIR
fi

# copy rpm to destination dir
cp %teamcity.agent.jvm.user.home%/rpmbuild/RPMS/`uname -m`/${PACKAGENAME} $DESTPACKAGEDIR

# "Uploading package to EC2 instance."
scp -i ~/ec2_free_inst_1.pem ~/RPMS/${PACKAGENAME} ec2-user@54.213.96.200:~/RPMS

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: RPM wasn't published to AWS EC2"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: RPM published to AWS EC2"
fi

cleanup
