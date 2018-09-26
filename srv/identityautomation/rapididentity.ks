lang en_US.UTF-8
keyboard us
timezone --isUtc America/Chicago
selinux --permissive
network  --bootproto=dhcp --device=eth0 --onboot=on

auth --useshadow --enablemd5
rootpw  --iscrypted $6$V1tDoQyJiHojoQST$oBNbdzlIxDUjBVXddncAe2XH31wG5aKfKKUV7U1S9u3vxcQy9cOR65IJOWgJMVM2YWbVCRWWKsLKeh/xitRAw1

install
cdrom
#repo --name=base --mirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=os
#repo --name=updates --mirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=updates
text
skipx
logging --level=info
# reboot --eject ## Added by partner

bootloader --location=mbr
zerombr
clearpart --all
part /boot --fstype=ext4 --size=500
part pv.008002 --grow --size=1
volgroup vg_idauto --pesize=4096 pv.008002
logvol / --fstype=ext4 --name=lv_root --vgname=vg_idauto --grow --size=1024 --maxsize=5120000
logvol swap --name=lv_swap --vgname=vg_idauto --grow --size=1984 --maxsize=1984

%packages
syslinux
kernel
@base
@core
mtools
python-dmidecode
sgpio
genisoimage
wodim
libXmu
libXrender
libXi
libXtst
-abrt-cli
-abrt-addon-kerneloops
-abrt-addon-ccpp
-nano
-abrt-addon-python
-gok
-vino
-gdm-plugin-fingerprint
-PackageKit-gstreamer-plugin
-gnome-backgrounds
-rhythmbox
-compiz-gnome
-scenery-backgrounds
-gnote
-evince-dvi
-seahorse
-sound-juicer
telnet
bind-utils
wget
uuid
net-snmp
net-snmp-utils
nano
samba-client
screen
openldap-clients
iptables
memtest86+
anaconda
device-mapper-multipath
isomd5sum

%end

%post --nochroot

# if we don't copy resolv.conf before switching chrooting, then we won't have DNS resolution
# even though on CentOS 6.7 this didn't seem to be necessary

cp /etc/resolv.conf /mnt/sysimage/etc/resolv.conf

%end


%post

# switch to alternate console to interact with the user
# and so we're not running completely blind
# exec < /dev/tty6 > /dev/tty6 2> /dev/tty6
#chvt 6

exec < /dev/tty1 > /dev/tty1 2> /dev/tty1
tput smcup

clear
echo "************************************************************************"
echo "    Installing and configuring RapidIdentity"
echo "************************************************************************"
set -x
#parse command line options for things we are interested in
export IDAUTO_OPTS=""
export DEBUG_SHELL=0
APPLIANCE_INSTALL_VERSION=latest
for opt in $(cat /proc/cmdline); do
    case "$opt" in
        --dev | --rolling | --version=* | --tz=* | --ask | --reboot)
            export IDAUTO_OPTS="${IDAUTO_OPTS} $opt"
        ;;
        --debug)
            export DEBUG_SHELL=1
        ;;
        --installer-version=*)
            APPLIANCE_INSTALL_VERSION=`printf "${opt}" | sed 's/^.*=//g' yourfile`
        ;;
    esac
done

export APPLIANCE_INSTALL_VERSION

########################################################################
# Create a sub-script so the output can be captured
# Must change "$" to "\$" and "`" to "\`" to avoid shell quoting
########################################################################
cat > /root/post-install << EOF_post
#!/bin/bash

# Get and run the good stuff

if ! wget -O /root/ApplianceSetupScript.sh \
    https://idauto-apps.s3.amazonaws.com/appliance-install/scripts/${APPLIANCE_INSTALL_VERSION}/ApplianceSetupScript.sh; then

    echo "************************************************************************"
    echo "    Unable to download ApplianceSetupScript.sh - installation of"
    echo "    appliance will be incomplete!!"
    echo "    Press Enter to continue"
    echo "************************************************************************"
    read
    exit
fi

# temporarily force looking at network for CentOS-Base.repo while we run the standard setup script
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.save
sed -e 's|^baseurl|#baseurl|g' -e 's|^#mirrorlist|mirrorlist|g' /etc/yum.repos.d/CentOS-Base.repo.save >/etc/yum.repos.d/CentOS-Base.repo

/bin/bash /root/ApplianceSetupScript.sh ${IDAUTO_OPTS} 2>&1 | tee /root/ApplianceSetupScript.log

mv /etc/yum.repos.d/CentOS-Base.repo.save /etc/yum.repos.d/CentOS-Base.repo

/sbin/chkconfig NetworkManager off

# Set up Grub to not show a splash
sed -i 's| rhgb quiet||g' /boot/grub/grub.conf
sed -i 's|timeout=5|timeout=0|g' /boot/grub/grub.conf
sed -i 's|^splash|#splash|g' /boot/grub/grub.conf

EOF_post


if [ ${DEBUG_SHELL} -eq 1; then
    echo "************************************************************************"
    echo "    Pausing in Debug Shell before running install script
    echo "    TYPE exit to leave shell and continue
    echo "************************************************************************"
    bash
fi


/bin/bash /root/post-install 2>&1 | tee /root/post-install.log

# add the idauto-partner user                                               #partner-only#
useradd -m idauto-partner                                                   #partner-only#
                                                                            #partner-only#
#make them set a password                                                   #partner-only#
while egrep -q '^idauto-partner:(!!|\*)?:' /etc/shadow; do                  #partner-only#
    echo "************************************************************************"
    echo "Must set password for idauto-partner account!!!"                  #partner-only#
    echo "************************************************************************"
    passwd idauto-partner                                                   #partner-only#
done                                                                        #partner-only#
                                                                            #partner-only#
#give idauto-partner sudo privileges                                        #partner-only#
echo 'idauto-partner ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/idauto-partner         #partner-only# ## Modified by partner
                                                                            #partner-only#

if [ ${DEBUG_SHELL} -eq 1; then
    echo "************************************************************************"
    echo "    Pausing in Debug Shell after running install script
    echo "    TYPE exit to leave shell and continue
    echo "*******************************"
    bash
fi

echo "************************************************************************"                                   ## Added by partner
echo "    Install and configure Guest Additions"                                                                  ## Added by partner
echo "************************************************************************"                                   ## Added by partner

HYPERVISOR="none"                                                                                                 ## Added by partner
for opt in $(cat /proc/cmdline); do                                                                               ## Added by partner
    case "$opt" in                                                                                                ## Added by partner
        --hyperv)                                                                                                 ## Added by partner
            export HYPERVISOR="hyperv"                                                                            ## Added by partner
        ;;                                                                                                        ## Added by partner
        --virtualbox)                                                                                             ## Added by partner
            export HYPERVISOR="virtualbox"                                                                        ## Added by partner
        ;;                                                                                                        ## Added by partner
    esac                                                                                                          ## Added by partner
done                                                                                                              ## Added by partner

if [ ${HYPERVISOR} -eq "hyperv"; then                                                                             ## Added by partner
    wget https://download.microsoft.com/download/6/8/F/68FE11B8-FAA4-4F8D-8C7D-74DA7F2CFC8C/lis-rpms-4.2.6.tar.gz ## Added by partner
    tar xvzf lis-rpms-4.2.6.tar.gz                                                                                ## Added by partner
    cd LISISO                                                                                                     ## Added by partner
    ./install.sh                                                                                                  ## Added by partner
fi                                                                                                                ## Added by partner

tput rmcup

# switch back to main console
#chvt 1
#exec < /dev/tty1 > /dev/tty1 2> /dev/tty1


%end
