  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  class User < ApplicationRecord
    include Devise::JWT::RevocationStrategies::JTIMatcher
  
    devise :database_authenticatable, :registerable, :validatable,
           :jwt_authenticatable, jwt_revocation_strategy: self

    has_many :books
    has_many :reviews
  end
