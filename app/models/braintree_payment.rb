class BraintreePayment

  def initialize(gift, credit_card)
    configure_environment
    @gift = gift
    @credit_card = credit_card
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

  def send_payment(flash)
    result = send_payment!
    if result.success?
      @transaction_id = result.transaction.id
      flash[:notice] = "Transaction successful. Your confirmation number is #{@transaction_id}."
      return true
    elsif result.transaction
      @processor_response_code = result.transaction.processor_response_code
      @processor_response_text = result.transaction.processor_response_text
      flash[:error] = ["Error processing transaction:
        code: #{@processor_response_code}
        text: #{@processor_response_text}"]
        return false
    else
      errors = result.errors.to_a.last.message
      flash[:error] = ["Errors processing transaction: #{errors}"]
      return false
    end
  end
end