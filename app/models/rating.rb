class Rating < ActiveRecord::Base
  
  belongs_to :user  
  belongs_to :article
  
  validates_presence_of :score
  validates_associated :user, :article
  #before_save :update_average_rating_of_articles
  #before_update :update_average_rating_of_articles

  def update_average_rating_of_articles
    self.article = Article.find(self.article.id)
    self.article.update_attributes :average_score => self.article.average_score + self.score
  end
  
end
