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

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :state_id, presence: true, numericality: { other_than: 1 }
  validates :day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
