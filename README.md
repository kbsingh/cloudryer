little script to run a cloud-init cloud image locally on demand
call cloudryer with name of qcow2 image: eg:

```
  bash cloudryer CentOS-7-x86_64-GenericCloud-1704.qcow2c
```


once the qemu task is running, switch to another window and 
vncviewer localhost:1

( or whichever terminal on localhost qemu displays on, it will
be printed to screen after the qemu task starts )


