#encoding: utf-8

class SessionsController < ApplicationController
  def new
    if params[:return_to_url]
      session[:return_to_url] = params[:return_to_url]
    end
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Login efetuado com sucesso"
    else
      flash.now.alert = "Email ou senha inválidos"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
