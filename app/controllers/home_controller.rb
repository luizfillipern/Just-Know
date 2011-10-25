class HomeController < ApplicationController

  def index
	# Adicionar a ordenacao de mais votados aos artigos, por enquanto ele obtem todos sem ordenacao
  	@bestArticles = Article.joins(:ratings).group(:article_id).order("sum(score)/count(*) desc")
  end

end
