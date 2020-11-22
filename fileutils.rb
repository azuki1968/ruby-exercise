#fileutilsは基本的なファイル操作を集めたライブラリ
#コピー、移動、削除、権限変更などファイルやディレクトリに対する操作が行える
#同様の操作はFileクラスやDirクラスでも行えるが、UNIXコマンドライクに
#呼び出せるようにし、扱いやすくしたもの。
#fileutilsの確認コード

require 'fileutils'

#ディレクトリの移動
#引数dirで指定したディレクトリへ移動し、成功したらnilを返す
#FileUtils.cd(dir, options = {})
FileUtils.cd("/tmp")

#カレントディレクトリの確認
p FileUtils.pwd  #=> "/tmp"

#ファイル・ディレクトリのコピー
#FileUtils.cp(src, dest, options = {})
#FileUtils.copy(src, dest, options = {})
#srcで指定したファイルをdestにコピーする
#copyメソッドはcpのエイリアスメソッドで、cpメソッドと同じ動きをする
p FileUtils.pwd  #=> "/tmp"

#ファイル・ディレクトリの移動
#FileUtils.mv(src, dest, options = {})
#FileUtils.move(src, dest, options = {})
#srcに指定したファイルまたはディレクトリをdestに移動する

#ファイルの削除
#FileUtils.rm(list, dest, options = {})
#FileUtils.remove(list, dest, options = {})
#listに指定したファイルを削除する

#ディレクトリの削除
#FileUtils.rmdir(list, options = {})
#listに指定したディレクトリを削除する

# rm_r / rm_rf
#FileUtils.rm_r(list, options = {})
#FileUtils.rm_rf(list, options = {})
#rmメソッドに再帰オプション「-r」で削除を行うコマンド
#listにファイル名、またはディレクトリ名を指定する

#ファイル・ディレクトリの作成

#touchメソッド
#FileUtils.touch(list, options = {})
#引数listに指定したファイルの最終変更時刻とアクセス時刻を変更する
#存在しないファイルを指定した場合が空ファイルを作成する

#mkdir / mkdir_pメソッド
#FileUtils.touch(list, options = {})
#listメソッドに指定した単一または複数の文字列でディレクトリを作成する

#ファイル・ディレクトリの権限変更
#chown / chmodメソッド
#FileUtils.chown(user, group, list, options = {})
#引数listに指定したファイルまたはディレクトリの所有権をuser,groupの所有に書き換える
#FileUtils.chmod(mode, list, options = {})
#引数listに指定したファイルまたはディレクトリのパーミッションをmodeに書き換える

#ファイル・ディレクトリのシンボリックリンクを作成する
#ln_s / symlinkメソッド
#FileUtils.ln_s(src, dest, options = {})
#FileUtils.symlink(src, dest, options = {})
#引数srcに指定したファイルまたはディレクトリのシンボリックリンクを
#引数destに指定した名前で作成する。
#ただし、destが存在するディレクトリを指定した場合は、destディレクトリ以下に
#srcという名前のシンボリックリンクを作成する。
FileUtils.symlink("/tmp/aaa", "/tmp/bbb")

