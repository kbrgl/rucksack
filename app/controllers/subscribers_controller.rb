class SubscribersController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    @subscriber = Subscriber.new(email: params[:subscriber][:email])

    if @subscriber.save
      NewsletterMailer.with(subscriber: @subscriber).welcome.deliver_now!
      flash[:subscribe_ok] = true
    else
      flash[:subscribe_ok] = false
      flash[:subscribe_error] = "Unable to subscribe. Are you sure you aren't subscribed already?"
    end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @subscriber.destroy!
    redirect_back(fallback_location: dashboard_path)
  end
end
