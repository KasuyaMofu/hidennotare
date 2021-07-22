### スクリプト 

mover.sh

```bash
#!/bin/bash

PWDDIR=`pwd`
function replace-file () {
  if [ ! -e $1 ]; then
     echo "$1 not exist"; return 1;
  fi
  if [ -L $1 ]; then
    echo "$1 is symbolic"; return 1;
  fi

  FILENAME=`basename $1`
  echo "--before"
  ls -l $1
  sudo mv $1 ${PWDDIR}/${FILENAME}
  sudo ln -s ${PWDDIR}/${FILENAME} $1
  echo "--after"
  ls -l $1
}

replace-file $1
```

backer.sh

```bash
#!/bin/bash

if [ ! -e $1 ]; then
   echo "$1 not exist"; return 1;
fi

if [ ! -L $1 ]; then
  "$1 is not symbolic"
fi

MVFROM=`readlink $1`
echo "--before"
ls -l $1
sudo unlink $1
sudo mv ${MVFROM} $1
echo "--after"
ls -l $1
```

大体追加するの分かっているファイル郡

addfile.lst

```
/etc/mysql/mysql.cnf
/etc/nginx/nginx.conf
/etc/sysctl.conf
/etc/security/limits.conf
```


```
chmod 755 mover.sh
chmod 755 backer.sh
```

まとめて確認

```
cat addfile.lst | xargs -L 1 ls -l
```


まとめて追加

```
cat addfile.lst | xargs -L 1 ./mover.sh
```
