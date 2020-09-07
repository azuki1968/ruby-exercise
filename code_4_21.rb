#!usr/bin/ruby
#特異クラス
class Foo
    def initialize (a)  #引数aを受ける初期化メソッド
        @a = a  #@aはインスタンス変数
    end
    def method1
        @a
    end
end
foo1 = Foo.new(1)   #newメソッド実行でオブジェクトを作成
foo2 = Foo.new(2)   #newメソッド実行でオブジェクトを作成
def foo1.methodB
    @a + 100
end
p foo1.methodB #=> 101
#p foo2.methodB #=> NoMethodError
p foo2.method1 #=> 2
