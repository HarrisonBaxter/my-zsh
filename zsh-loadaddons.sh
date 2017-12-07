export MY_WSL_DIR=/dbox/projects/mywsl


echo $DIR

IFS=$'\n'
SCRIPTS=($(ls $MY_WSL_DIR/zsh-addons/*.sh))

for script in $SCRIPTS; do
  source "$script"
done
