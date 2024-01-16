module NameService
  def changeName(newName)
    print('不適切な名前です') if @name == 'うんこ'

    @name = newName
  end

  def getName
    @name
  end
end
