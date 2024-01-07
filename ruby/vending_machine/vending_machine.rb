require './juice'
require './suica'

class VendingMachine
  
  def initialize
    @pepsi = Juice.new('ペプシ',150)
    @monster = Juice.new('モンスター',230)
    @water = Juice.new('いろはす',120)
    @suica = Suica.new
    @stock = {}
    @stock_array = []
    @drink_detail = {}
    @sales = 0

    5.times do
      restock(@pepsi)
      restock(@monster)
      restock(@water)
    end
  end

  # purchaseの引数に使用
  def pepsi
    @pepsi
  end

  # purchaseの引数に使用
  def monster
    @monster
  end

  # purchaseの引数に使用
  def water
    @water
  end

  # 残高確認
  def get_deposit
    @suica.get_deposit
  end

  # suicaの残高をチャージ
  def charge(money)
    @suica.charge(money)
  end

  # purchaseの引数に使用
  def monster
    @monster
  end

  # purchaseの引数に使用
  def water
    @water
  end

  # 在庫表示
  def get_stock
    @stock.each do |key,value|
      @drink_detail[key] = "#{value[:drinks].size}本"
      # @drink_detail[:stock] = value[:drinks].size
    end
    @drink_detail.inspect
  end

  # 売り上げ表示
  def get_sales
    @sales
  end

  # 商品補充
  def restock(drink)
    unless @stock.has_key? drink.get_name
      @stock[drink.get_name] =  {:drinks => [],price: drink.get_price}
    end
    
    @stock[drink.get_name][:drinks] << drink.get_name
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
    @stock[drink.get_name][:drinks].size > 0
  end

  # 購入
  def purchase(drink)
    if have_stock?(drink) && @suica.get_deposit > drink.get_price
      @stock[drink.get_name][:drinks].pop
      @sales += drink.get_price
      @suica.spend(drink.get_price)
    elsif @suica.get_deposit < drink.get_price
      p 'suicaの残高が足りません'
    elsif have_stock?(drink) == false
      p '売り切れです'
    end
  end

  # 購入可能なドリンクのリストを取得
  def available_drink_list
    @stock.select do |key,value|
      value[:drinks].any? && @suica.get_deposit > value[:price]
    end.keys
  end

end

