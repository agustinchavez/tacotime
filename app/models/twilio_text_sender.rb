module TwilioTextSender

  extend self

  def configure_client
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end
    @client = Twilio::REST::Client.new
  end

  def send!(gift)
    if gift.redeemed
      return send_text(gift, redeem_message)
    else
      return send_text(gift, receive_message(gift))
    end
  end

  def send_text(gift, text_body)
    configure_client
    begin
      @client.account.messages.create({
        from: ENV["twilio_phone"],
        to: gift.phone,
        body: text_body
      })
      return nil
    rescue Twilio::REST::RequestError => e
      puts "ERROR: #{e.message}"
      return "Sorry! Something went wrong on our end and we were unable to send a notification SMS. Please let your friend know where to pick up their coffee!"
    end
  end

  def receive_message(gift)
    "You received a gift meal at #{gift.restaurant.name}  from #{gift.giver.first_name}! Visit http://google.com to redeem."
  end

  def redeem_message
    "Your meal has been redeemed! Do something nice and maybe someone will buy you another one."
  end

end