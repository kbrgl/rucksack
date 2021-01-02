class ApplicationMailer < ActionMailer::Base
  default from: Newsletter.from
  layout 'mailer'
end
