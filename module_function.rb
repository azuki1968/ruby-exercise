#!usr/bin/ruby

# Moduleクラス

#モジュール関数にする module_function
module A
    def method_a
        puts "aaaa"
    end
    module_function :method_a
end

A.method_a   #=> aaaa
