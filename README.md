little script to run a cloud-init cloud image locally on demand
call cloudryer with name of qcow2 image: eg:
```
  bash cloudryer CentOS-7-x86_64-GenericCloud-1704.qcow2c
```


once the qemu task is running, switch to another window and login with
username 'centos' ( for CentOS images ), and password 'publicpass'. You
might be prompted to change the password on first login.
 ```
  vncviewer localhost:1
```

or you can ssh to the VM if you know the IP :
```
  ssh -l centos -i new.key <ip>
```



