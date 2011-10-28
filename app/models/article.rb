class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :ratings, :dependent => :delete_all

  validates_associated :category, :user
  validates :title, :presence=> true


  validates_associated :category, :user
  validates :title, :presence=> true

  acts_as_taggable

  def total_score
    average_score
  end

  def article_tags=(ids)
    self.tag_list = ids
  end

  def article_tags
    self.tags
  end
end
