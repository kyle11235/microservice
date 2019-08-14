# pull
git pull

# path
SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)

# deploy
cd $APP_DIR/java_app
bash -s < start_java.sh

cd $APP_DIR/node_app
bash -s < start_node.sh

cd $APP_DIR/html_app
bash -s < start_html.sh






