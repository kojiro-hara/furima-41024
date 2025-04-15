class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :redirect_unless_owner, only: [:edit, :update, :destroy]
  before_action :set_select_data, only: [:edit, :update]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      Rails.logger.debug @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :text, :price, :category_id, :state_id, :burden_id, :prefecture_id, :days_id, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_owner
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_select_data
    @categories = Category.all
    @states = State.all
    @burdens = Burden.all
    @prefectures = Prefecture.all
    @days = Days.all
  end
end
