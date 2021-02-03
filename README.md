# データベース設計

## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association
- has_many :items
- has_many :buys

## items テーブル
| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| name                   | string    | null: false                    |
| description            | text      | null: false                    |
| category               | string    | null: false                    |
| status                 | string    | null: false                    |
| delivery_charge_burden | integer   | null: false                    |
| delivery_source_area   | string    | null: false                    |
| delivery_days          | string    | null: false                    |
| price                  | integer   | null: false                    |
| user                   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル
| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| card_number     | integer   | null: false                    |
| expiration_date | integer   | null: false                    |
| security_code   | integer   | null: false                    |
| postal_code     | integer   | null: false                    |
| prefectures     | string    | null: false                    |
| city            | string    | null: false                    |
| block           | string    | null: false                    |
| building_name   | string    |                                |
| phone_number    | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |
| item            | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item