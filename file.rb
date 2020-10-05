#!usr/bin/ruby

file = File.open("/home/orca/ddd/ddd.txt")
puts file.read
file.close

#ブロックで開いてるので自動的にクローズされる
File.open("/home/orca/ddd/ddd.txt"){|file| puts file.read} 

#ファイルの書き込み（２番目の引数がモード指定）
#"r"指定で読み込みモード
#"w"指定で書き込みモード。既存ファイルの中身は空になる。
#"a"指定で追記モード
#"r+"指定で読み書きモード。ファイルの読み書き位置が先頭になる。
#"w+"指定で読み書きモード。r+と同じだが、既存ファイルの中身は空になる。
#"a+"指定で読み書きモード。ファイルの読み込み位置は先頭、書き込み位置は常に末尾になる。
File.open("/home/orca/ddd/ddd.txt","a"){|file| file.write "d"} 

#puts File.basename("/home/orca/ddd/")  #ファイル名の取得 =>ddd
#puts File.dirname("/home/orca/ddd/")  #パスからディレクトリ名の取得 =>/home/orca
#puts File.extname("/home/orca/ddd/ddd.txt")  #パスから拡張子の取得 => .txt
#puts File.split("/home/orca/ddd/")  #パスからディレクトリ名とファイル名の配列を取得 => /home/orca ddd
#puts File.stat("/home/orca/ddd/")  #パスからファイル属性を示すオブジェクトを返す =>#<File::Stat:0x000056214c063e98>
puts File.atime("/home/orca/ddd/ddd.txt")  #ファイルの最終アクセス時刻取得 => 2020-10-03 14:59:50 +0900
puts File.ctime("/home/orca/ddd/ddd.txt")  #ファイルの状態が変更された時刻取得
puts File.mtime("/home/orca/ddd/ddd.txt")  #ファイルの最終更新時刻取得

puts File.exist?("/home/orca/ddd/ddd.txt")  #指定したパスの存在確認 => true
puts File.file?("/home/orca/ddd/ddd.txt")  #指定したパスがファイルか確認 => true
puts File.directory?("/home/orca/ddd/ddd.txt")  #指定したパスがディレクトリか確認 => false
puts File.symlink?("/home/orca/ddd/ddd.txt")  #指定したパスがシンボリックリンクか確認 => false

puts File.executable?("/home/orca/ddd/ddd.txt")  #ファイルが実行可能か確認 => false
puts File.readable?("/home/orca/ddd/ddd.txt")  #ファイルが読み取り可能か確認 => true
puts File.writable?("/home/orca/ddd/ddd.txt")  #ファイルが書き込み可能か確認 => true

puts File.size("/home/orca/ddd/ddd.txt")  #ファイルのサイズ確認 

#File.delete("/home/orca/ddd/eee.txt")  #ファイル削除
#File.truncate("/home/orca/ddd/eee.txt",2)  #ファイルを指定したバイト数(2)に切り詰める
File.rename("/home/orca/ddd/eee.txt","/home/orca/ddd/fff.txt")  #ファイルのリネーム
