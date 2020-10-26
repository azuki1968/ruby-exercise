#!usr/bin/ruby

# Moduleクラス

#定数の一覧取得(1)
Module.constants  #=> [:NotImplementedError, :NameError, :NoMethodError, :RuntimeError,以下略]

#定数の一覧取得(2)
class Myclass
    FOO = 1
end
Myclass.constants   #=> [:FOO]

#定数が定義されているか調べる
Object.const_defined?(:ENV)   #=> true
Object.const_defined?(:ENVIROMENT)   #=> false

#定数の値を取り出す
Object.const_get(:RUBY_VERSION)  #=> "2.5.1"

#定数を設定する
#Object.const_set(:MY_CONST, 'myconst')
#Object::MY_CONST      #=> "myconst"
#Object::RUBY_VERSION  #=> "2.5.1"

#定数を取り除く
#class Myclass
#    MYCONST = 1
#    remove_const(:MYCONST)
#    MYCONST   #=> uninitialized constant Myclass::MYCONST (NameError)
#end

#メソッドの一覧
Array.instance_methods  #=> [:to_h, :include?, :at, :fetch, :last,以下略]

#メソッドの可視性の変更
#public => どこからでもアクセス可能
#protected => クラス内、同一パッケージ、サブクラスからアクセス可
#private => クラス内のみアクセス可能
class MyClass
    private
    def foo
        puts 'FOO'
    end
    public :foo  #=> この処理を書かない場合、NoMethodErrorとなる
end
my_class = MyClass.new
my_class.foo  #=> FOO  nill

#インスタンス属性について
#エラーとなる例
##class Person   
#    def initialize name
#      @name = name
#    end
#    def say
#       puts "私の名前は" + @name + "です"
#    end
#end
#person = Person.new "taro"
#person.name = "hanako" #インスタンス変数の値を更新しようとするとエラー  undefined method `name='
#person.say

#インスタンス属性としてインスタンス変数を設定してみる
#attr_accessor 読み取りと書き込みメソッド
#attr_reader   読み込みメソッド
#attr_writer   書き込みメソッド
#を記述することでクラス外からインスタンス変数を変更できるようになる
class Person
    attr_accessor :name   
    def initialize name
      @name = name
    end
    def say
       puts "私の名前は" + @name + "です"
    end
end
person = Person.new "jiro"
person.name = "hanako" 
person.say  #=> 私の名前はhanakoです

#attr_****を使用しない書き方
#-----------------------------------------------------------------------------------
#class Person   
#    def name
#      @name
#    end
#    def name=(name)
#        @name = name
#    end
#    def say
#        puts "私の名前は" + @name + "です"
#    end
#end
#person = Person.new
#person.name = "hanako"
#person.say  #=> 私の名前はhanakoです
#----------------------------------------------------------------------------------

#メソッドの別名を定義
#alias_method 新メソッド名, 旧メソッド名
class MyClass
    def foo
        p 'foo'
    end
    alias_method :original_foo, :foo
    def foo
        p 'bar ' + original_foo
    end
end
m = MyClass.new
m.foo
