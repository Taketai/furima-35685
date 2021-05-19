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
- belongs_to :purchase

## purchases テーブル

|   Column       |  Type   |   Options                      |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| post_code      | string  | null: false                    |
| prefecture     | string  | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  |                                |

### Association

- belongs_to :user

## products テーブル

|  Column          |  Type   |  Options                       |
| ---------------- | ------- | ------------------------------ |
| product_name     | string  | null: false                    |
| description      | text    | null: false                    |
| category_id      | integer | null: false, foreign_key: true |
| judgement_id     | integer | null: false, foreign_key: true |
| shipping_cost_id | integer | null: false, foreign_key: true |
| shipping_area_id | integer | null: false, foreign_key: true |
| shipping_days_id | integer | null: false, foreign_key: true |
| price            | integer | null: false                    |
| shipping_id      | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user