
#!/bin/sh

# This installs a minimal home environment.
# The idea is to feel at home as quick as possible


prog=$HOME/prog

dev_root=$prog/dev
dev=$HOME/dev

aux_root=$dev/aux.scm
aux=$HOME/aux

toolkit=$aux_root/toolkit.ben.public
sw=$aux_root/sw.ben.public
vibundle=$aux_root/vibundle.ben.public

kit=$HOME/kit

platform='unknown'
unamestr=$(uname)

if [ "$unamestr" = 'Darwin' ]; then
   platform='darwin'
fi

