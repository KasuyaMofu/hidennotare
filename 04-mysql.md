### アクセス元

```
[mysqld]

...

bind-address = 0.0.0.0
```


### grant周り

複数台からアクセスする際、grantが必要なのでアクセス元は `%` を指定する。

```
CREATE USER IF NOT EXISTS `isucon`@`%` IDENTIFIED WITH mysql_native_password BY 'your password here';
GRANT ALL ON `table`.* TO `isucon`@`%`;
```
