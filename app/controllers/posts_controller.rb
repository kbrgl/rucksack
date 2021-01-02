class PostsController < ApplicationController
  before_action :authenticate_writer!, except: %i[index show]
  authorize_resource except: %i[index show]

  def index
    @posts = Post.published
    @subscriber = Subscriber.new
  end

  def new
    @post = Post.create!
    redirect_to edit_post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
    if @post.draft && !writer_signed_in?
      not_found
    else
      @subscriber = Subscriber.new
      @favorite = Favorite.new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    NewsletterMailer.deliver_post(post) if params[:post][:sendmail]
    redirect_to post
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :draft)
  end
end
