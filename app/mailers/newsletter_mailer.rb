class NewsletterMailer < ApplicationMailer
  def self.deliver_post(post)
    Subscriber.all.map do |subscriber|
      NewsletterMailer.with(subscriber: subscriber, post: post).post.deliver_later
    end
  end

  def welcome
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: "Welcome to #{Newsletter.title}!")
  end

  def post
    @post = params[:post]
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: @post.title)
  end
end
