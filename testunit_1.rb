#!usr/bin/ruby
require 'test/unit'  #この記述をすることでTest::Unit::TestCaseが実行される

class Sample      #Sampleクラスにクラスメソッドを定義
    def self.greeting
        'Hello, world'
    end
    def self.greeting2
        'Hello, world2'
    end
end

class Sample2      #Sample2クラスにクラスメソッドを定義
    def self.greeting3
        'Hello, world3'
    end
end

#Sampleクラスをレシーバーとして呼び出した結果をassert_equalで判定
#assert_equal（期待値）,（実際の値）
class TestSample < Test::Unit::TestCase  #Test::Unit::TestCaseを継承したTestSampleクラス
    def test_greeting  #test_xxxと記述することでこのメソッドがテスト対象となる
        assert_equal 'Hello, world',Sample.greeting
    end
    def test_greeting2  #test_xxxと記述することでこのメソッドがテスト対象となる
        assert_equal 'Hello, world2',Sample.greeting2
    end
    def test_greeting3  #test_xxxと記述することでこのメソッドがテスト対象となる
        assert_equal 'Hello, world3',Sample2.greeting3
    end
end
