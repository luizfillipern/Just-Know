  class ArticlesController < ApplicationController

    before_filter :require_login, :except => [:index, :show]


  # GET /articles
  # GET /articles.json
    def index
      @articles = Article.page(params[:page]).per_page(2)
      if params[:sorting]
        if params[:sorting] == "latest"
          @articles = @articles.order("updated_at DESC")
        elsif params[:sorting] == "best"
          @articles = @articles.joins(:ratings).group(:article_id).order("sum(score)/count(*) desc")
        end
      elsif params[:user_id]
        @articles = @articles.where(:user_id => params[:user_id]).page(params[:page]).per(9)
      end

      

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
      end
    end

    # GET /articles/1
    # GET /articles/1.json
    def show
      @article = Article.find(params[:id])
      puts Article.all.inspect

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @article }      
      end
    end

    # GET /articles/new
    # GET /articles/new.json
    def new
      @article = Article.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def test

  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
end
