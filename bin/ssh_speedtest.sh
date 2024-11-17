#!/bin/bash
echo "Enter ssh destination:" && read host
dd if=/dev/zero bs=1M count=10 | ssh $host 'cat > /dev/null'

