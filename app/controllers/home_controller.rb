class HomeController < ApplicationController

  def index
	# Adicionar a ordenacao de mais votados aos artigos, por enquanto ele obtem todos sem ordenacao
  	@bestArticles = Article.limit(6).joins(:ratings)
  end

end
