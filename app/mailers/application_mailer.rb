# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@kensuma.com'
  layout 'mailer'
end
