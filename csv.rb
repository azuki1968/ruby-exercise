#CSVの確認コード

require 'csv'

#CSV.openによるCSVデータの読み込み
CSV.open("sample.csv") do |csv|
    csv.each do |row|
        p row
    end
end
#実行結果
#["abc", "def", "ghi", "jkl"]
#["123", "456", "789", "10"]

#CSV.openによるCSVデータの書き込み
CSV.open("sample_write.csv", "w") do |row|
    row << ["abc", "def", "ghi", "jkl"]
    row << ["123", "456", "789", "10"]
end
#sample_write.csv書き込み結果
#abc,def,ghi,jkl
#123,456,789,10

#読み込みのみ可能なメソッド
#csv.foreach

#csv.read  読み込み結果を配列の配列に返却
p CSV.read("sample.csv") #=> [["abc", "def", "ghi", "jkl"], ["123", "456", "789", "10"]]
#csv.readlines  読み込み結果を配列の配列に返却
p CSV.readlines("sample.csv") #=> [["abc", "def", "ghi", "jkl"], ["123", "456", "789", "10"]]

#オプションに{headers: true}を渡した場合
csv_table = CSV.read("sample.csv", headers: true) #=> [["abc", "def", "ghi", "jkl"], ["123", "456", "789", "10"]]
p csv_table
#<CSV::Table mode:col_or_row row_count:2>
p csv_table.to_a
#[["abc", "def", "ghi", "jkl"], ["123", "456", "789", "10"]]
