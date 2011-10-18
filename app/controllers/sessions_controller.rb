#encoding: utf-8

class SessionsController < ApplicationController
  def new
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
    redirect_to root_irl
  end

end
