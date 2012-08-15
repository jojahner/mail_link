class User
  include Mongoid::Document
  include ActiveModel::SecurePassword 
  
  field :email, type: String
  field :password_digest, type: String
  has_many :mails
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, on: :create
  attr_accessible :email, :password, :password_confirmation

  def self.authenticate(args)
    User.find_by(email: args[:email]).try(:authenticate, args[:password])
  rescue
    false
  end
end
