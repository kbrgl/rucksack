class NewsletterMailer < ApplicationMailer
  default from: 'Great Stuff <newsletter@kabirgoel.com>'

  def self.deliver_post(post)
    Subscriber.all.map do |subscriber|
      NewsletterMailer.with(subscriber: subscriber, post: post).post.deliver
    end
  end

  def welcome
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: 'Welcome to Great Stuff!')
  end

  def post
    @post = params[:post]
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: @post.title)
  end
end
