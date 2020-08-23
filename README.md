# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :profile
- has_one :credit_card
- has_one :delivery_address

## items テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| image     | string  | null: false |
| name      | string  | null: false |
| category  | string  | null: false |
| price     | integer | null: false |
| exhibitor | string  | null: false |

### Association

- belongs_to :users
- has_many :comments


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |
| content  | string     |                                |

### Association

- belongs_to :items
- belongs_to :user

## profile テーブル

| Column                | Type   | Options     |
| --------------------- | -------| ----------- |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birth_date            | string | null: false |

### Association

- belongs_to :user

## credit_card テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------------------- |
| credit_number | string     |                                             |
| user_id       | string     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## delivery_address テーブル

| Column    | Type       | Options                                     |
| --------- | ---------- | ------------------------------------------- |
| location  | string     | null: false                                 |
| user_id   | string     | references | null: false, foreign_key: true |
| items_id  | string     | references | null: false, foreign_key: true |

### Association

- belongs_to :user