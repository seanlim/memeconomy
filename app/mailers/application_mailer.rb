class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_DOMAIN']
  layout 'mailer'
end
