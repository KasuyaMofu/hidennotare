## 共通

`/etc/security/limits.conf`

```
soft nofile 65536
hard nofile 65536
```

`/etc/sysctl.conf`

```
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1

net.ipv4.tcp_tw_recycle=1
net.ipv4.tcp_tw_reuse=1

net.ipv4.tcp_fin_timeout=2

net.ipv4.tcp_keepalive_time=65

net.core.somaxconn=65535
net.ipv4.tcp_max_syn_backlog=65535

net.core.rmem_max=16777216
net.core.wmem_max=16777216

fs.file-max=65535
```


参考:

- [https://qiita.com/ihsiek/items/11106ce7a13e09b61547]
