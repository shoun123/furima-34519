class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product
    validates :description
    validates :image
    validates :price
  end


  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 }


  belongs_to :user
  belongs_to :delivery
  has_one_attached :image



end


