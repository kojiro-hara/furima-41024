### Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_reading     | string | null: false               |
| first_reading      | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |


### Association
- has_many :item
- has_many :buy


### Items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false, ActiveHash        |
| state_id      | integer    | null: false, ActiveHash        |
| burden_id     | integer    | null: false, ActiveHash        |
| prefecture_id | integer    | null: false, ActiveHash        |
| days_id       | integer    | null: false, ActiveHash        |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :buy


### Buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


### shippings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code_id  | string     | null: false,                   |
| prefecture_id | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| property      | string     |                                |
| telephone     | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |


### Association
- belongs_to :buy
