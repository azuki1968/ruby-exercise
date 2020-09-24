#!usr/bin/ruby
require 'test/unit'  #この記述をすることでTest::Unit::TestCaseが実行される
require './testunit_sub'  #読み込むソースコードの指定

#Fooクラスをインスタンスメソッドで実行した結果をassert_equalで判定
#assert_equal（期待値）,（実際の値）
class TestFoo < Test::Unit::TestCase  #Test::Unit::TestCaseを継承したTestFooクラス
    def setup    #setupメソッドはテストメソッド実行前に毎回呼ばれる
        @obj = Foo.new
    end
    #def teardown   #teardownメソッドはテスト実行後に毎回呼ばれる
    #end
    def test_foo
        assert_equal 'foo',@obj.foo
    end
    def test_foo2
        assert_equal 'foo2',@obj.foo2
    end
end
