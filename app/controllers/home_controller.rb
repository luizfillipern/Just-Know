class HomeController < ApplicationController

  def index
	# Adicionar a ordenacao de mais votados aos artigos, por enquanto ele obtem todos sem ordenacao
  	@bestArticles = Article.all
	@lastestArticles = Article.order("updated_at DESC")
  end

end
