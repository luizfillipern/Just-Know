class Article < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user
    has_many :comments
    has_many :ratings
    
    validates_associated :category
    validates :title, :user , :presence=> true
    
end
