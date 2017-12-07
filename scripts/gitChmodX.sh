#!/bin/sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for f in `find $DIR -type f| grep -v .git`; do echo "gitchmoding $f" && git update-index --chmod=+x $f; done