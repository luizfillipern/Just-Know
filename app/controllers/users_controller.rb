class UsersController < ApplicationController
	respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to root_url, :notice => "Cadastro efetuado com sucesso"
    else
      render :new
    end
  end

	def show
		@user = User.find(params[:id])		
		respond_with @user
	end

end
