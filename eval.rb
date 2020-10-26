#!usr/bin/ruby

#Moduleクラス

#evalメソッド
Array.class_eval do
    def foo
        'bar'
    end
    def foo2
        'bar2'
    end
end
[].foo   #=> "bar"
[].foo2  #=> "bar2"

#evalメソッド
a = nil
eval('a = RUBY_VERSION')
a  #=> "2.5.1"