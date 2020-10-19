io = open("aaa.txt")   #ファイルopen
io = open("aaa.txt"){|io| puts io.read} #ファイルopenしブロック終了時にcloseされる
IO.read("aaa.txt")  #ファイルread（全行読み込み）
IO.read("aaa.txt",2)  #ファイルread（指定されたbyte数のみread）
IO.foreach("aaa.txt"){|line| puts line} #ファイルをopenし各行をブロックに渡して実行
io = open("aaa.txt").readlines #ファイルをopenし全てreadし、配列で返却
#------------------------------------------------------------------
io = open("aaa.txt")  #ファイルopen
io.gets  #１行read
io.gets  #１行read
io.lineno  #行番号返却（rubyではgetsした回数）
#-----------------------------------------------------------------
io = open("aaa.txt")  #ファイルopen
io.each_byte{|i| puts i}  #IOオブジェクトから1バイトずつ整数として読み込んでブロックに渡す
io.close    #close
io.closed?  #closeされてるか確認（closeされていればtrue） 
#-----------------------------------------------------------------
p STDOUT.write('azukizawa hiroyuki')  #IOに対して引数の文字列を出力。出力成功すると文字列のbyte数を返却
print STDOUT.puts('azukizawa',' hiroyuki')  #IOに対して複数のオブジェクトを出力。出力成功すると文字列のbyte数を返却
#-----------------------------------------------------------------
#$, = "bbb"   #=>  $,なら値が指定されると複数オブジェクトの間に値を出力
#$\, = "bbb"   #=>  $\,なら値が指定されると最後に値を出力
print STDOUT.print('azukizawa',' hiroyuki')  #IOに対して複数のオブジェクトを出力。出力成功すると文字列のbyte数を返却
#-----------------------------------------------------------------

#バッファリング
filename = "buffer.txt"
File.open(filename, "w") do |file|
    3.times do |i|
        file.write("a" * 5)
        puts "{i+1}回目： #{File.size(filename)}"  #=> 0
    end
end
puts "終了後： #{File.size(filename)}"   #=> 15
 File.read(filename)

#フラッシュ(io.flush)
filename = "buffer.txt"
File.open(filename, "w") do |file|
    3.times do |i|
        file.write("a" * 5)
        file.flush
        puts "{i+1}回目： #{File.size(filename)}"  #=> 5,10,15
    end
end
puts "終了後： #{File.size(filename)}"   #=> 15
File.read(filename)

#同期(io.sync)
filename = "buffer.txt"
File.open(filename, "w") do |file|
    file.sync = true  #=> io.sync = true と書くことで出力の操作で同時に出力される
    3.times do |i|
        file.write("a" * 5)
        puts "{i+1}回目： #{File.size(filename)}"  #=> 5,10,15
    end
end
puts "終了後： #{File.size(filename)}"   #=> 15
File.read(filename)

#ファイルポインタの先頭への移動(io.rewind)
filename = "rewind.txt"  #=> 中身は aaa と bbb の２行
File.open(filename) do |io|
    io.gets   #=> aaa\n
    io.rewind
    io.gets   #=> aaa\n
end

#ファイルポインタ位置の取得や設定(io.pos)
filename = "rewind.txt"  #=> 中身は aaa\n と bbb\n の２行
File.open(filename) do |io|
    io.pos    #=> 0
    io.gets   #=> aaa\n
    io.pos    #=> 4
    io.gets   #=> bbb\n
    io.rewind
    p io.pos    #=> 0
    io.pos = 5
    io.gets   #=> bb\n  
end

#ファイルポインタ位置の設定(io.seek) 
#２番目の引数の位置から移動
# (IO::SEEK_SET ファイルの先頭からの位置)
# (IO::SEEK_CUR 現在のファイルの位置)
# (IO::SEEK_END 現在のファイルの位置)
filename = "rewind.txt"  #=> 中身は aaa\n と bbb\n の２行
File.open(filename) do |io|
     io.seek(-2, IO::SEEK_END)
    io.read   #=> b\n
end

