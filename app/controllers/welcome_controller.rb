class WelcomeController < ApplicationController
  def index
    @posts = Post.published
    @subscriber = Subscriber.new
  end

  def about
  end
end
