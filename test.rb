#!usr/bin/ruby

p "a-1"
class Foo
    p "b-1"
    def initialize (a)  #引数aを受ける初期化メソッド
        p "b-2"
        @a = a  #@aはインスタンス変数
    end
    def method1
        p "b-3"
        @a
    end
end
p "c-1"
foo1 = Foo.new(1)   #newメソッド実行でオブジェクトを作成
p "c-2"
foo2 = Foo.new(2)   #newメソッド実行でオブジェクトを作成
p "c-3"
p foo1.method1
p "c-4"
p foo2.method1
