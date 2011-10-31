class HomeController < ApplicationController

  def index
	@lastestArticles = Article.order("updated_at DESC")
  	@bestArticles = Article.order("average_score DESC")
  end
end
