class Review < ApplicationRecord

  # Define relationships to other models
  belongs_to :user
  belongs_to :book
end
