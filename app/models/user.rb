  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  class User < ApplicationRecord
    include Devise::JWT::RevocationStrategies::JTIMatcher
  
    # Methods which registers a user, authenticate user passwords, 
    # allows additional validations to be set when user is registering,
    # generates a jwt token when a user registers,
    # and deletes the jwt when a user destroys their account. 
    devise :database_authenticatable, :registerable, :validatable,
           :jwt_authenticatable, jwt_revocation_strategy: self

    # Define relationships to other models
    has_many :books
    has_many :reviews
  end
