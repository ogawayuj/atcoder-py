# 前提
* Proxy環境下(NTLM認証)
* WSL2上でDockerを起動し、Python利用環境をContainerとして構築する
* Cntlm(リバースProxy)を、WSL2の3128Portに構築し、そこを経由してProxyへアクセスする
* Cntlmはpip等を実行するために利用

## Dockerファイル内に記載されたファイルとフォルダを配置
* `setup.sh`を実行

## ContainerからProxyへアクセスする
* Cntlmへは、'host.docker.internal'でアクセスする
* その場合、Windows10のネットワークにアクセスするため、Wsl2へポートフォワードする
* 以下は、管理者権限で起動したPowershellから実行
```
## PortFoward初期化 
$ netsh.exe interface portproxy delete v4tov4 listenport=3128

## PortFoward 設定用
$ IP=wsl -d Ubuntu-20.04 exec hostname -I | %{ $_.Split(" ")[0] }
$ netsh.exe interface portproxy add v4tov4 listenaddress=* listenport=3128 connectaddress=172.28.123.170 connectport=3128

## 確認用
$ netsh interface portproxy show all
```

## VscodeからDockerContainerをｓ起動
* 同ディレクトリを指定してVSCodeを起動
* SCode左下の、`><`から`Reopen Container`を選択
