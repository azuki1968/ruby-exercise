#!usr/bin/ruby

# 抽象基底クラス（テンプレートクラス）
# method1とmethod3は具象クラス（サブクラス）によりオーバーライド
# できる（不要ならしなくてよい）。フックメソッドと呼ぶ。
#
# method2は必ず具象クラス（サブクラス）で記述したものを実行する。
#（テンプレートクラスで直接呼び出した場合は例外処理を発生させる）
#
# 帳票作成処理を例としたサンプルコード

# 抽象基底クラス（テンプレートクラス）
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

#正常処理１
#fooExt = FooExt1.new  #newメソッド実行でオブジェクトを作成
#fooExt.method1_thru_method3
#実行経路 FooExt1.initialize => FooExt1.method1 => FooExt1.method2 => FooExt1.method3 
#帳票明細処理はFooExt1（サブクラス１）で実行されるのでＯＫ

#正常処理２
#fooExt2 = FooExt2.new  #newメソッド実行でオブジェクトを作成
#fooExt2.method1_thru_method3
#実行経路 FooExt2.initialize => Foo.method1 => FooExt2.method2 => Foo.method3 
#帳票明細処理はFooExt2（サブクラス２）で実行されるのでＯＫ

#エラーとなる処理
#foo = Foo.new  #newメソッド実行でオブジェクトを作成
#foo.method1_thru_method3
#実行経路 Foo.initialize => Foo.method1 => Foo.method2 => Foo.method3 
#帳票明細処理がFoo（テンプレートクラス）で実行されるのでＮＧ
#template.rb:24:in `method2': Foo method2 このメソッドが直接実行されたのでエラーとする (RuntimeError)
