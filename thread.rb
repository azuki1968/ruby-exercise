#!usr/bin/ruby

#Threadクラス
#スレッドを表すクラス
#並行処理が可能になる
#プログラムの開始と同時に生成されるスレッドをメインスレッドと呼ぶ
#このメインスレッドが終了するときには、他のスレッドも含めてプログラム自体が終了する
#スレッドの実行はスケジューリングされていて、管理方法はプラットフォームに依存している
#現在実行中のスレッドをカレントスレッドと呼ぶ

#スレッドを生成する
#Thread.newメソッドにブロックを渡すと、Threadクラスのオブジェクトである
#スレッドが生成される。また引数をブロックに渡すこともできる。
#t = Thread.new{ sleep 1 }
#t = Thread.new(5) {|t| sleep t }    #一時停止（５秒間）
#スレッドはThread.startメソッドやThread.forkメソッドでも生成できる。
#この２つのメソッドは、initializeメソッドが呼ばれないこと以外はThread.newと同じ。


#スレッドの状態(statusメソッド)
# run      実行中または実行可能状態。生成直後やrunメソッドやwakeメソッドで起こされたスレッドがこの状態。
# sleep    一時停止状態。Thread.stopメソッドやThread.joinメソッドにより一時停止されたスレッドがこの状態。
# aborting 処理終了中。killメソッドなどで終了されるスレッドは一時的にこの状態になる。
# false    killメソッドで終了したり、正常終了したスレッドの場合にfalseが返る。
# nil      例外などで異常終了したスレッドの場合にはnilが返る。
# dead     終了状態

# alive?メソッド スレッドが生きているか確認できる。
# stop?メソッド  メソッドが終了もしくは一時停止していることを確認できる。

#スレッドの状態を調べる(statusメソッド)
#t = Thread.new{ sleep 100 }
#t.status    #=> sleep
#t.alive?    #=> true

#th = Thread.new do
#    p "aaa"
#    p Time.now
#    sleep(3)
#end
#p "bbb"
#p Time.new
#p Thread.list
#sleep(4)
#p "ccc"
#p Thread.list
#
#Thread.exit

#スレッドの実行、一時停止、終了
#t = Thread.new do
#    Thread.stop
#    puts "OK\n"
#end
#t.run

#スレッドの終了
#Thread.kill   #指定したスレッドのexitメソッドを呼び出す
#Thread.exit   #カレントスレッドのexitメソッドを呼び出す
#t = Thread.new do
#    Thread.exit
#end
#puts t    #=> #<Thread:0x000055add1547688@thread.rb:59 run>
#sleep(3)
#puts t    #=> #<Thread:0x000055add1547688@thread.rb:59 dead>

#スレッド終了時のensure節
#スレッド生成時にensure節がある場合、スレッド終了時に実行される。
#正常終了の場合だけでなく、他のスレッドからkillメソッドなどで終了させられた場合も同様。
#t = Thread.new do
#    begin
#        sleep 10000
#    ensure
#        puts "killed"
#    end
#end
#puts t  #=> #<Thread:0x0000557a06317470@thread.rb:70 run>
#sleep(5)
#puts "input-kill"
#t.kill  #=> killed
#puts t  #=> #<Thread:0x0000557a06317470@thread.rb:70 sleep>
#sleep(5)
#puts t  #=> #<Thread:0x0000557a06317470@thread.rb:70 dead>

#スレッド中の例外
#スレッドの中で例外が発生したとき、その例外をrescueで補足しなかった場合には、通常は
#そのスレッドのみが警告なしに終了される。ただしそのスレッドをjoinメソッドで待っている
#他のスレッドがあった場合には、待っているスレッドに対して同じ例外が再度発生する。
#t = Thread.new { Thread.pass; raise "Raise exception" }
#puts t
#sleep(3)
#e = Thread.new do
#    begin
#        t.join
#    rescue  => ex
#        puts ex.message
#    end
#end
#puts e

#スレッドで例外を発生させる
#t = Thread.new { sleep 1; Thread.main.raise "Error" } 
#    begin
#        sleep
#    rescue => ex
#        puts ex.message
#    end
##=> Error
#puts t   #=> #<Thread:0x000055d07966f2e8@thread.rb:102 dead>

#スレッドのデッドロック
#t = Thread.new { Thread.stop }
#Thread.stop  #=> thread.rb:113:in `stop': No live threads left. Deadlock? (fatal)

#スレッドのリスト
#puts "list"
#puts Thread.list
#puts "main"
#puts Thread.main
#puts "current"
#puts Thread.current

#スレッドの切り替え
#t = Thread.new { Thread.pass; raise "Raise exeption" } 
#puts t.status
#puts "list"
#puts Thread.list
#puts "main"
#puts Thread.main
#puts "current"
#puts Thread.current

#スレッドの終了を待つ
#t = Thread.new { Thread.pass; 10.times { |i| puts i**2; sleep 1 } }; t.join 
#puts t  #=> #<Thread:0x000055e3f4ef2f58@thread.rb:134 dead>

#スレッドの優先度
#t = Thread.new(10000) {|t| sleep t}
#puts t.priority   #=> 0
#t.priority = 1000
#puts t.priority   #=> 3

#スレッド固有のデータ
t = Thread.current
t[:foo] = "Bar"
puts t[:foo]   #=> Bar

#固有のデータがあるか確認
puts t.key?(:foo)   #=> true

#保持してる名前の一覧取得
p t.keys   #=> [:foo]
