class Article < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user
    has_many :comments
    has_many :ratings
    
    validates_associated :category, :user
    validates :title, :presence=> true

    default_scope order('updated_at DESC')

    def total_score
      total = 0
      self.ratings.each do |r|
        total = total + r.score unless r.score.nil?
      end
      total
    end

    def average_score
      total = total_score/(ratings.size)
      total
    end

end
