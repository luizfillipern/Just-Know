class HomeController < ApplicationController

  def index
	@lastestArticles = Article.order("updated_at DESC")
  	@bestArticles = Article.joins(:ratings).group(:article_id).order("sum(score)/count(*) desc")
  end

end
