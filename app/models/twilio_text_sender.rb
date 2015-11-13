class TwilioTextSender

  def initialize(gift)
    configure_client
    @client = Twilio::REST::Client.new
    @gift = gift
  end

  def configure_client
    account_sid = 'ACf56291e066dcd809e0983ac5e491b499'
    auth_token = 'b0b59b6b759eeb2713fc6137a19e726f'

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end
  end

  def send!
    @gift.redeemed ? send_text(redeem_message) : send_text(receive_message)
  end

  def send_text(text_body)
    begin
      @client.account.messages.create({
        from: '+17084419208',
        to: @gift.phone,
        body: text_body
      })
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
  end

  def receive_message
    "You received a gift meal from #{@gift.giver.first_name}! Visit http://tacos.yum to redeem."
  end

  def redeem_message
    "Your meal has been redeemed! Do something nice and maybe someone will buy you another one."
  end

end