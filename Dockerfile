# ruby3を使用する
FROM ruby:3.0.0
# インストール可能なパッケージの一覧を更新
# -qq: エラー以外は表示しない
# -y: 処理中にあわられるプロンプトに対して全てYesと解答
RUN apt-get update -qq && apt-get install -y postgresql-client
# nodejsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs
# ディレクトリを作成
RUN mkdir /app
# 作業ディレクトリを設定
WORKDIR /app
# ローカルファイルをコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# bundle install
RUN bundle install
# ローカルファイルをコンテナにコピー
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]