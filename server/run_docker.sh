#!/bin/bash


gcc mini_web_server.c -lfcgi 
spawn-fcgi -p 8080 ./a.out
service nginx start
/bin/bash