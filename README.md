# テーブル設計

## userテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false, foreign_key: true|
| encrypted_password   | string | null: false |
| last-name            | string | null: false |
| first-name           | string | null: false |
| last-furigana        | string | null: false |
| last-furigana        | string | null: false |
| birthday             | string | null: false |



## itemsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| product    | string     | null: false | 製品
| category_id| integer    | null: false | カテゴリー
| price      | integer    | null: false | 値段
| seller     | string     | null: false | 売り手
| status     | string     | null: false | 商品の状態
| delivery   | string     | null: false | 配送料の負担
| area       | string     | null: false | 発送元の地域
| day        | integer    | null: false | 発送までの日数



## addressesテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| municipalities    | string     | null: false | 市町村
| address           | integer    | null: false | 番地
| building-number   | integer    | null: false | 建物番号
| postal-code       | integer    | null: false | 郵便番号
| phone-number      | integer    | null: false | 電話番号



