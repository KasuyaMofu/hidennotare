## gitの準備

### check git config

```
git config user.email && git config user.name && echo "git config ok"
```

### add deploy key

ssh-keygenした鍵をdeploy keyに登録する。

```
ssh-keygen
```

### setup git & push source

```
git init && git add . && git commit -m "initial commit"
git branch -M main
git remote add origin git@github.com:KasuyaMofu/vtuber-isucon10f.git
git push -u origin main
```

