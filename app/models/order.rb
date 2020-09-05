class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  has_one :delivery_address
  belongs_to :item
  belongs_to :user
end
