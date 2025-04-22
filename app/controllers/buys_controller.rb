class BuysController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @prefectures = Prefecture.all
    @buy = Buy.new
    @buy_shipping = BuyShipping.new 
  end

  def new
    @buy_shipping = BuyShipping.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      Shipping.create(shipping_params)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @prefectures = Prefecture.all 
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def buy_params
    params.require(:buy_shipping).permit(:post_code_id, :prefecture_id, :city, :house_number, :property, :telephone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def shipping_params
    params.require(:buy_shipping).permit(:post_code_id, :prefecture_id, :city, :house_number, :property, :telephone )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
  end
end
