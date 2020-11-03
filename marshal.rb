#!usr/bin/ruby

#Marshalモジュール
#Rubyのオブジェクトを文字列化し、ファイルに書き出したり読み戻したりが可能
#文字列化したデータを「マーシャルデータ」と呼ぶ
#Railsのセッション変数をクッキーやデータベースに登録するときに利用される


#Rybyオブジェクトを文字列化（１）
Marshal.dump({:a => 1, :b => 3, :c => 5})

#Rybyオブジェクトを文字列化（２）
#２つ目の引数にIOクラスかそのサブクラスのオブジェクト指定で、そのオブジェクトの
#対象に直接書き出す
file = File.open("/tmp/marshaldata", "w+")
Marshal.dump({:a => 1, :b => 3, :c => 5}, file)

#Rybyオブジェクトの復元（１）
str = Marshal.dump({:a => 1, :b => 3, :c => 5})
Marshal.load(str)   #=> {:a=>1, :b=>3, :c=>5}

#Rybyオブジェクトの復元（２）
#２つ目の引数にIOクラスかそのサブクラスのオブジェクト指定で、そのオブジェクトから
#直接読み出して復元する
file = File.open("/tmp/marshaldata", "w+")
Marshal.dump({:a => 1, :b => 3, :c => 5}, file)
Marshal.load(str)　 #=> {:a=>1, :b=>3, :c=>5}

