#!usr/bin/ruby
#インスタンス変数
@v1 = 1
class Aaa
    @v2 = 2
    def method1
        @v1
    end
    def method2
        @v2
    end
    attr_accessor :v3  #アクセッサ(getterとsetterメソッド)を生成
    def method3
        @v3
    end
end
p Aaa.new.method1  #=>"nill
p Aaa.new.method2  #=>"nill
aaa = Aaa.new
aaa.v3  = 5
p aaa.v3           #=>5
p aaa.method3      #=>5
