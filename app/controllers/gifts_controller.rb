class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:show]
  before_filter :authenticate_user, except: [:update]


  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    find_gift
    @restaurant = @gift.restaurant
  end

  # GET /gifts/new
  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @menu_items = @restaurant.menu_items
    @receivers = User.all
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    gift = current_user.given_tacos.build(gift_params)
    gift.assign_menu_receiver_phone(params)

    cc = CreditCard.new(params["cc"])
    transaction = BraintreePayment.new(gift, cc)

    if gift.save && transaction.send_payment(flash)
      text = TwilioTextSender.new(gift)
      text.send!
      redirect_to confirmation_path(gift)
    else
      flash[:error] = gift.errors.full_messages
      redirect_to new_restaurant_gift_path(restaurant)
    end

  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    find_gift
    if @gift.update_attributes(redeemed: true)
      flash[:notice] = "Meal Redeemed!"
      redeem_text = TwilioTextSender.new(@gift)
      redeem_text.send!
      redirect_to restaurants_profile_path
    else
      flash[:error] = "Unable to redeem voucher"
      redirect_to restaurants_profile_path
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @gift = Gift.find_by(id: params[:id])
    @restaurant = @gift.restaurant
  end

  private



    def find_gift
      @gift = Gift.find_by(id: params[:id])
    end

    def authorize_user
      find_gift
      redirect_to root_path unless current_user.received_taco?(@gift)
    end

    def authenticate_user
      unless current_user
       flash[:error] = ["Please login to send a meal."]
       redirect_to root_path
      end
    end

    def gift_params
      params.require(:gift).permit(:message)
    end

    def set_gift
      @gift = Gift.find(params[:id])
    end

end
