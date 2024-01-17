class Suica
  attr_reader :deposit

  def initialize
    @deposit = 500
  end

  def charge(money)
    return '100円未満はチャージできません' if money < 100

    @deposit += money
  end

  def spend(money)
    @deposit -= money
  end
end
