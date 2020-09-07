# テーブル設計

## usersテーブル
| Column    | Type    | Option     |
|-----------|---------|------------|
| name      | string  | null: false|
| first name| string  | null: false|
| last neme | string  | null: false|
| emaill    | string  | null: false|
| password  | string  | null: false|
| borth day | integer | null: false|
|

### Association

has_many :items 
has_many :comments
has_many :purchases

## itemsテーブル
| Column      | Type      | Options     |
| ------------| --------- | ----------- |
| imege       | text      | null: false |
| name        | string    | null: false |
| description | string    | null: false |
| price       | integer   | null: false |
| user        | references| null: false  foreign_key: true|
|
|

### Association

has_one :purchases
has_many :comments
belonge_to :users

## purchaseテーブル(購入する際に獲得するデータ)

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| card-number  | integer    | null: false |
| deadline     | integer    | null: false |
| security     | integer    | null: false |
| postal       | integer    | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| phone-number | integer    | null: false |
| user         | references | null: false  foreign_key: true|
|
|

### Association
belongs_to :users
has_one :items 

## commentsテーブル（商品へのコメント）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

has_one :items
has_one :users