class Seller < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user
  has_many :products, dependent: :destroy
  has_many :buyers, class_name: 'User', foreign_key: 'user_id', through: :products

  has_and_belongs_to_many :buyers, class_name: 'User', foreign_key: 'user_id'
end
