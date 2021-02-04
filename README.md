# データベース設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :buys

## items テーブル
| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| name             | string    | null: false                    |
| description      | text      | null: false                    |
| category_id      | integer   | null: false                    |
| product_state_id | integer   | null: false                    |
| charge_burden_id | integer   | null: false                    |
| source_area_id   | integer   | null: false                    |
| delivery_day_id  | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル
| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addrece

## addreces テーブル
| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| postal_code     | integer   | null: false                    |
| source_area_id  | integer   | null: false                    |
| city            | string    | null: false                    |
| block           | string    | null: false                    |
| building_name   | string    |                                |
| phone_number    | string    | null: false                    |
| buy             | reference | null: false, foreign_key: true |

### Association
- belongs_to :buy