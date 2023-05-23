
 i had a problem with centos container which was not excuting yum command
 solution in this web site:
 https://techglimpse.com/failed-metadata-repo-appstream-centos-8/
    This is the solution:-

    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    yum install -y openssh-server
#    sed -E 's/^#(PermitRootLogin )no/\1yes/' /etc/ssh/sshd_config -i
    sed -E 's/^#?(PermitRootLogin ).*/\1yes/' /etc/ssh/sshd_config -i

    ssh-keygen -A
    yum install passwd -y
    echo '123' | passwd root --stdin
    /usr/sbin/sshd &


# for ubuntu

    apt-get update
    apt-get install openssh-server    # is there -y here
    
    sed -E 's/^#?(PermitRootLogin ).*/\1yes/' /etc/ssh/sshd_config -i
    passwd                       # , 123

