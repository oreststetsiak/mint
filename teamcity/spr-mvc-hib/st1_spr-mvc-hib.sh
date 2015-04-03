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
mkdir -p ~/rpmbuild/SOURCES/usr/share/tomcat7/webapps/
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

# changing specfile
echo "INFO: Changing release version in spec file"
pushd %teamcity.build.checkoutDir%/ > /dev/null 2>&1
svn co --username admin --password 159357 https://svn.bazaarss.com/svn/bvc/ops/branches/user/orest-avi16/packages/spr-mvc-hib/spec/ spec  > /dev/null 2>&1
pushd spec/ > /dev/null 2>&1
awk '/rel_build_num/{ $3>=0&&$3<=99&&$3++; } OFS="\t" {print}' spr-mvc-hib.spec > tmp && mv tmp spr-mvc-hib.spec
svn commit -m "Teamcity modified spr-mvc-hib.spec file"  > /dev/null 2>&1

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
echo -e "INFO: Preparing sources for building"
cp %teamcity.build.checkoutDir%/spec/spr-mvc-hib.spec %teamcity.agent.jvm.user.home%/rpmbuild/SPECS/
rm -rf %teamcity.build.checkoutDir%/spec
