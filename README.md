# Transfer_service_memlog
メモリ監視サービスと、ストレージ監視cron用shを転送する（どこへとは言わないが・・・）

## 手順概要

### メモリ監視

#### 修正箇所

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

## ストレージの監視

### 準備

1. df_log.shの出力パスを修正する。
2. ログにヘッダを作っておく

### 適用コマンド

```
cp ./df_log.sh /opt/
chmod 755 /opt/df_log.sh
```

```
vi /etc/crontab
```

``` crontab
*/15 *  * * * root sh /opt/df_log.sh
```