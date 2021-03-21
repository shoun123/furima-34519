class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true                 #出品者
      t.references :item, foreign_key: true                 #商品情報
      t.timestamps
    end
  end
end
