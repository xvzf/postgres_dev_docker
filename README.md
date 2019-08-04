# Script wich creates several development databases
> **NOTE** This is for my personal use :-)


```
$ docker run -d -p 127.0.0.1:5432:5432 -v $(pwd)/data:/var/lib/postgresql/data -v $(pwd)/01-init.sh:/docker-entrypoint-initdb.d/01-init.sh --name postgres_dev postgres:11-alpine
