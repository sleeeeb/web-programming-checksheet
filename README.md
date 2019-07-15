# Web programing skill check test

web エンジニア初学者向けの関連知識のチェックシートを web サイトにしたものです。

チェックテスト機能、お気に入り機能（あとで学習するべきものチェック）、コメント、いいね機能を搭載してます。

url: [https://web-skill-check-sheet.herokuapp.com/enter](https://web-skill-check-sheet.herokuapp.com/enter)

# データベース構成図

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/386936/f27601b5-6d55-b9d7-40f0-fe289aa74fb4.png)

# 搭載機能・技術一覧

- ユーザー管理機能
  - devise
    - ユーザー登録・ログイン機能
  - ユーザ-詳細
  - facebook ログイン(omniauth)
  - google ログイン(omniauth)
  - cdrf 対策として gem"omniauth-rails_csrf_protection"を使用
  - テストユーザー用のログイン
- いいね機能
  - コメントに対していいねをすることができる機能
- コメント機能
  - 問題にコメントし情報共有する機能
- 非同期通信（Ajax）
  - いいねの作成・削除
- デザイン
  - エディターを参考にしエンジニア向けのサイトに
  - Bootstrap（マイページ画面のレスポンシブ化）
  - jquery(フラッシュメッセージ)
- フォーマッター
  - rufo
- 静的コード解析
  - rubocop
- i18n による国際化
- テスト
  - Circle CI
    - Rspec および rubobop の自動化
  - RSpec
    - 単体テスト(model spec)
    - 統合テスト(feature spec)
    - factory_bot
    - capybara
- 本番環境(heroku)

# 今後実装したいこと

- ユーザーのフォロー機能
- DM 機能
- ユーザーランキングページ
