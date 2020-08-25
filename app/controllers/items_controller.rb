class ItemsController < ApplicationController
  def index
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description,:category, :condition, :delivery_fee, :state, :days, :price).merge(user_id: current_user.id)
  end



end
