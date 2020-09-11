#!usr/bin/ruby

p "a-1"
class Foo
    p "b-1"
    def initialize (a)  #引数aを受ける初期化メソッド
        p "b-2"
        @@a = a  #@aはクラス変数
    end
    def self.method1
        p "b-3"
        @@a
        p @@a
    end
end
a = Foo
a.new(5)
b = Foo
b.new(7)
a.method1
p a.object_id
b.method1
p b.object_id
