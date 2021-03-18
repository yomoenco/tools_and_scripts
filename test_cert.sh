#!/bin/bash
#set -xv

usage() {
    echo "Usage: $0 CERT_SERVER"
    echo "Test the connection to https by requesting the certificate"
    echo ""
    echo "   A correct connection replies with a message like:"
    echo " "
    echo "       ..."
    echo "       TLS session ticket:"
    echo "       0000 - 00 00 0b 3a 99 d1 c9 39-0c 78 2f 94 0c a7 23 c3   ...:...9.x/...#."
    echo "       0010 - eb 69 d0 94 3a cb f5 96-0b 5f 73 1a 06 57 d4 7a   .i..:...._s..W.z"
    echo "       0020 - 35 06 f8 82 7e 80 83 b3-05 76 b1 dd 2a 5c d0 16   5...~....v..*\.."
    echo "       0030 - ..."
    echo "       ..."
    echo ""
    echo "       Start Time: 1616066118"
    echo "       Timeout   : 7200 (sec)"
    echo "       Verify return code: 0 (ok)"
    echo "       Extended master secret: no"
    echo "       Max Early Data: 0"
    echo "   ---"
    echo "   read R BLOCK"
    echo "   DONE"
    echo " "
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

target="$1"

echo quit | openssl s_client -showcerts -connect ${target}:443

