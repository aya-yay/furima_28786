# テーブル設計

## users テーブル

| Column            | Type   | Options                        |
| ------------------| ------ | ------------------------------ |
| nickname          | string | null: false                    |
| email             | string | null: false                    |
| password          | string | null: false                    |
| family_name       | string | null: false                    |
| first_name        | string | null: false                    |
| family_name_kana  | string | null: false                    |
| first_name_kana   | string | null: false                    |
| birth_date        | date   | null: false                    |
| item              | string | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :comments
- has_one :purchase_item


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| state        | integer    | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase_item

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| content  | text       |                                |

### Association

- belongs_to :item
- belongs_to :user

## delivery_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false, foreign_key: true |
| state        | string     | null: false, foreign_key: true |
| city         | string     | null: false, foreign_key: true |
| address_line | string     | null: false, foreign_key: true |
| building_name| string     | null: false, foreign_key: true |
| phone_number | string     | null: false                    |


### Association

- belongs_to :purchase_item


## purchase_items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| delivery_address | references | null: false, foreign_key: true |

### Association

- has_one :delivery_address
- belongs_to :item
- belongs_to :user