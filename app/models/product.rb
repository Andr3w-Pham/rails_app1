class Product < ApplicationRecord
  belongs_to :seller
  mount_uploader :picture, AvatarUploader
end
