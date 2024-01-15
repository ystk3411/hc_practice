require './juice'
require './suica'

class VendingMachine
  attr_reader :sales

  def initialize
    @stocks = []
    @sales = 0

    5.times do
      restock(pepsi)
      restock(monster)
      restock(water)
    end
  end

  # purchaseの引数に使用
  def pepsi
    Juice.pepsi
  end

  # purchaseの引数に使用
  def monster
    Juice.monster
  end

  # purchaseの引数に使用
  def water
    Juice.water
  end

  # 在庫表示
  def get_stock
    @stocks.group_by{|value| value.name}.map{|key,value| [key,"#{value.count}本"]}.to_h
  end

  # 商品補充
  def restock(drink)
    @stocks << drink
  end

  # 購入可否確認
  def check_on_sale(drink)
    if have_stock?(drink)
      '販売中'
    else
      '売り切れ'
    end
  end

  # 在庫有無確認
  def have_stock?(drink)
    @stocks.select do |value|
      drink.name == value.name
    end.size > 0
  end

  # 購入
  def purchase(drink,suica)
    if have_stock?(drink) && suica.deposit > drink.price
      index = @stocks.find_index { |x| x.name == drink.name }
      @stocks.delete_at(index)
      @sales += drink.price
      suica.spend(drink.price)
    elsif suica.deposit < drink.price
      p 'suicaの残高が足りません'
    elsif have_stock?(drink) == false
      p '売り切れです'
    end
  end

  # 購入可能なドリンクのリストを取得
  def available_drink_list(suica)
    list = {}
    @stocks.each do |value|
      list[value.name] = { drinks: [] } if !list.has_key?(value.name) && (suica.deposit > value.price)

      list[value.name][:drinks] << value.name if suica.deposit > value.price
    end
    list.keys
  end
end

v = VendingMachine.new
suica = Suica.new
p v.purchase(v.pepsi,suica),v.purchase(v.pepsi,suica)
