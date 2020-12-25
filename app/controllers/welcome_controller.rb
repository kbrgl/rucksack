class WelcomeController < ApplicationController
  layout 'application'

  def index
    @posts = Post.order(created_at: :desc)
    @subscriber = Subscriber.new
  end
end
