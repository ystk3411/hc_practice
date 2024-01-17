module NameService
  def changeName(newName)
    p '不適切な名前です' if newName == 'うんこ'

    @name = newName
  end

  def getName
    @name
  end
end
