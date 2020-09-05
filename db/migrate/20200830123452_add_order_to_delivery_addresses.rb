class AddOrderToDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :delivery_addresses, :order, null: false, foreign_key: true
  end
end
