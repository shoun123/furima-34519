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
| first_furigana       | string | null: false |
| birthday             | date   | null: false |
| nickname             | string | null: false |

### Association
- has_many :items
- has_many :histories



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
| user       | references | null: false, foreign_key: true |
| description| text       | null: false | 商品説明

### Association
- belongs_to :user
- has_one :history




## addressesテーブル order

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| municipalities    | string     | null: false | 市町村
| address           | string     | null: false | 番地
| building_number   | string     |               建物番号
| postal_code       | string     | null: false | 郵便番号
| phone_number      | string     | null: false | 電話番号
| area_id           | integer    | null: false | 発送元の地域
| history           | references | null: false, foreign_key: true |

### Association
- belongs_to :history




## historiesテーブル       商品の購入履歴を保存するテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address
