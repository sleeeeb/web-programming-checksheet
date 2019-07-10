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

  def remember_me
    true
  end
end
