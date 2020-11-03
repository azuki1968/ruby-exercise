#!usr/bin/ruby

#Comparableモジュール
#Comparableモジュールをインクルードすると、インクルードしたクラスで比較演算子である<=>
#インクルードしたクラスで利用できるメソッドは以下（；返り値）
# <   :負の整数
# <=  :負の整数かゼロ
# ==  :ゼロ
# >   :正の整数
# >=  :正の整数かゼロ
# between?
#
class Sample

    include Comparable

    def initialize(value)
        @value = value
    end

    def value
        @value
    end

    def <=> (other)
        other.value <=> self.value
    end
end

a = Sample.new(10)
b = Sample.new(5)
a < b    #=>  true   （Comparableをインクルードしていないとundefined method `<'）
a <= b   #=>  true   
a == b   #=>  false 
