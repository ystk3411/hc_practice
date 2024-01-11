require './juice'
require './suica'

class VendingMachine
  SUICA = Suica.new

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

  # 残高確認
  def get_deposit
    SUICA.deposit
  end

  # suicaの残高をチャージ
  def charge(money)
    SUICA.charge(money)
  end

  # 在庫表示
  def get_stock
    stock_name = {}
    stock_number = {}

    @stocks.each do |value|
      stock_name[value.name] = { drinks: [] } unless stock_name.has_key? value.name
      stock_name[value.name][:drinks] << value.name
    end

    stock_name.each do |key, value|
      stock_number[key] = "#{value[:drinks].size}本"
    end
    stock_number
  end

  # 売り上げ表示
  def get_sales
    @sales
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
  def purchase(drink)
    if have_stock?(drink) && SUICA.deposit > drink.price
      index = @stocks.find_index { |x| x.name == drink.name }
      @stocks.delete_at(index)
      @sales += drink.price
      SUICA.spend(drink.price)
    elsif SUICA.deposit < drink.price
      p 'suicaの残高が足りません'
    elsif have_stock?(drink) == false
      p '売り切れです'
    end
  end

  # 購入可能なドリンクのリストを取得
  def available_drink_list
    list = {}
    @stocks.each do |value|
      list[value.name] = { drinks: [] } if !list.has_key?(value.name) && (SUICA.deposit > value.price)

      list[value.name][:drinks] << value.name if SUICA.deposit > value.price
    end
    list.keys
  end
end

v = VendingMachine.new
p v.purchase(v.pepsi), v.purchase(v.pepsi), v.purchase(v.monster), v.available_drink_list
