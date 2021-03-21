class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :municipalities, null: false                 #市町村
      t.string :address, null: false                        #番地
      t.string :building_number                             #建物番号
      t.string :postal_code, null: false                    #郵便番号
      t.string :phone_number, null: false                   #電話番号
      t.integer :area_id, null: false                       #発送元地域
      t.references :history, foreign_key: true              #購入履歴
      t.timestamps
    end
  end
end
