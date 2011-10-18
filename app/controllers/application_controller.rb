#encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def not_authenticated
    redirect_to login_url, :alert => "Você deve estar logado para acessar esta página"
  end

end
