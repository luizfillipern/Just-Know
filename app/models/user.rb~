class User < ActiveRecord::Base
  authenticates_with_sorcery!
    
    has_many :articles
    has_many :comments
<<<<<<< HEAD
    has_many :ratings
    
  attr_accessible :email, :password, :password_confirmation
=======
    attr_accessible :email, :password
>>>>>>> 5ca8ba15a0b1f5086cc8558d4a421a9bd1bae913

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

end
