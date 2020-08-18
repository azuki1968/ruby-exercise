#!usr/bin/ruby

p "a"
class Foo
    p "b"
    def initialize (a)
        p "c"
        @a = a
    end
    def method1
        p "d"
        @a
    end
end
p "e"
foo1 = Foo.new(1)
p "f"
foo2 = Foo.new(2)
p "g"
p foo1.method1
p "h"
p foo2.method1