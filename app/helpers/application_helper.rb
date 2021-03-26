module ApplicationHelper

  def current_cart_item
    @order = Order.find(params[:id])
    @oreder_details = @oreder.oreder_details
  end

  # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def sub_price(sub)
    (tax_price(sub.item.price) * sub.amount)
  end

  # 合計金額の計算
  def total_payment(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    price
  end



  def include_tax(price)
    tax = 1.1
    ((price * tax).round(2)).ceil
  end

  def registred_address(address)
    "〒" + address.postal_code + "  " + address.address + "  " + address.name
  end

  def subtotal(select_item)
    include_tax(select_item.item.price) * select_item.amount
  end

  def total(select_items)
    @total_payment = 0
    select_items.each do |select_item|
      @total_payment +=  subtotal(select_item)
    end
    return @total_payment
  end

  def order_total(select_items)
    @total_payment = 0
    select_items.each do |select_item|
      @total_payment += order_subtotal(select_item)
    end
    return @total_payment
  end

  def order_subtotal(select_item)
    select_item.item_price * select_item.amount
  end



end
