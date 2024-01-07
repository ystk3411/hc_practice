require './juice'
require './suica'
require './vending_machine'

s = Suica.new
j = Juice.new('コーラ',100)
v = VendingMachine.new

# ステップ1　Suica

# 預かり金(デポジット)として500円がデフォルトでチャージされているものとする
puts s.get_deposit

# Suicaには100円以上の任意の金額をチャージできる
random = Random.new()
puts s.charge("#{random.rand(100..1000)}".to_i)

# 100円未満をチャージしようとした場合は例外を発生させる
puts s.charge(99)

# Suicaは現在のチャージ残高を取得できる
puts s.get_deposit
# -------------------------------------------------------------------------------------------
# ステップ2　ジュースの管理

# 自動販売機はジュースを１種類格納できる←ステップ４で拡張機能として確認

# ジュースは名前と値段の情報をもつ
puts j

# 初期状態で、ペプシ(150円)を5本格納している。←ステップ４で拡張機能として確認

# 自動販売機は在庫を取得できる
puts v.get_stock
# -------------------------------------------------------------------------------------------
# ステップ3　購入処理

# 自動販売機はペプシが購入できるかどうかを取得できる。←ステップ４で拡張機能として確認

# ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする
# ・自動販売機はジュースの在庫を減らす
# ・売り上げ金額を増やす
# ・Suicaのチャージ残高を減らす
puts v.purchase(v.pepsi),v.get_stock,v.get_sales,v.get_deposit

# チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる
puts 3.times  {v.purchase(v.pepsi)},v.charge(1000),3.times  {v.purchase(v.pepsi)}

# 自動販売機は現在の売上金額を取得できる
puts v.get_sales
# -------------------------------------------------------------------------------------------
# ステップ4　機能拡張

# ジュースを3種類管理できるようにする。
# ・初期在庫にモンスター(230円)5本を追加する。
# ・初期在庫にいろはす(120円)5本を追加する。
p v.monster,v.water
puts v.get_stock

# 自動販売機は購入可能なドリンクのリストを取得できる
puts v.available_drink_list

# 自動販売機に在庫を補充できるようにする
v.restock(v.pepsi)
puts v.get_stock

# ステップ3と同様の方法でモンスターといろはすを購入できる
v.purchase(v.monster)
v.purchase(v.water)
puts v.get_stock




