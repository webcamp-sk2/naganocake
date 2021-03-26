class Address < ApplicationRecord
  #アソシエーション
  belongs_to :public

  validates :public_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true

 #登録済み住所
  def params_registred_address
    "〒" + self.postal_code + "  " + self.address + "  " +self.name
  end

end
