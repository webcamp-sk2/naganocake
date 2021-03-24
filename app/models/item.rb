class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items

  #画像投稿機能
  attachment :image
  #販売ステータス
  enum is_active: {販売中:false,販売中止:true}

  #バリデーション の設定
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
