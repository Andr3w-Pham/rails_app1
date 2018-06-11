class Attachment < ApplicationRecord
  belongs_to :post
  mount_uploader :image, AvatarUploader
  # acts_as_votable
  # def score
  #   self.get_upvotes.size - self.get_downvotes.size
  # end
end
