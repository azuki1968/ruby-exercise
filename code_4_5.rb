#!usr/bin/ruby

class Foo
    def initialize (a)  #引数aを受ける初期化メソッド
        @a = a  #@aはインスタンス変数
    end
    def method1
        @a
    end
end
class FooExt < Foo
    def initialize (a,b)  #引数a,bを受ける初期化メソッド
        @b = b  #@bはインスタンス変数
        super a   # a=> 3 ,@a=>3
    end
    def method2(c)
        @a + @b + c
    end
end
fooExt = FooExt.new(3, 4)   #newメソッド実行でオブジェクトを作成
p fooExt.method1     #=> 3
p fooExt.method2(5)  #=> 12
p FooExt.superclass == Foo 