## Main Config settings
Worker_process : How many CPUs nginx will use.
Worker_connection : How many requests ngingx can serve at a time

## Setting up NGINGX
1. Install Nginx : ```sudo apt-get update && sudo apt-get install nginx; ```
2. Adjust Firewall
    1. Turn on the firewall using ``` sudo ufw enable```
    2. Allow HTTPS connection to NGINGX ```sudo ufw allow 'Nginx HTTPS';```
        - Can allow both HTTP and HTTPS using ``` sudo ufw allow 'Nginx Full'```

3. Check your server
    - Check if running using ```sudo systemctl status nginx```.
4. Manage / Config the ngingx server
    1. Make DNS point towards Nginx server : ``` sudo nano /etc/host ```
        - Add the ip address of the ngingx server, and then add the ensnare.com
    2. Config NGINX - Update the config files at ``` etc/nginx```
        1. 
