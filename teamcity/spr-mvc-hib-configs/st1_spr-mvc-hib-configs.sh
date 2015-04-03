# Directory, where built package will be located on agent
DESTPACKAGEDIR=%teamcity.agent.jvm.user.home%/RPMS/

# create new rpmbuild files tree
rm -rf %teamcity.agent.jvm.user.home%/rpmbuild
mkdir ~/rpmbuild/
mkdir ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

# changinging ver in specfile, and commiting it
pushd %teamcity.build.checkoutDir%/
svn co --username admin --password 159357 https://svn.bazaarss.com/svn/bvc/ops/branches/user/orest-avi16/packages/spr-mvc-hib-configs/spec/ spec
pushd spec/
awk '/rel_build_num/{ $3>=0&&$3<=99&&$3++; } OFS="\t" {print}' spr-mvc-hib-configs.spec > tmp && mv tmp spr-mvc-hib-configs.spec
svn commit -m "Teamcity modified spr-mvc-hib-configs.spec file"
popd
popd

# copy all sources for building process
cp %teamcity.build.checkoutDir%/spec/spr-mvc-hib-configs.spec %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/
rm -rf %teamcity.build.checkoutDir%/spec
cp -r %teamcity.build.checkoutDir%/* %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES/

# building package
rpmbuild -ba %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/spr-mvc-hib-configs.spec --buildroot %teamcity.agent.jvm.user.home%/rpmbuild/SOURCES
PACKAGENAME=`ls %teamcity.agent.jvm.user.home%/rpmbuild/RPMS/x86_64/`
echo "Package name is: ${PACKAGENAME}."

# creating destination dir, if it isn't exist
ls $DESTPACKAGEDIR > /dev/null 2>&1
if [ $? -ne 0 ]; then
    mkdir $DESTPACKAGEDIR
fi

# copy rpm to destination dir
cp %teamcity.agent.jvm.user.home%/rpmbuild/RPMS/`uname -m`/${PACKAGENAME} ${DESTPACKAGEDIR}

# "Uploading package to EC2 instance."
scp -i ~/ec2_free_inst_1.pem ~/RPMS/${PACKAGENAME} ec2-user@54.213.96.200:~/RPMS

# cleanup
rm -rf %teamcity.build.checkoutDir%
rm -rf %teamcity.agent.jvm.user.home%/rpmbuild