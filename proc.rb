#!usr/bin/ruby

#Procクラス
#Procはブロックとして記述された手続きを持ち運ぶためのクラス
#Procは小さなプログラムを持ち運ぶためのクラス。クラスにするまでもない小さな手続きをProcとして持ち運ぶというのが主な利用方法
#Proc.newメソッドにブロックを与えると、そのブロックを保持するProcオブジェクトが作成される
#手続きオブジェクトを扱うクラス
#名前の無い関数のように使用可能
#使用時はcallメソッドを使う

#手続きオブジェクト
f = Proc.new{puts 'OK'}
f.call  #=> OK

#実行例
#sayhelloという名前で、受け取った引数をputsで表示する「手続き」を持つオブジェクトが作成される。
#sayhelloという名前の、Procオブジェクトにある手続きをcallで呼び出す。（この時に引数を受け取る）
sayhello = Proc.new do |name|
	puts "Hello! #{name}"
end
sayhello.call("hiroyuki")   #=>  Hello! hiroyuki

#引数の数の取得
f = Proc.new{|str| puts str}
f.arity   #=> 1 引数の数の取得（arityメソッド）
f.call('NG')  #=> NG

#実行時のコンテキスト
#スコープ（現在使える変数）
#コンテキスト（現在のselfは何か）
i = 30
j = 40
f = Proc.new{puts i + j}
f.call  #=> 70
i = 100
f.call  #=> 140

#ブロック付きメソッドの引数として使用
f = Proc.new{|i| puts i}
3.times(&f)    #=> 0,1,2,3 変数名の前に&を書くことでブロック付きメソッドに手続きオブジェクトを渡せる

#手続きオブジェクトの中で処理の中断
f = Proc.new{
    next "next"   #=> オブジェクト内で処理を中断して呼び出し元へ値を戻すにはnextと記述
    puts "last"
    }
f.call  #=> "next"

#Proc.new以外の手続きオブジェクト生成
#lambdaメソッドやprocメソッドが使用可能だが、これらのメソッドで生成した
#手続きオブジェクトは数が異なると引数のArgumentErrorが発生するが、
#Proc.newで生成した手続きオブジェクトは引数の多重代入になるのでエラーとならない
f = Proc.new{|a, b, c| p a, b, c}
f.call(1, 9)  #=> [1, 9, nill]  エラーにならない
#g = lambda{|a, b, c| p a, b, c}
#g.call(1, 9)  #=>  エラーとなる wrong number of arguments (given 2, expected 3) (ArgumentError)

#手続きオブジェクトの中でのジャンプ構文
#オブジェクトの中でのジャンプ構文returnとbreakの挙動が異なる

#lambdaメソッドではbreakを使うとその手続きオブジェクトを抜けるが、
#Proc.newやprocメソッドで生成した手続きオブジェクトではLocalJumpErrorが発生する
f = lambda{ break }
f.call  #=> エラーにならない
#g = Proc.new{ break }
#g.call  #=> エラーになる  break from proc-closure (LocalJumpError)

#lambdaメソッドではreturnを使うとその手続きオブジェクトを抜けるが、
#Proc.newやprocメソッドで生成した手続きオブジェクトではその手続きオブジェクトの
#外側を抜けようとするため、メソッドやブロックの外側でLocalJumpErrorが発生する
f = lambda{ return }
f.call  #=> エラーにならない
#g = Proc.new{ return }
#g.call  #=> エラーになる  break from proc-closure (LocalJumpError)
#
#
#            return                       next                        break
#Proc.new    メソッドを抜ける             手続きオブジェクトを抜ける  例外が発生する
#proc        メソッドを抜ける             手続きオブジェクトを抜ける  例外が発生する
#lambda      手続きオブジェクトを抜ける   手続きオブジェクトを抜ける  手続きオブジェクトを抜ける

