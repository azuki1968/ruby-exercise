#!usr/bin/ruby

p "a-1"
class Foo
    def self.class_name
        self.name
    end
    p "b-1"
    def initialize (a)  #引数aを受ける初期化メソッド
        p "b-2"
        @@a = a  #@aはインスタンス変数
    end
    def self.method1
        p "b-3"
        @@a
        p @@a
    end
end
a = Foo
a.new(5)
p a.class_name
a.method1
