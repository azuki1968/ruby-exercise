#!usr/bin/ruby

class Foo
    def self.foo1
        #raise 発生させたい例外のクラス, "エラーメッセージ"
        raise RuntimeError, "例外エラーです"
    end
end
