class User < ActiveRecord::Base
  has_many :games
  has_many :neighborhoods, :through => :games
  has_many :friends, class_name: "User", foreign_key: "user_id"
  
  # attr_accessible :title, :body

  # validates :name, presence: true, length: {maximum: 50}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: {with:VALID_EMAIL_REGEX},
  #   uniqueness: { case_sensitive: false}
  #   has_secure_password validations:false
end