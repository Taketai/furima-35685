# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| user_password  | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birth_day      | date   | null: false |

### Association

- has_many   :products
- belongs_to :purchase

## purchases テーブル

|   Column       |  Type   |   Options                      |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| last_name      | string  | null: false                    |
| first_name     | string  | null: false                    |
| last_name_kana | string  | null: false                    |
| first_name_kana| string  | null: false                    |
| post_code      | string  | null: false                    |
| prefecture     | string  | null: false                    |
| city | string  | string  | null: false                    |
| address| string| string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  |                                |

### Association

- belongs_to :user

## products テーブル

|  Column       |  Type   |  Options                       |
| ------------- | ------- | ------------------------------ |
| product_name  | string  | null: false                    |
| description   | string  | null: false                    |
| category      | string  | null: false                    |
| judgment      | string  | null: false                    |
| shipping_cost | string  | null: false                    |
| shipping_area | string  | null: false                    |
| shipping_days | string  | null: false                    |
| price         | string  | null: false                    |
| shipping_id   | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user