class Article < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user
    has_many :comments, :dependent => :delete_all
    has_many :ratings, :dependent => :delete_all
    
    validates_associated :category, :user
    validates :title, :presence=> true

    default_scope includes(:ratings)
	

	def self.search(terms)
		where("title LIKE :t OR content LIKE :t", :t => "%#{terms}%")	
	end

    def total_score
      total = 0
      self.ratings.each do |r|
        total = total + r.score unless r.score.nil?
      end
      total
    end

    def average_score
      puts "VERIFICANDO OS RATINGS: #{self.ratings.inspect}"
      self.ratings.size > 0 ? total = total_score/(self.ratings.size) : total = 0
      total
    end

end
