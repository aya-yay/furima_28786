class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :state
  belongs_to_active_hash :day

  belongs_to :user
  has_many :comments
  has_one :purchase_item
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :state_id
    validates :day_id
    validates :price, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :state_id
    validates :day_id
  end
end
