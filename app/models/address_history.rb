class AddressHistory
  include ActiveModel::Model
  attr_accessor :municipalities, :address, :postal_code, :building_number, :phone_number, :token, :area_id, :user_id, :item_id


  with_options presence: true do
    validates :municipalities
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, presence: true, format: { with:/\A\d{10,11}\z/ }

  with_options presence: true, numericality: { other_than: 1 } do
    validates :area_id
  end


  def save
    his = History.create(item_id: item_id, user_id: user_id)
    Address.create(municipalities: municipalities, address: address, postal_code: postal_code, building_number: building_number, phone_number: phone_number,  area_id: area_id, history_id: his.id)
  end
end


