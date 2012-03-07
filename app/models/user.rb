class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :remember_me
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :ticket, :movies
  validates_presence_of :firstname, :lastname, :email
  validates_presence_of :password, :on => :create
  validates_presence_of :firstname, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password
end
