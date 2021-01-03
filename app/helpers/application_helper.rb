module ApplicationHelper
  def format_date(date)
    date.strftime("%b %d, %Y")
  end

  def logo_url
    if Newsletter.logo.attached?
      url_for(Newsletter.logo)
    end
    'logo.png'
  end
end
