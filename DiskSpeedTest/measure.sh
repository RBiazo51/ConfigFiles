dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
rm /tmp/test1.img
dd if=/dev/random of=/tmp/test2.img bs=1G count=1 oflag=dsync
rm /tmp/test2.img
