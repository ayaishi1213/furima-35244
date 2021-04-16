class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_params, only:[:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private 

  def item_params
    params.require(:item).permit(:name, :description, :details_status_id, :details_category_id,
                                 :shopping_charge_id,:shipping_area_id,:delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end
