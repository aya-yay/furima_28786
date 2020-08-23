# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ------------------| ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birth_date        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :delivery_address

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| item_name    | string     | null: false                    |
| description  | string     | null: false                    |
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

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| content  | text       |                                |

### Association

- belongs_to :item
- belongs_to :user

## delivery_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| state        | string     | null: false                    |
| city         | string     | null: false                    |
| address_line | string     | null: false                    |
| building_name| string     | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## transaction テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user