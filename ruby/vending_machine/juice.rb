class Juice
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.pepsi
    new('ペプシ', 150)
  end

  def self.monster
    new('モンスター', 230)
  end

  def self.water
    new('いろはす', 120)
  end
end
