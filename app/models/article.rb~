class Article < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user
    has_many :comments
    has_many :ratings
    
    validates_associated :category
    validates :title, :user , :presence=> true


    def total_score
      total = 0;
      self.ratings.each do |r|
        total = total + r.score
      end
      total
    end

end
