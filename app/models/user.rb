class User < ActiveRecord::Base
  has_many :products
  
  before_save {self.email.downcase!}
  
  validates :username, presence: true, length: {within: 4..32}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
          format: {with: VALID_EMAIL_REGEX}, 
          uniqueness: {case_sensitive: false}
  
  has_secure_password
  validates :password, length: {minimum: 8}
  
  mount_uploader :profile_picture, UserPhotoUploader
  
end
