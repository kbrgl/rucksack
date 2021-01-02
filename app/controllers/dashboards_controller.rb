class DashboardsController < ApplicationController
  before_action :authenticate_writer!
  authorize_resource class: false

  def show
    @posts = Post.all
    @writers = Writer.all
    @friends = Writer.with_role :friend
    @strangers = Writer.with_role :stranger
    @subscribers = Subscriber.all.order(created_at: :desc)
  end
end
