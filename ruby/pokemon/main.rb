require './pokemon'
require './player'
require './name_service'
require './pikachu'

pikachu = Pikachu.new('ピカチュウ', 'でんき', '', 100)
p pikachu.attack
pikachu.changeName('ライチュウ')
p pikachu.getName
pikachu.changeName('うんこ')

player = Player.new('サトシ')
player.changeName('タケシ')
p player.getName
