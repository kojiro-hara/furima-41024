class ItemsController < ApplicationController
  # ログインユーザーしか new/create/edit/update を使えないようにする
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # 該当商品の情報を取得（edit, update, show などで使う）
  before_action :set_item, only: [:edit, :update, :show]
  # 出品者以外が編集ページにアクセスしたらトップにリダイレクト
  before_action :redirect_unless_owner, only: [:edit, :update]
  # セレクトボックス用データの取得
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
  # set_item が呼ばれているのでここでは何も追加不要
  end

  def edit
   # set_item と redirect_unless_owner が事前に呼ばれている
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Strong Parameters
  def item_params
    params.require(:item).permit(:product_name, :text, :price, :category_id, :state_id, :burden_id, :prefecture_id, :days_id, :image)
  end

  # 商品を取得
  def set_item
    @item = Item.find(params[:id])
  end

  # 出品者でなければトップページにリダイレクト
  def redirect_unless_owner
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  # セレクトボックス用データの読み込み
  def set_select_data
    @categories = Category.all
    @states = State.all
    @burdens = Burden.all
    @prefectures = Prefecture.all
    @days = Days.all
  end
end
