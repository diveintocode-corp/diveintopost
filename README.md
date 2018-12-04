# README

文書共有がSlack依存になってしまっている状態を改善するためのアプリケーション
社内での情報共有をスムーズに進めるために開発された社内用ツール

小規模かつ社内用ツールのため、挙動確認の自動化にそれほど工数を使う必要はない、との理由から統合テスト（Feature Spec）は未実装。
ただしUser招待などのロジックテスト（Model Spec）は実装している。

## バージョン
* Ruby 2.5.1
* Ruby on Rails 5.2.0
* psql (PostgreSQL) 9.6.3

## 準備

```
$ git clone git@github.com:DiveintoCode-corp/diveintopost.git
$ cd diveintopost
$ yarn install # まだ環境にyarnが入っていなかったら
$ bundle install --path vendor/bundle
$ rails db:create db:migrate
$ rails db:seed_fu
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

## 自分のリポジトリで行う場合

```
自分のGitHubアカウントに、空のリポジトリを作成し、cloneしたアプリケーションをpushする（folkでも可）
git remote addなどで、originという文字列と、URLを紐づける
大元のissueを見ながら自分のローカルで機能開発を進め、自分のGitHubにPullRequestを提出する
（この案件は、developブランチとfeatureブランチのみで行う形で、masterブランチはなくても構わない）
```
