class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase_item
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :state, presence: true
  validates :days, presence: true
  validates :price, presence: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999,  format: { with: /\A[a-z0-9]+\z/i }
  
  # 入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)
  # - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）
end
