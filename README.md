# Rails 5 + Docker + PostgreSQLでのローカル環境構築スターター

# バージョン

```
Ruby: 3.0
Ruby on Rails: 5.2.6
PostgreSQL: 13.2
```

# はじめ方

```
docker-compose run --no-deps web rails new . --force --database=postgresql
```

database.ymlを編集
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: postgres
  username: root
  password: root
  pool: 5

development:
  <<: *default
  database: app_development

test:
  <<: *default
  database: app_test

production:
  adapter: postgresql
  database: app_production
  pool: 5
  timeout: 5000
```