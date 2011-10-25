class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :articles
  has_many :comments
  has_many :ratings

  attr_accessible :name, :email, :password



  validates_presence_of :password, :on => :create
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
