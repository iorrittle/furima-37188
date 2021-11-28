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
- has_many  :items
- has_many  :purchase_records

## items テーブル

| Column          |Type        |Options                          |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| item_name       | string     | null: false                     |
| explanation     | text       | null: false                     |
| category_id     | integer    | null: false                     |
| condition_id    | integer    | null: false                     |
| delivery_fee_id | integer    | null: false                     |
| consignor_id    | integer    | null: false                     |
| ship_date_id    | integer    | null: false                     |


### Association
- belongs_to  :user
- has_one     :purchase_record



## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
belongs_to  :item
belongs_to  :user
has_one     :sending

## sending テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchase_record    | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| telephone_number   | string     | null: false                    |


## Association
has_many  :purchase_records