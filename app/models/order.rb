class Order < ApplicationRecord

  belongs_to :public
  has_many :order_detail
  has_many :items

  #注文ステータス
  enum order_status: {入金待ち:1, 入金確認:2, 制作中:3, 発送準備中:4, 発送済み:5}
  enum payment_selection: {クレジットカード: 0, 銀行振込: 1}

end
