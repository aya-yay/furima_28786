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

### Association

- has_many :items
- has_many :comments
- has_many :purchase_items


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| name         | string     | null: false                    |
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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false,                   |
| state         | integer    | null: false,                   |
| city          | string     | null: false,                   |
| address_line  | string     | null: false,                   |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase_item | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_item


## purchase_items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_one :delivery_address
- belongs_to :item
- belongs_to :user