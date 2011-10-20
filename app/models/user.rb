class User < ActiveRecord::Base
  authenticates_with_sorcery!
    
    has_many :articles
    has_many :comments
    attr_accessible :email, :password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

end
