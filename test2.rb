#!usr/bin/ruby

class Foo
    def initialize (a)  #引数aを受ける初期化メソッド
        @@a = a
    end
    def self.method1
        @@a
        p @@a
    end
end
a = Foo
a.new(5)
a.method1
