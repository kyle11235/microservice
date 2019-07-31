# test
sudo docker -v > out.log

# change mode
SHELL_DIR=$(dirname "$BASH_SOURCE")
APP_DIR=$(cd $SHELL_DIR; pwd)
chmod +x $APP_DIR/java_app/start_java.sh
chmod +x $APP_DIR/node_app/start_node.sh
chmod +x $APP_DIR/html_app/start_html.sh

# deploy
$APP_DIR/java_app/start_java.sh
$APP_DIR/node_app/start_node.sh
$APP_DIR/html_app/start_html.sh






