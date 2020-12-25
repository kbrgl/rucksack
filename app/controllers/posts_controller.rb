class PostsController < ApplicationController
  def new
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @subscriber = Subscriber.new
    @favorite = Favorite.new
  end

  def create
    post = Post.create! params.require(:post).permit(:title, :subtitle, :content)
    NewsletterMailer.deliver_post(post)
    redirect_to post
  end
end
