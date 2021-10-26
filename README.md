# pomodoroManagerAPI
## 概要
- [PomodoroManager]()のAPIサーバー

## 環境構築手順

* 本番環境の場合: 「GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET」をsystemdに定義すること

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

## api例

```json
path: /user/music_session_list
type: GET
disc: 再生スケジュールを取得する
{
    "music_sessions": [
        {
            "length": 1500000, // 曲の再生時間, ミリ秒
            "links": ["path/to/file", "path/to/file2"], // mp3の配置リンク
            "priority": 1 // 再生順
        },
        {
            "length": 300000,
            "links": ["path/to/file3"],
            "priority": 2
        }
    ]
}
```
```sh
$ curl -X POST -F working_musics[]=@t.mp3 -F working_musics[]=@m.mp3 -F resting_musics[]=@m.mp3 -F lengths[]=1 -F lengths[]=2 localhost:3000/samples
$ curl localhost:3000/samples
```

## TODO
apisever の capstrano 記載
本番環境のomniauthの設定を追記

テスト