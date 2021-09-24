# pomodoroManagerAPI
## 概要
- [PomodoroManager]()のAPIサーバー

## 環境構築手順

```bash
$ docker-compose run web rake db:create

$ docker-compose run web rails db:migrate

$ docker-compose up
```

## 開発環境
* MacOS Catalina: 10.15.4
* Ruby: 2.7.1
* Ruby on Rails: 6.1.4
* postgreSQL: 11
* nginx: 
* capistrano: 
* Docker: 19.03.12
* docker-compose: 1.26.2

## Gemfile
* jwt
* omniauth
    * ログイン/新規登録のSSO認証に使用
    * Dviseはライブラリ周りのBugのため不採用

## テスト実行
* How to run the test suite