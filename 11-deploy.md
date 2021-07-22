
./git_dl.sh

```
#!/bin/bash
git pull
git checkout origin/${1:-main}
git rebase main
```

### デプロイ前スクリプト

pre.sh

```
#!/bin/bash
set -ex

LANG_SERVICE=web-service

## stop services

sudo systemctl stop mysql
sudo systemctl stop nginx
sudo systemctl stop ${LANG_SERVICE}
sleep 5

## language specific build code here

# cd app/golang && make build

## log rotate

sudo cp /var/log/nginx/access.log /var/log/nginx/access.log-`date "+%s"`
sudo truncate --size 0 /var/log/nginx/access.log

## start service

sudo systemctl start mysql
sleep 5
sudo systemctl start ${LANG_SERVICE}
sudo systemctl start nginx

## initialize code here
# app/initdb
```

./bench.sh

```
#!/bin/bash

benchmarker -progress | tee /tmp/benchout
```

./post.sh

```
#!/bin/bash

echo '### score'
echo
echo '```'

tail -n 4 /tmp/benchout

echo '```'
echo

echo 'alp'

echo ''

git log -1

echo '```'
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/schedules/[a-zA-Z0-9]+'
echo '```'
```
