class PurchaseItemsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id || @item.order != nil
    @order = PurchaseItem.new
  end

  def order # 購入する時のアクションを定義
    @order = PurchaseItem.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:purchase_item).permit(:postal_code, :state_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵の環境変数を読み込む
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

end
