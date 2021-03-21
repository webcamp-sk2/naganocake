class Address < ApplicationRecord
  #アソシエーション
  belongs_to :public

  validates :public_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true

end
