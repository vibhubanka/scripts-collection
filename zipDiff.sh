#!/bin/bash

if [ -z "$1" ]; then
    echo "Please pass zip file name as parameter!"
    exit 1
fi

git fetch -q --all && echo "Updated objects and refs." || echo "Could not update objects and refs."

echo "Copy and Paste the source commit ID and press ENTER. Leave empty for HEAD commit."
read -p "Commit ID: " commit_id

if [ -z "$commit_id" ]; then
  echo "Using HEAD commit as default commit ID."
  commit_id=`git rev-parse HEAD`
fi

if ! $(git cat-file -e $commit_id^{commit} >& /dev/null) ; then
  echo "Invalid commit ID. Please rerun the script and try again!"
  exit 1
fi

git_root=$(git rev-parse --show-toplevel)
cd $git_root

FILES=`git diff --name-only "origin/master"..."$commit_id"`
PARAM=""
echo "Below files will be zipped..."
for f in $FILES; do
  echo "> $f"
  PARAM=`echo "$PARAM$f "`
done

read -p "Continue? (Y / N): " response
if [[ $response == [yY] ]] ; then
  zip -q -r $1 $PARAM && echo "Created File: $git_root/$1" || echo "Could not create zip file" && exit -1
else
  echo ""
fi

cd $OLDPWD
exit 0
