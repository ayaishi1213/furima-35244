class ItemsController < ApplicationController
  before_action :sign_in_user, only:[:new, :create]

  def index
    @items = Item.all
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

  private 

  def item_params
    params.require(:item).permit(:name, :description, :details_status_id, :details_category_id,
                                 :shopping_charge_id,:shipping_area_id,:delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def sign_in_user
    redirect_to new_user_session_url unless user_signed_in?
  end
end
