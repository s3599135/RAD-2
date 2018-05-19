class User < ActiveRecord::Base
  has_secure_password
  has_many :user
  has_many :comment
  has_many :item
  
  validates :username, :password, :presence => true
  validates :username, :length => {:minimum => 2}
  validates :username, :length => {:maximum => 15}
  validates :password, format: { with: /[0-9a-zA-Z\_\-]+/, message: "Usernames can only contain letters, digits, dashes and underscores" }
  
  validates :password, format: { with: /\A(?=.*\d)(?=.*([a-z]))(?=.*([A-Z]))([\x20-\x7E]){10,}\z/, message: "Password must contain at least one uppercase letter, one special character, one number and
one lowercase letter with a minimum length of 10 characters" }

end
