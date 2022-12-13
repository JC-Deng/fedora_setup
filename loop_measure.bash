SCRIPT_PATH="$(dirname -- "$BASH_SOURCE")"
> $SCRIPT_PATH/build.log

while :; do
    df -h >> $SCRIPT_PATH/build.log
    echo "*****************************************" >> $SCRIPT_PATH/build.log
    free -h >> $SCRIPT_PATH/build.log
    echo "*****************************************" >> $SCRIPT_PATH/build.log
    sleep 15
done