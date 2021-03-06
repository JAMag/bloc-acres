require 'twilio-ruby'
class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!, :only => 'reply'



  def reply
    begin
      message_body = params['Body']
      from_number = params['From']
      boot_twilio
      sms = @client.messages.create(
          from: Rails.application.secrets.twilio_number,
          to: from_number,
          body: "Hello there, thanks for texting me. This is Moverable. Your number is #{from_number}."
      )

    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

  # def reply
  #   message_body = params['Body']
  #   from_number = params['From']
  #   boot_twilio
  #   sms = @client.messages.create(
  #       from: Rails.application.secrets.twilio_number,
  #       to: from_number,
  #       body: "Hello there, thanks for texting me. This is Moverable. Your number is #{from_number}."
  #   )
  #
  # end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token



  end
end