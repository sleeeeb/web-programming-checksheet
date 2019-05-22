class Comment < ApplicationRecord
  belongs_to :content
  belongs_to :user  
  validates :text, presence: true
  has_many :likes
  has_many :like_users, through: :likes, source: :user
end
