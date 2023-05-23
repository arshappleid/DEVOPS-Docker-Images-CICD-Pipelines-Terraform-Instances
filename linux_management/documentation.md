## User management
1. whoami : prints current user info.
2. id : prints current users info.
3. su newusername : switches to new username.


## Download files
- curl http:address.com -o
    -o saves the file in the current directory.
- wget htt:address.com local_address.txt

## Service managemnt
- service service_name start : starts an app/service called servicename.
- service service_name stop : stop an app/service called servicename.

#### Better way
- systemctl start service_name
- systemctl stop service_name

#### Registerign an app as a service , and auto start on bootup
1. ```cd /etc/systemd/system```
2. ```touch my_app.service ; vim my_app.service ;```
    ```
    [Unit]
    Description = My python web app
    [Service]
    ExecStart=path_to_directory_from_root command_used_to_run_the_file
    ExecStartPre=script_to_be_run_before_starting_service.sh
    Restart=always
    [Install]
    WantedBy = multi-user.target
    ```
3. ```systemctl daemon-reload``` - tells system we registered a new service


## Networking Basics
- ```route``` : Displays the routing table of the machine.
- ```ip route add 192.168.2.0/24 via 192.168.1.1 ``` : We can reach 192.168.2.0/24 gateway through 192.168.1.1


