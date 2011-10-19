class User < ActiveRecord::Base
  authenticates_with_sorcery!
    
    has_many :articles
    has_many :comments
    has_many :ratings
    
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

end
