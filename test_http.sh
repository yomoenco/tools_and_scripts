#!/bin/bash
#set -xv
usage() {
    echo "Usage: $0 HTTP_SERVER [port]"
    echo "Test the connection to http by requesting some pages"
    echo ""
    echo "NOTE:"
    echo " $0 requires ncat to be installed"
}

if [ "$1" == "" ]; then
    echo ""
    echo "ERROR: missing parameter"
    echo ""
    usage
    exit 1
elif  [[ "$@" == *--help* ]]; then
    echo ""
    usage
    exit
fi

if [[ ! -x $(which ncat) ]]; then
    echo ""
    echo "ERROR: ncat not found"
    echo ""
    usage
    exit 2
fi

target="$1"
if [[ "$2" != "" ]]; then
   port="$2}"
else
   port="80"
fi

printf "GET /index.html HTTP/1.1\r\nUser-Agent: nc/0.0.1\r\nHost: 192.168.47.11\r\nAccept: */*\r\n\r\n" | ncat ${target} ${port}
printf "GET / HTTP/1.1\r\nUser-Agent: nc/0.0.1\r\nHost: 192.168.47.11\r\nAccept: */*\r\n\r\n" | ncat ${target} ${port}
printf "GET /graph HTTP/1.1\r\nUser-Agent: nc/0.0.1\r\nHost: 192.168.47.11\r\nAccept: */*\r\n\r\n" | ncat ${target} ${port}
