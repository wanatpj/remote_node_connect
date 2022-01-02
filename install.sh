set -e

# Set up environment variables.
## Remote addr
echo -n "Remote addr (user@host visible from this machine): "
read REMOTE_ADDR
export REMOTE_ADDR

## Remote port
echo -n "Port: [22]"
read REMOTE_PORT
if [ -z $REMOTE_PORT ]; then
    REMOTE_PORT="22"
fi
export REMOTE_PORT

# Run all scripts
for script in $(ls scripts/ | sort); do
    ./scripts/$script
done