# path
SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)
cd $APP_DIR

# comment
COMMENT="pull_push"
if [ ! -z "$1" ]
  then
    COMMENT=$1
fi

# merge without editing comment
git pull --no-edit

# stage new files
git add *
# stage tracked files including delete
git add -u

git commit -m $COMMENT
git push
