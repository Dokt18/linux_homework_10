for d in /proc/[0-9]* ; do
    #command
    command=$(cat $d/cmdline | cut -d ' ' -f 1)
    echo "Command: " $command
    pid=$(echo $d | grep -o "[0-9]*")
    echo "PID: " $pid
    user=$(cat $d/status | grep "Uid" | cut -f 2 | id -nu)
    echo "User: " $user
    #files
    echo "Files: "
    find $d/fd -type l -exec ls -l {} \;
    echo "\n------------------------------------------------------\n"
done





