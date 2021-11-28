# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------  | ------------ |
| name               | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  | 
| last_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name_kana     | string  | null: false  |
| first_name_kana    | string  | null: false  |
| birthday           | date    | null: false  |

### Associatio
- has_many  :item
- has_many  :purchase_records

## items テーブル

| Column       |Type        |Options                          |
| ------------ | ---------- | ------------------------------- |
| user         | references | null: false, foreign_key: true  |
| item_name    | string     | null: false                     |
| explanation  | text       | null: false                     |
| category     | text       | null: false                     |
| condition    | string     | null: false                     |
| delivery_fee | integer    | null: false                     |
| consignor    | string     | null: false                     |
| ship_date    | date       | null: false                     |



### Association
- belongs_to  :users
- has_one     :purchase_records



## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
belongs_to  :items
belongs_to  :users
has_one     :sending

## sending テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase_record  | integer    | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |


## Association
belongs_to  :purchase_records