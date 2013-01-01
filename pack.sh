#!/bin/bash
# pack.sh (https://github.com/curtisblackwell/pack_sh)
# by Curtis Blackwell (curtisblackwell.com)
# ---

# Assign working dir to a variable.
PROJECT_DIR=${PWD##*/}

# Assign the line containing the version number to a variable.
ADD_ON_V=$(grep -a -e '[0-9]' $PROJECT_DIR/config.php)

# 1. Remove everything before the version number from variable.
# 2. Remove everything after  the version number from variable.
ADD_ON_V=$(sed -e "s/define.'ADD_ON_V', '//g;s/'.;//g" <<< $ADD_ON_V)

# Make the zip to ship.
## Make the dir to which the to-be-shipped files will be copied.
FUTURE_ZIP=${PROJECT_DIR}_${ADD_ON_V}
mkdir $FUTURE_ZIP
### Copy the files.
cp -R {$PROJECT_DIR,LICENSE,README.md} $FUTURE_ZIP
### Zip that shit.
zip -r $FUTURE_ZIP.zip $FUTURE_ZIP
### Delete FUTURE_ZIP
rm -r $FUTURE_ZIP