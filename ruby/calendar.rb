require 'optparse'
require 'date'

options = {}
opt = OptionParser.new
opt.on('-m month'){|month|  options[:month] = month.to_i}
opt.parse!(ARGV)

begin 
  today = Date.today
  month = options[:month] || today.month
  day_first = Date.new(today.year,month,1)
  day_last = Date.new(today.year,month,-1) 
rescue 
  p "#{month} is neither a month number (1..12) nor a name"
  exit
end

space = '   ' * day_first.wday

puts "#{month}月 #{today.year}".rjust(13)
puts '日 月 火 水 木 金 土'
print space

(1..day_last.day).each do |date|
  print date

  if date < 10
    print ' '
  end

  print ' '

  if (day_first.wday + date) % 7 == 0
    puts "\n"
  end
end