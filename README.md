# テーブル設計

## usersテーブル
##　大文字はカナ表記
| Column     | Type    | Option     |
|------------|---------|------------|
| name       | string  | null: false|
| first_name | string  | null: false|
| First_name | string  | null: false|
| last_neme  | string  | null: false|
| Last_neme  | string  | null: false|
| emaill     | string  | null: false|
| password   | string  | null: false|
| birth_day  | date    | null: false|

### Association

has_many :items 
has_many :comments
has_many :dealings

## itemsテーブル
| Column      | Type      | Options     |
| ------------| --------- | ----------- |
| name        | string    | null: false |
| description | text      | null: false |
| category    | integer   | null: false |
| condition   | integer   | null: false |
| delivery_fee| integer   | null: false |
| area        | integer   | null: false |
| day         | integer   | null: false |
| price       | integer   | null: false |
| user        | references| null: false  foreign_key: true|


### Association

has_many :comments
belonge_to :user
has_one :dealing

## addressesテーブル(購入する際に獲得するデータ)

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal       | string    | null: false |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| building_name| string     |             |
| phone_number | string     | null: false |
| dealing      | references | null: false foreign_key: true|

### Association
belongs_to :dealing

## commentsテーブル（商品へのコメント）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

has_one :items
has_one :user

 ## dealingsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one    :addresse