require './name_service'

class Pokemon
  include NameService

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    "#{@name}のこうげき"
  end
end
