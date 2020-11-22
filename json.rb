#JSONの確認コード

#JSONのサンプル
#配列 ["Red", "Green", "Blue"]のJSON表現
#["Red", "Green", "Blue"]
#ハッシュ {"country" => "Japan", "state" => "Tokyo"}
#{"country": "Japan", "state": "Tokyo"}


#JSONの読み込み
#JSON.load(source, proc = nil)
require 'json'

json = <<-DATA
["Red", "Green", "Blue"]
DATA
p JSON.load(json)   #=> ["Red", "Green", "Blue"]

#文字列からJSONの読み込み
p JSON.load(File.open("data.json"))  #=> ["Red", "Green", "Blue"]

#JSONの書き込み
#JSON.dump(obj, io = nil, limit = nil)
#objに書き出したい対象のオブジェクトを指定する。
array = ["Red", "Green", "Blue"]
p JSON.dump(array)   #=> "[\"Red\",\"Green\",\"Blue\"]"

#オブジェクトをJSON形式に変換し、ファイルに出力する
array = ["Red", "Green", "Blue"]
File.open("dump.json",  "w") do |f|
    JSON.dump(array, f)
end
#dump.jsonファイルの記録内容  => ["Red","Green","Blue"]