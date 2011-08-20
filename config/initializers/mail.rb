ActionMailer::Base.smtp_settings = {
  :user_name => "ticketee31@gmail.com",
  :password => "katz&bigg",
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => "plain",
  :enable_starttls_auto => true
  #:tls => true
}
