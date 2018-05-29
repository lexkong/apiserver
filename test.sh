#!/bin/bash

echo -n create user lkong:
curl -XPOST -H "Content-Type: application/json" http://127.0.0.1:6661/user -d'{"username":"lkong","password":"lkong1234"}'
printf "\n\n"

echo -n list users:
curl -XGET -H "Content-Type: application/json" http://127.0.0.1:6661/user -d'{}'
printf "\n\n"

echo -n get user lkong:
curl -XGET -H "Content-Type: application/json" http://127.0.0.1:6661/user/lkong
printf "\n\n"

echo -n modify user lkong:
curl -XPUT -H "Content-Type: application/json" http://127.0.0.1:6661/user/lkong -d'{"password":"newpassword"}'
printf "\n\n"

echo -n delete user lkong:
curl -XDELETE -H "Content-Type: application/json" http://127.0.0.1:6661/user/lkong
printf "\n\n"

echo -n list users again, now lkong disappear:
curl -XGET -H "Content-Type: application/json" http://127.0.0.1:6661/user -d'{}'
printf "\n\n"

echo -n create role admin:
curl -XPOST -H "Content-Type: application/json" http://127.0.0.1:6661/role -d'{"rolename":"admin", "description":"hellow world"}'
printf "\n\n"

echo -n list roles:
curl -XGET -H "Content-Type: application/json" http://127.0.0.1:6661/role -d'{}'
printf "\n\n"

echo -n delete role admin:
curl -XDELETE -H "Content-Type: application/json" http://127.0.0.1:6661/role/admin
printf "\n\n"

echo -n list roles again, now admin disappear:
curl -XGET -H "Content-Type: application/json" http://127.0.0.1:6661/role -d'{}'
printf "\n\n"

curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1Mjc0NDI2MDksImlkIjowLCJuYmYiOjE1Mjc0NDI2MDksInVzZXJuYW1lIjoiYWRtaW4ifQ.16Gwtvg7BKw7AzjIJp1ycjMvrEhB_v3XsprKa37PYDw" -H "Content-Type: application/json" http://127.0.0.1:6662/user -d'{"username":"admin2","password":"admin"}'
