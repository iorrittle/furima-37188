# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------  | ------------ |
| name               | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  | 
| birthday           | integer | null: false  |

### Association
- has_many  :item_users
- has_many  :items, through: :item_users 
- has_one   :purchase record

## items テーブル

| Column      |Type    |Options      |
| ----------- | ------ | ----------- |
| item_image  | text   | null: false |
| item_name   | string | null: false |
| explanation | text   | null: false |
| category    | text   | null: false |

### Association
- has_many  :item_users
- has_many  :users, through: :item_users
- has_one   :purchase record

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belong_to :users
- belong_to :items

## purchase history テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
belong_to  :items
belong_to  :users
belong_to  :sending

## sending テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| postal code      | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| telephone number | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |


## Association
has_many  :purchase record