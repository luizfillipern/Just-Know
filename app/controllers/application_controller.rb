#encoding: utf-8

class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :initialize_categories
	
	respond_to :html, :json

	protected

	def not_authenticated
		redirect_to login_url, :alert => "Você deve estar logado para acessar esta página"
	end
	
	def initialize_categories
		@categories = Category.all
	end  

end
