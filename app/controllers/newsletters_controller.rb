class NewslettersController < ApplicationController
  def update
    newsletter = Newsletter.get
    newsletter.update!(newsletter_params)
    redirect_back(fallback_location: dashboard_path)
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(
      :logo,
      :title,
      :description,
      :about,
      :accent_color,
      :from_name,
      :from_email,
      :to,
      :author
    )
  end
end
