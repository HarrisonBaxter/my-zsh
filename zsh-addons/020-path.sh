#!/bin/sh

# low priority
PATH=${PATH}:~/db
PATH=${PATH}:/dbox/bin
PATH=${PATH}:/dbox/bin/gradle-4.0.1/bin
PATH=${PATH}:"$HOME/.rbenv/bin"



#high priority
PATH=$JAVA_HOME/bin:$PATH

export PATH
