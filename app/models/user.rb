class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_checks
  has_many :checks, through: :user_checks
  has_many :likes
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  with_options presence: true do
    validates :email, :username, :start_date
  end
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    @credential = SnsCredential.where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create
    @user = User.where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.password_confirmation = Devise.friendly_token[0, 20]
    end
    @user
  end

  def trophies
    @trophys = []
    comments_length = comments.length
    likes_length = likes.length
    comment_trophies(comments_length)
    like_trophies(likes_length)
    @trophys
  end

  def comment_trophies(comments_length)
    @trophys << Trophy.find(8) if comments_length >= 1
    @trophys << Trophy.find(9) if comments_length >= 10
    @trophys << Trophy.find(10) if comments_length >= 50
    @trophys << Trophy.find(11) if comments_length >= 100
  end

  def like_trophies(likes_length)
    @trophys << Trophy.find(12) if likes_length >= 10
    @trophys << Trophy.find(13) if likes_length >= 50
  end

  def remember_me
    true
  end
end
