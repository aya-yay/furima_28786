class AddPurchaseItemToDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :delivery_addresses, :purchase_item, null: false, foreign_key: true
  end
end
