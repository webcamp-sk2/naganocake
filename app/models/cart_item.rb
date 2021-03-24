class CartItem < ApplicationRecord

  belongs_to :public
  belongs_to :item

  validates :item_id, presence: true
  validates :amount, presence: true, length: { minimum: 1 }
  validates :public_id, presence: true
end
