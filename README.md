# アプリ名
  OTORIYOSE

  ![sample1.jpg](https://github.com/naoya-uchiyama/app_otoriyose/blob/master/sample1.jpg)

## 概要
  お取り寄せ商品を楽天市場より検索し、気になったものは保存しておくことができる。また保存した商品のレビューを他ユーザーと共有することで、様々な商品を見つけることができる。

  ![sample2](https://github.com/naoya-uchiyama/app_otoriyose/blob/master/sample2.png)

## 制作背景
  昨今のコロナウイルスの影響で、多くの方が外出することを控え巣篭もり消費が増えています。家にいながら観光地や有名店の商品を購入でき、出掛けた気分になれるお取り寄せ商品のニーズが強くなっていると考え作成しました。  また、私自身お取り寄せ商品を頼んでみて失敗してしまったことがあり、どの商品が本当に美味しいのかユーザーの生のレビューを聞きたいという思いもあり今回このアプリを作成しています。

  ![sample3](https://github.com/naoya-uchiyama/app_otoriyose/blob/master/sample3.png)


## 使い方
  検索フォームからお取り寄せしたいキーワードを検索していただくとキーワードにヒットした楽天ストアの商品が表示されます。ログイン後、お気に入り登録とレビューを書くことができるようになります。また、トップページでは他ユーザーがお気に入りにした商品、レビューを見ることができます。


# DB設計

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false , unique: true|
|avatar|string|
|email|string|null: false , unique: true|
|password|string|null: false|

### Association

- has_many :items, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :fav_reviews, through: :favorites, source: :review


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|itemcode|text|null: false|
|user|references|foreign_key:true|

### Association
- belongs_to :user

- has_many :reviews, dependent: :destroy


## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|
|image|text|
|delicious|float|null: false|
|eazy|float|null: false|
|cost|float|null: false|
|itemcode|string|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user

- has_many :favorites, dependent: :destroy
- has_many :users, through: :favorites


## Favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|review|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :review
