class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, comments: :author)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      puts @user
      puts @post.errors.full_messages
      flash.now[:errors] = 'Invalid post!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
