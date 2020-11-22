#YAMLの確認コード

#YAMLはXMLよりもさらに簡単な記法でデータの階層構造を表現できる。
#ハッシュ・配列の組み合わせをスペース（タブは使用不可）によるインデント
#で表現したもの。

#YAMLの読み込み
#YAML.load(io)
#YAML.load(str)
#複数のYAMLが記録されていても最初のYAMLだけ返却し、残りは無視される。
require 'yaml'

yaml_data = <<-DATA
- Red
- Green
- Blue
---
- Yellow
- Pink
- White
DATA
p YAML.load(yaml_data)   #=> ["Red", "Green", "Blue"]

#YAML.load_fileメソッドによる読み込み
#YAML.load_file(filepath)
p YAML.load_file "sample.yml"  #=> ["Red", "Green", "Blue"]

#YAML.load_file()
p YAML.load_file "sample2.yml"  #=> {"country"=>"Japan", "state"=>"Tokyo"}

#YAML.loda_stream(io)
#ioに記録された複数のYAMLデータを順番にロードし、結果をYAML::Streamの
#インスタンスで返却。
yaml_stream = YAML.load_stream(File.open "sample.yml")
p yaml_stream  #=> [["Red", "Green", "Blue"], ["Yellow", "Pink", "White"]]

#YAML.loda_documents(io){|obj|...}
#引数のioに記録された複数のYAMLデータを順番にロードし、#それぞれをブロック内で処理ができる。
#（例）個別に読み込んだYAMLデータの先頭のデータのみ返却。
YAML.load_documents(File.open "sample.yml") do |yaml|
　p yaml.first
end
#エラーとなった
#yaml.rb:40:in `<main>': undefined method `load_documents' for Psych:Module (NoMethodError)
#Did you mean?  load_stream
#=> "Red"
#=> "Yellow"

#YAMLの書き込み
#YAML.dump(obj, io = nil)  
#単一のインスタンスを文字列またはIOインスタンスに出力が可能となる。
#引数ioを省略するとyaml形式に変換した文字列を返し、ioを指定すると
#指定した出力先にyaml形式のデータを書き込む。
colors = ["Red", "Green", "Blue"]

p YAML.dump colors  #=> "---\n- Red\n- Green\n- Blue\n"

File.open("sample3.yml", "w+") do |f|
 YAML.dump(colors, f)
end
#sample3.ymlの出力結果
#---
# Red
# Green
# Blue

#YAML.dump_stream(*obj)は複数のオブジェクトを文字列に出力が可能。
colors1 = ["Red", "Green", "Blue"]
colors2 = ["Yellow", "Pink", "White"]
p YAML.dump_stream colors1,colors2  #=> "---\n- Red\n- Green\n- Blue\n---\n- Yellow\n- Pink\n- White\n"
