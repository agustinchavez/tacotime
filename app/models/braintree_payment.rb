class BraintreePayment

  def initialize(gift)
    configure_environment
    @gift = gift
    @credit_card = CreditCard.new({num: "5105105105105100", exp:"05/12"}) # hardcoded for testing
  end

  def configure_environment
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "5cdq86ftn9xtccyv"
    Braintree::Configuration.public_key = "hpt9gnhq464k2p34"
    Braintree::Configuration.private_key = "094a9def5e26df59c27d0315f490638b"
  end

  def send_payment!
    Braintree::Transaction.sale(
      :amount => @gift.price,
      :credit_card => {
        :number => @credit_card.number,
        :expiration_date => @credit_card.expiration_date
      }
    )
  end
end