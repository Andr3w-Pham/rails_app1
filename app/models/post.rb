class Post < ApplicationRecord
  belongs_to :profile
  has_many :attachments , dependent: :destroy
  mount_uploader :picture, AvatarUploader
end
