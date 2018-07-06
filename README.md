# README

文書共有がSlack依存になってしまっている状態を改善するためのアプリケーション

## バージョン
* Ruby 2.5.1
* Ruby on Rails 5.2.0
* psql (PostgreSQL) 9.6.3

## 準備

```
$ git clone git@github.com:DiveintoCode-corp/diveintopost.git
$ cd diveintopost
$ yarn intstall # まだ環境にyarnが入っていなかったら
$ bundle install --path vendor/bundle
$ rails db:create db:migrate
```

## アプリケーション実行

```
$ rails s

もう一枚端末を開いて
$ bin/webpack-dev-server
```

## 開発フロー

```
$ git checkout develop
$ git checkout -b feature/issues-イシュー番号

開発を実施

開発完了後
$ git push origin feature/issues-イシュー番号

GitHub場でPull Requestを作成
レビューと修正を繰り返してマージ

新しくissueを割り振られたらgit checkout developして新たにfeatureブランチを切る
あとは臨機応変に
```
