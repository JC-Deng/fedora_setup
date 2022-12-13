SCRIPT_PATH="$(dirname -- "$BASH_SOURCE")"
> $SCRIPT_PATH/build.log

echo "*******************************************************************" >> $SCRIPT_PATH/build.log
df -h >> $SCRIPT_PATH/build.log
echo "*******************************************************************" >> $SCRIPT_PATH/build.log

while :; do
    free -h >> $SCRIPT_PATH/build.log
    du -hs /home/d/install >> $SCRIPT_PATH/build.log
    du -hs /home/d/tmptmp >> $SCRIPT_PATH/build.log
    echo "*******************************************************************" >> $SCRIPT_PATH/build.log
    sleep 5
done