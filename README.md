# テーブル設計

## userテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |


## itemsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| product    | string     | null: false |
| category   | string     | null: false |
| price      | string     | null: false |
| seller     | string     | null: false |


## addressesテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| address    | text       | null: false |
　