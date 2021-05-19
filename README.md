# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many   :products
- has_many   :purchases


## purchases テーブル

|   Column       |  Type      |   Options                      |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| product_id     | integer    | null: false                    |

### Association

- has_one    :product
- belongs_to :user
- belongs_to :information


## information テーブル

|   Column       |  Type      |   Options                      |
| -------------- | ---------- | ------------------------------ |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     |                                |

### Association

- belongs_to :purchase


## products テーブル

|  Column          |  Type      |  Options                       |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| judgement_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase