class User
  include Mongoid::Document
  include ActiveModel::SecurePassword 
  
  field :email, type: String
  field :password_digest, type: String
  field :is_persona, type: Boolean

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

  def self.authenticate_with_persona(assertion)
    user_info = Persona.verify(assertion, "mail-link.dev") 
    if user_info = Persona.verify(assertion, "mail-link.dev") 
      User.find_or_initialize_by(email: user_info[:email]).tap do |user|
        user.create_random_password if user.new_record?
      end
    else
      false
    end
  end

  def create_random_password
    update_attributes(password: SecureRandom.hex(20))
  end
end
