input1 = gets.chomp.split(',')
input2 = gets.chomp.split(',')
num = 0
result_array = []

while input1.count > num
  par = input1[num].to_i
  strokes = input2[num].to_i
  result = strokes - par

  if strokes == 1 && par != 5
    result_array.push('ホールインワン')
  elsif result == 0
    result_array.push('パー')
  elsif result > 0
    if result == 1
      result_array.push("ボギー")
    else
      result_array.push("#{result}ボギー")
    end
  elsif result == -1
    result_array.push('バーディ')
  elsif result == -2
    result_array.push('イーグル')
  elsif result == -3
    if par == 4
      result_array.push('パー')
    elsif par == 5
      result_array.push('アルバトロス')
    end
  elsif result == -4
    result_array.push('コンドル')
  end

  num += 1
end

puts result_array.join(',')
