#!/bin/bash

ansible all -m user -a "name=mk2cephtest password={{ 'mk2ceph@test' | password_hash('sha512') }} state=present" -u root -k

ansible all -m authorized_key -a "user=mk2cephtest key={{ lookup('file', '/home/mk2cephtest/.ssh/id_rsa.pub') }} state=present" -u root -k

ansible all -m copy -a "content='mk2cephtest ALL=(root) NOPASSWD: ALL' dest=/etc/sudoers.d/mk2cephtest" -u root -k
