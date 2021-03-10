class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product, null: false                        #製品名
      t.integer :category_id, null: false                   #カテゴリー
      t.integer :price, null: false                         #値段
      t.integer :status_id, null: false                     #商品の状態
      t.integer :delivery_id, null: false                   #配送料の負担
      t.integer :area_id, null: false                       #発送元地域
      t.integer :day_id, null: false                        #発送までの日数
      t.text :description, null: false                      #商品説明
      t.references :user, foreign_key: true                 #出品者
      t.timestamps
    end
  end
end


