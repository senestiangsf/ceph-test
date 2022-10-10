#!/bin/bash

ansible all -m user -a "name=ceph-test password={{ 'ceph@test' | password_hash('sha512') }} state=present" -u root -k

ansible all -m authorized_key -a "user=ceph-test key={{ lookup('file', '/home/ceph-test/.ssh/id_rsa.pub') }} state=present" -u root -k

ansible all -m copy -a "content='ceph-test ALL=(root) NOPASSWD: ALL' dest=/etc/sudoers.d/ceph-test" -u root -k
