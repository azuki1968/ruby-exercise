#!usr/bin/ruby

# Moduleクラス

#クラス変数を扱う
#クラスやモジュール、オブジェクトに別のモジュールを機能を追加#するには、
#以下のメソッドを使用する
#include
#extend
#includeの使用例
module B
    def method_b
        "method_b"
    end
end
 
class A
    include B
end
a = A.new
#a.method_b   #=> "method_b"
# BモジュールをincludeしたAクラスでは、Bで定義されたmethod_mが
# インスタンスメソッドとして呼び出される。

#extendの使用例
module D
    def method_d
        "method_d"
    end
end

class C
end
c = C.new
c.extend(D)
c.method_d  #=> "method_d"  Dモジュールをextendしたcオブジェクトでは、Dで定義されたmethod_dが機能追加される
c1 = C.new
#c1.method_d  #=> extendしていないc1オブジェクトは、NoMethodError: undefined method `method_d'となる

#インクルードしたときに実行するメソッド
#included
#extended
module F
    def self.included(object)
        p "#{object} has included #{self}"
    end
end
class E
    include F
end

e = E.new  #=> "E has included F"

#インクルードされているか調べる
#incluse?
#include modules
E.include?(F)  #=> true
E.included_modules  #=>  [F, Kernel]

#祖先クラスの取得
p E.ancestors   #=> [E, F, Object, Kernel, BasicObject]

