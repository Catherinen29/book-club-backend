class Book < ApplicationRecord
  
  # Define relationships to other models
  belongs_to :user
  has_many :reviews
end
