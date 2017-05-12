class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  #before_action :authenticate_user!

  def index
    @blogs = Blog.all
  end

  def new
      @blog = Blog.new
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
     redirect_to blogs_path, success: "投稿しました！"
    else
     render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
     redirect_to blogs_path, notice: "投稿を更新しました！"
    else
     render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, danger: "投稿を削除しました！"
  end

  private
   def blogs_params
     params.require(:blog).permit(:title, :content, :picture, :picture_cache)
   end

   def set_blog
     @blog = Blog.find(params[:id])
   end
end
