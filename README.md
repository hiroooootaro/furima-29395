# テーブル設計

## usersテーブル
| Column    | Type    | Option     |
|-----------|---------|------------|
| name      | string  | null: false|
| first_name| string  | null: false|
| last_neme | string  | null: false|
| emaill    | string  | null: false|
| password  | string  | null: false|
| birth_day | integer | null: false|

### Association

has_many :items 
has_many :comments
has_many :purchases
has_many :dealings

## itemsテーブル
| Column      | Type      | Options     |
| ------------| --------- | ----------- |
| name        | string    | null: false |
| description | text      | null: false |
| price       | integer   | null: false |
| user        | references| null: false  foreign_key: true|


### Association

has_one :purchases
has_many :comments
belonge_to :users
belongs_to :dealings

## purchaseテーブル(購入する際に獲得するデータ)

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| card_number  | integer    | null: false |
| deadline     | integer    | null: false |
| security     | integer    | null: false |
| postal       | integer    | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| phone_number | string     | null: false |
| user         | references | null: false  foreign_key: true|
| item         | references | null: false  foreign_key: true|

### Association
belongs_to :users
belongs_to :items 

## commentsテーブル（商品へのコメント）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

has_one :items
has_one :users

 ## dealingsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items