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
$ bundle install --path vendor/bundle
$ yarn install # まだ環境にyarnが入っていなかったら
$ yarn add @fortawesome/fontawesome-free
$ yarn add @fortawesome/free-solid-svg-icons
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

# README

This theme is an application to improve Slack dependency of document sharing.  
(An in-house tool developed to facilitate internal information sharing)
　
 
This time, the integration test (Feature Spec) is not implemented.  
The reason is that because this application is a small and in-house tool, we do not need to take many man-hours to automate behavior confirmation.
　
 
However, logic tests (Model Spec) such as user invitation are implemented.

## Version
* Ruby 2.5.1
* Ruby on Rails 5.2.0
* psql (PostgreSQL) 9.6.3

## Preparation

```
$ git clone git@github.com:DiveintoCode-corp/diveintopost.git
$ cd diveintopost
$ bundle install --path vendor/bundle
$ yarn install # If yarn has not been installed yet.
$ yarn add @fortawesome/fontawesome-free
$ yarn add @fortawesome/free-solid-svg-icons
$ rails db:create db:migrate
$ rails db:seed_fu
```

## Change the language
https://github.com/DiveintoCode-corp/diveintopost/blob/b958867948e7ab86c10a303b1f07d6478e87ef3a/config/application.rb#L25

ex.  
Japanese ver.
```
config.i18n.default_locale = :ja
```
English ver.
```
config.i18n.default_locale = :en
```


## Application execution

```
$ rails s

※ Open another terminal window
$ bin/webpack-dev-server
```

## Development flow

```
$ git checkout develop
$ git push origin feature/issues-issue number

Implementation of development

After development is complete
$ git push origin feature/issues-issue number

Create Pull Request on GitHub
Merge after repeated review and correction

When a new issue is allocated, do git checkout develop and create a new feature branch
```

## If you use your own repository

```
Create an empty repository in your GitHub account and push a cloned application (folk is acceptable too)

Use "git remote add" to link "origin" to your own GitHub URL

While looking at the original issue, proceed with local feature development and submit a PullRequest to your GitHub
(This project is done only with the develop and feature branches. There is no need for the master branch.)
```
