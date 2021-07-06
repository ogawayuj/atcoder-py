# 変数
REQTXT=requirements.txt

# 環境変数読込み
touch .env
echo "SRC_PATH=./src" >> .env

# マウント先作成
mkdir src

# InstallしたいLib設定
touch $REQTXT
echo "requests" >> $REQTXT
echo "psycopg2" >> $REQTXT

