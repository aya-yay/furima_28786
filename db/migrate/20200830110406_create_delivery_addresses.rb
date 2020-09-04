class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :postal_code, null: false
      t.string     :state_id, null: false
      t.string     :city, null: false
      t.string     :address_line, null: false
      t.string     :building_name
      t.string     :phone_number, null: false
      t.timestamps
    end
  end
end