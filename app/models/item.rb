class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items

  #画像投稿機能
  attachment :image
  #販売ステータス
  enum is_active: {販売中:0,販売中止:1}
end
