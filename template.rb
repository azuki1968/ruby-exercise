#!usr/bin/ruby

# 抽象基底クラス（テンプレートクラス）
# method1とmethod3は具象クラス（サブクラス）によりオーバーライド
# できる（不要ならしなくてよい）。フックメソッドと呼ぶ。
#
# method2は必ず具象クラス（サブクラス）で記述したものを実行する。
#（テンプレートクラスで直接呼び出した場合は例外処理を発生させる）
#
# 帳票作成処理を例としたサンプルコード
class Foo
    def initialize
    end
    def method1_thru_method3
        method1
        method2
        method3
    end
    def method1 #帳票ヘッダー処理（テンプレート）
    end
    def method2 #帳票明細処理（テンプレート） 
        raise "Foo method2 このメソッドが直接実行されたのでエラーとする"
    end
    def method3 #帳票フッター処理（テンプレート）
    end
end

# 具象サブクラス１
class FooExt1 < Foo
    def initialize
    end
    def method1 # 帳票ヘッダー処理（サブクラス１）
    end
    def method2 #帳票明細処理（サブクラス１）
    end
    def method3 #帳票フッター処理（サブクラス１）
    end
end

# 具象サブクラス２
class FooExt2 < Foo
    def method2 #帳票明細処理（サブクラス2）
    end
end
fooExt = FooExt1.new  #newメソッド実行でオブジェクトを作成
fooExt.method1_thru_method3
#fooExt2 = FooExt2.new  #newメソッド実行でオブジェクトを作成
#fooExt2.method1_thru_method3
#foo = Foo.new  #newメソッド実行でオブジェクトを作成
#foo.method1_thru_method3
