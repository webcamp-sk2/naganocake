class Item < ApplicationRecord

  belongs_to :genre
  has_many :publics, through: :cart_items
  has_many :cart_items
  has_many :oreder_details
  has_many :orders, through: :oreder_details

  validates :genre_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 300 }
  validates :price, presence: true


  #画像投稿機能
  attachment :image
  #販売ステータス
  enum is_active: {販売中:false,販売中止:true}

  #バリデーション の設定
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
