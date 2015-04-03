# Directory, where built package will be located
DESTPACKAGEDIR=%teamcity.agent.jvm.user.home%/RPMS/

# cleanup
function cleanup {
    rm -rf %teamcity.build.checkoutDir%
    rm -rf %teamcity.agent.jvm.user.home%/rpmbuild
    echo -e "INFO: Cleanup finished"
    exit 0
}

# create new rpmbuild file tree
rm -rf %teamcity.agent.jvm.user.home%/rpmbuild
mkdir ~/rpmbuild/
mkdir ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

# changinging ver in specfile, and commiting it
echo "INFO: Changing release version in spec file"
pushd %teamcity.build.checkoutDir%/ > /dev/null 2>&1
svn co --username admin --password 159357 https://svn.bazaarss.com/svn/bvc/ops/branches/user/orest-avi16/packages/dbase2aws3/spec/ > /dev/null 2>&1

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: Problems with downloading spec file from SVN"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: Spec file was successfully downloaded from SVN"
fi

pushd spec/ > /dev/null 2>&1
awk '/rel_build_num/{ $3>=0&&$3<=99&&$3++; } OFS="\t" {print}' dbase2aws3.spec > tmp && mv tmp dbase2aws3.spec
svn commit -m "Teamcity modified dbase2aws3.spec file" > /dev/null 2>&1

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: Problems with commiting spec with new version to SVN"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: New spec file succesfully commited to SVN"
fi
popd > /dev/null 2>&1
popd > /dev/null 2>&1

# copy all sources for building process
cp %teamcity.build.checkoutDir%/spec/dbase2aws3.spec %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/
rm -rf %teamcity.build.checkoutDir%/spec
echo -e "INFO: Preparing sources for building"
cp -r %teamcity.build.checkoutDir%/* %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES/

# building package
rpmbuild -ba %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/dbase2aws3.spec --buildroot %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES > /dev/null 2>&1

exst=$?
if [ $exst -ne 0 ]; then
    echo -e "ERROR: RPM build failed"
    cleanup
elif [ $exst -eq 0 ]; then
    echo -e "INFO: RPM build finished"
fi

PACKAGENAME=`ls %teamcity.agent.jvm.user.home%/rpmbuild/RPMS/x86_64/`
echo "INFO: RPM was named as: ${PACKAGENAME}"

# creating destination dir, if it isn't exist
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
