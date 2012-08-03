class User
  include Mongoid::Document
  include ActiveModel::SecurePassword 
  
  field :email, type: String
  field :password_digest, type: String
  has_many :mails
  has_secure_password

  validates :email, presence: true, uniqueness: true
  attr_accessible :email, :password, :password_confirmation
end
