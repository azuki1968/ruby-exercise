#!usr/bin/ruby
require 'minitest/autorun'  #この記述をすることでMinitest::Testが実行される
require './minitest_1_sub'  #読み込むソースコードの指定

#assert_raises 
class TestFoo < Minitest::Test  #Minitest::Testを継承したTestFooクラス
    def test_foo1
        err = assert_raises RuntimeError do
                Foo.foo1
        end
        # エラーメッセージを検証
        assert_equal '例外エラーです', err.message
    end
end
