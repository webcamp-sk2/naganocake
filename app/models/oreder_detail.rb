class OrederDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  #製作ステータス
  enum making_status: [:着手不可,:製作待ち,:制作中,:製作完了]
end
