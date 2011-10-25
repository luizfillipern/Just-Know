class ArticlesController < ApplicationController

  before_filter :require_login, :except => [:index, :show]


# GET /articles
# GET /articles.json
  def index
    if params[:sorting]
			if params[:sorting] = "latest"
				@articles = Article.order("updated_at DESC")
			else
      				@articles = Article.find_by_sql("select * from articles art where art.id in (
                                      select article_id from articles a join ratings r on a.id = r.article_id
                                      group by a.id order by sum(r.score) DESC
                                          )
                                      ")
			end
      @articles.instance_eval <<-EVAL
        def current_page
          #{params[:page] || 1}
        end
        def num_pages
          count/limit_value
        end
        def limit_value
          3
        end
      EVAL
      Kaminari.paginate_array(@articles).page(params[:page])
    elsif params[:user_id]
      @articles = Article.where(:user_id => params[:user_id]).page(params[:page]).per(9)
    else
      @articles = Article.page(params[:page]).per(9)
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
