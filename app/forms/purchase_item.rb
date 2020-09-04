class PurchaseItem
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :address_line, :building_name, :phone_number, :purchase_item, :token, :item_id, :user_id

  with_options presence: true do
    validates :token, presence: { message: 'カード情報を正しく入力してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :state_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    # 住所の情報を保存
    DeliveryAddress.create(postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, phone_number: phone_number)
    # 購入の情報を保存
    @order = Order.create(user_id: user_id, item_id: item_id)
  end
end
