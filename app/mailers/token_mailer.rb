class TokenMailer < ActionMailer::Base
  layout 'email'

  def new_token_email(token)
    @token = token
    @firefox_browser_warning = t('.firefox_message', default: '')
    mail to: @token.user_email
  end
end
