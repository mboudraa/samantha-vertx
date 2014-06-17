#!/bin/bash

unset GRADLE_OPTS

function usage ()
{
    echo ""
    echo "USAGE: "
    echo "    run.sh [-d] [-c] [-h]"
    echo ""
    echo "OPTIONS:"
    echo "    -d  enable debug mode"
    echo "    -c  clean before run"
    echo "    -h  help"
    echo ""
    echo ""
    exit $E_OPTERROR    # Exit and explain usage, if no argument(s) given.
}

while getopts ":dc:h" Option
do
    case $Option in
        d|-debug) export GRADLE_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
            ;;
        c|-clean) gradleCmd="clean"
            ;;
        h) usage
           exit 0
           ;;
    esac
done

shift $(($OPTIND - 1))

gradleCmd="$gradleCmd runMod $confOpt"
./gradlew $gradleCmd