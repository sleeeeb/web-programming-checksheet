class UserCheck < ApplicationRecord
  has_many :checks
  accepts_nested_attributes_for :checks
  belongs_to :user
  belongs_to :genre
end
