class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
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
    params.require(:item).permit(:image, :name, :description, :category_id, :product_state_id,
      :charge_burden_id, :source_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
