#!/bin/sh

rm -rf setup.tar.gz
rm -rf Setup

wget http://untar.org/files/downloads/setup.tar.gz
tar xfvz setup.tar.gz

cd Setup

echo 'Finito: you can run "cd Setup; ./setup.sh" now'

