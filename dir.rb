#!usr/bin/ruby

dir = Dir.open("/home/orca/aaa")
dir.each{|file| puts file}
dir.close

puts Dir.pwd  #/home/orca

#ブロックで開いてるので自動的にクローズされる
Dir.open("/home/orca/bbb"){|dir| puts dir.path}   #/home/orca/bbb

puts Dir.pwd  #/home/orca/

Dir.chdir("/home/orca/bbb")
puts Dir.pwd  #/home/orca/bbb

Dir.chdir("/home/orca/aaa"){|dir| puts Dir.pwd}  #ブロック内だけ/home/orca/aaa

puts Dir.pwd  #/home/orca/bbb

Dir.mkdir("/home/orca/ccc")
Dir.chdir("/home/orca/ccc"){|dir| puts Dir.pwd}  #ブロック内だけ/home/orca/ccc
Dir.rmdir("/home/orca/ccc")

puts Dir.pwd  #/home/orca/bbb


