# テーブル設計
-Things you may want to cover:
-This README would normally document whatever steps are necessary to get the
-* Database initialization


## usersテーブル


| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false, unique:true|
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_furigana        | string | null: false |
| last_furigana        | string | null: false |
| birthday             | date   | null: false |



## itemsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| product    | string     | null: false | 製品
| category_id| integer    | null: false | カテゴリー
| price      | integer    | null: false | 値段
| status_id  | integer    | null: false | 商品の状態
| delivery_id| integer    | null: false | 配送料の負担
| area_id    | integer    | null: false | 発送元の地域
| day_id     | integer    | null: false | 発送までの日数
| user_id    | integer    | null: false, foreign_key: true |
| description| text       | null: false | 商品説明




## addressesテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| municipalities    | string     | null: false | 市町村
| address           | integer    | null: false | 番地
| building_number   | integer    | null: false | 建物番号
| postal_code       | integer    | null: false | 郵便番号
| phone_number      | integer    | null: false | 電話番号



