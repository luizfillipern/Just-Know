class Category < ActiveRecord::Base
  
  has_many :articles
  
  validates_presence_of :name

	default_scope includes(:articles)
  
	def self.search(terms)
		where("name LIKE :t", :t => "%#{terms}%")	
	end



end
