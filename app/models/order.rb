class Order < ApplicationRecord

  belongs_to :public
  has_many :order_items, dependent: :destroy
  has_many :oreder_details, dependent: :destroy
  has_many :items, through: :oreder_details

  #validates :total_payment, presence: true, numericality: { greater_than: 0 }
  validates :shipping_cost, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :public_id, presence: true

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

   def self.total_amount_calculator(cart_items)
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.amount * cart_item.item.price
    end
    sum * 1.1
  end


end
