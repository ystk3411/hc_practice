input1 = gets.chomp.split(',')
input2 = gets.chomp.split(',')
num = 0
result_array = []
SCORE_MAPPING = {-4 => 'コンドル',-3 => 'アルバトロス',-2 => 'イーグル',-1 => 'バーディ',0 => 'パー',1 => 'ボギー',99 => 'ホールインワン'}

while input1.count > num
  par = input1[num].to_i
  strokes = input2[num].to_i
  result = strokes - par

  if strokes == 1 && par != 5
    result_array.push("#{SCORE_MAPPING[99]}")
  elsif result > 1
    result_array.push("#{result}#{SCORE_MAPPING[1]}")
  else
    result_array.push(SCORE_MAPPING[result])
  end

  num += 1
end

puts result_array.join(',')
