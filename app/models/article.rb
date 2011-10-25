class Article < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user
    has_many :comments
    has_many :ratings
    
    validates_associated :category, :user
    validates :title, :presence=> true


    def total_score
      total = 0
      puts "Ratings: #{self.ratings.inspect}"
      self.ratings.each do |r|
        total = total + r.score unless r.score.nil?
      end
      total
    end

    def average_score
      puts "CHAMANDO O AVERAGE_SCORE: "
      puts total_score
      total = total_score/(ratings.size-1)
      puts total
      total.inspect
    end

end
