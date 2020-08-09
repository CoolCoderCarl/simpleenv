#!/bin/bash
###
### CREATE USER
ansible test -u root --ask-pass -m user -a "name=ansible"

### SSH-COPY-ID
ansible test -u root --ask-pass -m authorized_keys -a "user=ansible state=present key=\"{{ lookup(\'file\',\'/home/ansible/.ssh/id_rsa.pub\') }}\""

### MAKE NEW USER POWERFULL
ansible test -u root --ask-pass -m copy -a "content='ansible ALL=(ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/ansible mode=0440"
