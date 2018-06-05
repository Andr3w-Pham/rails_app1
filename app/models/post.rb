class Post < ApplicationRecord
  belongs_to :profile
  has_many :attachments , dependent: :destroy
  mount_uploader :picture, AvatarUploader
  validates :status, presence: true
  acts_as_votable
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
