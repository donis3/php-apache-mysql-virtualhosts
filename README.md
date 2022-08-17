# Dockerized APACHE PHP MYSQL stack

A docker setup for running apache and php in one container with mod rewrite
another container for MYSQL db and finally a container for phpMyAdmin



## Adding a site

create a conf file in apache folder for your site

```
yourdomain.com.conf
```

Create your config file with your desired config settings

```
<VirtualHost *:80>
    # This first-listed virtual host is also the default for *:80
    ServerName www.yourdomain.com
    ServerAlias yourdomain.com
    DocumentRoot "/var/www/html/yoursite"
</VirtualHost>
```

Add the linux command that'll inform apache server about this config to Dockerfile.

```
#Add each website here
RUN a2ensite yourdomain.com
...
```


## First Run

Let docker download each container's contents

```
docker compose up --build -d
```

This will also run the SQL commands in dump/myDb.sql

## Docker Commands

Run containers

```
docker compose up -d
```

Stop containers
```
docker compose down
```

## Accessing local websites in local development environment

This setup wont work locally unless you modify the hosts file on your system. 
Apache server is listening for requests that match the domain names in the config files.
In this example we have web1.com and web2.com. For apache to know which folder to serve, domain name in the request must match one.
To simulate this in a local dev environment, we must modify 

##### Open in notepad with admin privileges
```
C:\Windows\System32\drivers\etc\hosts
```

Add each website domain and point them to localhost ip
```
127.0.0.1 web1.com
127.0.0.1 web2.com
```

After saving the file, accessing web1.com should point to 127.0.0.1. To access the actual website, you must remove the host entries. This is for dev purposes only.