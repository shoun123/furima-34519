class Address < ApplicationRecord
  attr_accessor :token
  belongs_to :history
  validates :token, presence: true
end



