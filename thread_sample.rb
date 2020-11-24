#!usr/bin/ruby

#Threadクラスのテスト
def now
    "#{Time.now} .#{Time.now.usec}: "
end
puts '--- thread 0 -------------'
t1 = Thread.new do
        puts "#{now} start in thread 0"
        puts "#{now} end in thread 0"
end

puts '--- thread 1 -------------'
t1 = Thread.new do
        puts "#{now} start in thread 1"
        puts "#{now} end in thread 1"
end
(0..10).each do |i|
    puts "#{now} #{i}: #{t1.status}"
end

puts '--- thread 2 -------------'
t2 = Thread.new do
    puts "#{now} start in thread 2"
    Thread.stop
    puts "#{now} end in thread 2"
end
(0..10).each do |i|
    puts "#{now} #{i}: #{t2.status}"
end

puts '--- thread 3 -------------'
t3 = Thread.new do
    puts "#{now} start in thread 3"
    Thread.stop
    puts "#{now} end in thread 3"
end
t3.run
(0..10).each do |i|
    puts "#{now} #{i}: #{t3.status}"
end

puts '--- thread 4 -------------'
t4 = Thread.new do
    puts "#{now} start in thread 4"
    Thread.stop
    puts "#{now} end in thread 4"
end
sleep 5
t4.run
(0..10).each do |i|
    puts "#{now} #{i}: #{t4.status}"
end
