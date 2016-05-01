class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def write
    a = Post.new(title: params[:title], content: params[:content])
    if a.save
      redirect_to :back
    else
      render :text => a.errors.messages[:title][0]
    end
    
  end
  
  def comment_write
    a = Comment.new(content: params[:content], post_id: params[:id])
    a.save
    redirect_to '/'
  end
end
