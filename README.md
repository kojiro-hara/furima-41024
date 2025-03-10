### Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| reading            | string | null: false               |
| birthday           | date   | null: false               |


### Association
- has_one :nickname



### Nickname テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association
- has_many :items
- has_many :buys



### Items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false, ActiveHash        |
| state_id            | integer    | null: false, ActiveHash        |
| burden_id           | integer    | null: false, ActiveHash        |
| region_of_origin_id | integer    | null: false, ActiveHash        |
| days_id             | integer    | null: false, ActiveHash        |
| price               | float      | null: false                    |
| nickname            | references | null: false, foreign_key: true |


### Association
- belongs_to :nickname
- has_one :buy


### Buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
- belongs_to :nickname
- belongs_to :item
- has_one :shipping


### shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code_id  | integer    | null: false, ActiveHash        |
| prefecture_id | integer    | null: false, ActiveHash        |
| cities        | string     | null: false                    |
| house_number  | string     | null: false                    |
| property      | string     |                                |
| telephone     | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |


### Association
- belongs_to :buy
