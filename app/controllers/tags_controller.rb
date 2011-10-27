class TagsController < ApplicationController
  def index
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    puts "MINHAS TAGS: #{@tags.inspect}"
    respond_to do |format|
      format.json {render :json => @tags.map(&:attributes)}
    end
  end
end
