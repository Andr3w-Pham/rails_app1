class Seller < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user
  has_many :products, dependent: :destroy
end
