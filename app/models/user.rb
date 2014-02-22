class User < ActiveRecord::Base
  has_many :games
  has_many :game_zips, :through => :games
  has_many :friends, class_name: "User", foreign_key: "user_id"
  
  attr_accessible :user_name, :email, :password, :password_confirmation

  validates :name, presence: true
  validates :email, presence: true

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: {with:VALID_EMAIL_REGEX},
  # uniqueness: { case_sensitive: false}
  # validates :user_name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false}
  # validates :password, presence: true


  #has_secure_password validations:false
end