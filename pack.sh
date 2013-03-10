#!/bin/bash
# pack.sh (https://github.com/curtisblackwell/pack_sh)
# by Curtis Blackwell (curtisblackwell.com)
# ---

# Assign working dir to a variable.
if [[ $1 == "" ]];
  then
    ADD_ON_NAME=${PWD##*/}
  else
    ADD_ON_NAME=$1
fi

# Assign the line containing the version number to a variable.
ADD_ON_V=$(grep -a -e '[0-9]' $ADD_ON_NAME/config.php)

# 1. Remove everything before the version number from variable.
# 2. Remove everything after  the version number from variable.
ADD_ON_V=$(sed -e "s/define.'ADD_ON_V', '//g;s/'.;//g" <<< $ADD_ON_V)

# Make the zip to ship.
## Make the dir to which the to-be-shipped files will be copied.
FUTURE_ZIP=${ADD_ON_NAME}_${ADD_ON_V}
mkdir $FUTURE_ZIP
### Copy the files.
cp -R {$ADD_ON_NAME,LICENSE,README.md} $FUTURE_ZIP
### Zip that shit.
zip -r $FUTURE_ZIP.zip $FUTURE_ZIP
### Delete FUTURE_ZIP
rm -r $FUTURE_ZIP
