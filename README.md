# Transfer_service_memlog
メモリ監視サービスを転送する（どこへとは言わないが・・・）

## 手順概要

### 修正箇所

1. memlog.shのログ出力パス
  - memlogファイルのパス修正
  - shファイルの修正
2. memlog.shの配置パス検討
3. memlog.serviceの紐付け確認
4. memlog.serviceの再起動設定

### 適用コマンド

``` sh
cp ./usr/lib/systemd/system/memlog.service /usr/lib/systemd/system/memlog.service
cp ./etc/logrotate.d/memlog /etc/logrotate.d/memlog
cp ./memlog.sh ${パス検討中}
```

```
cd /usr/lib/systemd/system
systemctl enable memlog.service
systemctl status memlog
```

```
tail -f ${ログファイルパス}
```

```
cd /etc/logrotate.d
logrotate -dv memlog
logrotate -f memlog
```
