class Genre < ApplicationRecord
  has_many :contents
  has_many :user_checks
end
