class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product                        #製品名
      t.integer :category_id                   #カテゴリー
      t.integer :price                         #値段
      t.integer :status_id                     #商品の状態
      t.integer :delivery_id                   #配送料の負担
      t.integer :area_id                       #発送元地域
      t.integer :day_id                        #発送までの日数
      t.text :description                      #商品説明
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end


