# README

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type            | Options                        |
| -------------- | --------------- | ------------------------------ |
| item_name      | string          | null: false                    |
| item_info      | text            | null: false                    |
| category       | string          | null: false                    |
| price          | integer         | null: false                    |
| condition      | string          | null: false                    |
| delivery_fee   | integer         | null: false                    |
| shipped_from   | string          | null: false                    |
| until_shipped  | integer         | null: false                    |
| user           | references      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## addresses テーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| zip_code      | integer      | null: false                    |
| prefecture    | string       | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| phone_number  | date         | null: false                    |
| order         | references   | null: false, foreign_key: true |

### Association

- belongs_to :orders