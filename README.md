# DB設計


## Postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|review|text|null: false|
|price|integer|null: false|
|prefecture|integer|null: false|
|user|references|foreign_key:true|

### Association
- has_many :favorites, dependent: :destroy
- has_many :users, through: :favorites
- has_many :post_images, dependent: :destroy
- has_many :comments, dependent: :destroy

- belongs_to :user


## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false , unique: true|
|email|string|null: false , unique: true|
|password|string|null: false|

### Association
- has_many :posts, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy


## Favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post


## Post_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :post


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user