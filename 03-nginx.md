### 静的ファイルをcacheしたい

expiresを付ける

```
  location ~ .*\.js {
    expires 30d;
  }
```

### GETとPOSTで寄せたい場合

nginxが受けたアプリケーションへのGET, POSTを `$request_method` にて曲げる。

```
upstream webapp_POST{
  server1:PORT;
  server2:PORT;
}

upstream webapp_GET{
  server1 IP:PORT;
}

...
  location /hoge {
    <settings here>
    proxy_pass http://webapp_$request_method;
  }
```
