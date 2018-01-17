#!/bin/sh

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
	echo "Could not parse command-line options" >&2
	exit 1
fi

if [ -z "$DEVICE_IP" ]; then
    echo "\$DEVICE_IP is not set, Please use -i option" >&2
    exit 7
fi

if [ -z "$DEVICE_PORT" ]; then
    echo "\$DEVICE_PORT is not set, Please use -p option" >&2
    exit 7
fi

cd "$IOC_BOOT_DIR"

P="$P" R="$R" DEVICE_IP="$DEVICE_IP" DEVICE_PORT="$DEVICE_PORT" "$IOC_BIN" strAgilent33521a.cmd
