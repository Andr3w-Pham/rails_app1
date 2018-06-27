class User < ApplicationRecord
  validates :email, presence: true
  has_many :followings, dependent: :destroy
  has_many :followees, through: :followings, dependent: :destroy

  has_many :reverse_followings, class_name: 'Following',foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :reverse_followings, dependent: :destroy
  acts_as_voter
  has_one :profile
  has_one :seller
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: %i[google_oauth2]

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        # user.name = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
  end
end
