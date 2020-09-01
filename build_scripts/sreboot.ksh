!#/bin/bash

set_vars() {
        TMP=$HOME/scripts/tmp
        NAME=add_python_stuff.txt
}

set_vars
echo "reboot" >$TMP/$NAME
/sbin/reboot
