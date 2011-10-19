class HomeController < ApplicationController
  before_filter :require_login

  def index
	# Adicionar a ordenacao de mais votados aos artigos, por enquanto ele obtem todos sem ordenacao
  	@bestArticles = Article.limit(6)
  end

end
