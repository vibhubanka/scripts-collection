#!/bin/bash

git fetch --all
if [ -z "$1" ]; then
    echo "Please pass zip file name as parameter!"
    exit 1
fi
echo "Copy and Paste the source commit ID and press ENTER. Leave empty for HEAD commit."
read -p "Commit ID: " commitId

if [ -z "$commitId" ]; then
  echo "Using HEAD commit as default commit ID."
  commitId=`git rev-parse HEAD`
fi

if ! $(git cat-file -e $commitId^{commit} >& /dev/null) ; then
  echo "Invalid commit ID. Please rerun the script and try again!"
  exit 1
fi

cd $(git rev-parse --show-toplevel)

FILES=`git diff --name-only "origin/master"..."$commitId"`
PARAM=""
echo "Zipping below files..."
for f in $FILES; do
  echo "> $f"
  PARAM=`echo "$PARAM$f "`
done
zip -q -r $1 $PARAM

cd $OLDPWD
