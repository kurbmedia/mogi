class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable, :token_authenticatable, :encryptable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :repositories

end
