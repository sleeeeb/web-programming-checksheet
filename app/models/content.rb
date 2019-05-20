class Content < ApplicationRecord
belongs_to :genre, optional: true
has_many :comments 


end
