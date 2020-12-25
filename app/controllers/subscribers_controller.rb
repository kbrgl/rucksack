class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(email: params[:subscriber][:email])

    if @subscriber.save
      NewsletterMailer.with(subscriber: @subscriber).welcome.deliver
      flash[:subscribed] = true
    else
      flash[:error] = "Unable to subscribe. Are you sure you aren't subscribed already?"
    end
    redirect_back(fallback_location: root_path)
  end
end
