### Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| reading            | string | null: false               |
| birthday           | date   | null: false               |


### Association
- has_many :items
- has_many :buys


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

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| state            | string     | null: false                    |
| burden           | string     | null: false                    |
| region_of_origin | string     | null: false                    |
| days             | date       | null: false                    |
| price            | float      | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :buy


### Buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :item
- belongs_to :shipping


### shipping テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| cities       | string     | null: false                    |
| house_number | string     | null: false                    |
| property     | string     |                                |
| telephone    | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |


### Association
- has_one :buy
