## nginxのアクセスログを切る

```
access_log off;
```

## mysqlのログを切る

```
[mysqld]
performance_schema=off

log_error_verbosity = 1
```

## 再起動試験

30分前ごろになったらやる

```
sudo shutdown -r now
```
