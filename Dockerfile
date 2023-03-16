# 選択ビルダーイメージの定義
FROM openshift/jboss-webserver56-openjdk8-tomcat9-openshift-ubi8

# ビルダー内で使用されているソフトウェア バージョンを通知する
ENV JWS_VERSION=latest

# S2I の場所を定義します
LABEL io.openshift.s2i.scripts-url=image:/// usr/local/s2i

# ビルダー イメージを作成するときに、S2I スクリプトを ./.s2i/bin/ から /usr/local/s2i にコピーします
COPY ./s2i/bin/ /usr/local/s2i

# 設定ファイルをコピー
COPY ./tomcat/setenv.sh /opt/jws-5.6/tomcat/bin/setenv.sh

# 最終イメージが公開するポートを指定する
EXPOSE 8009