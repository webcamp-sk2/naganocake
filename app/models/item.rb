class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items
  has_many :cart_items


  enum is_active: {販売中:0,販売中止:1}
end
