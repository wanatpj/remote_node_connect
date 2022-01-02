set -x

if [ ! -e /home/$(whoami)/.ssh/id_rsa ] || [ ! -e /home/$(whoami)/.ssh/id_rsa.pub ]
then
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)"
fi
