#!usr/bin/ruby

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
p foo1.method1
p foo2.method1