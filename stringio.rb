#StringIOの確認コード

##インスタンスの作成
puts StringIO.new(string = '', mode = 'r+')
puts StringIO.open(string = '', mode = 'r+')
#第一引数のstringには文字列を指定します。
#第一引数を省略すると空文字列を指定したものとしてStringIOインスタンスを生成します。
#第二引数のモードは読み書きに関するオプションを指定します。（バッファのポインタ位置も指定できる）
#上記'r+'は読み書きモードでポインタはバッファの先頭を示す。

#空文字列によるStringIOインスタンスを生成
sio = StringIO.new
puts sio

#openメソッドによるStringIOインスタンスを生成
#openメソッドはブロック内で直接StringIOインスタンスが操作可能。
#openメソッドの戻り値は、ブロックを使用しない場合はStringIOクラスの
#インスタンスが返るが、ブロックを使用するとブロック内の評価結果が返る。
sio = StringIO.open "Hello StringIO"
p sio  #=> #<StringIO:0x0000557d22160fe0> StringIOクラスのインスタンス

sio = StringIO.open "Hello StringIO" do |io|
    p io.read   #=> "Hello StringIO"
end
p sio  #=> 教本ではnilとあるが、実際は"Hello StringIO"が返る。

##バッファへ書き込むメソッド

#代表的なメソッドにはputc,puts,print,printfが用意されている。
#putc(ch)は１文字だけバッファに書き込むメソッド。
#引数に２文字以上の文字列を与えた場合は、先頭の１文字のみをバッファに
#書き込み、残りは無視される。
sio = StringIO.new
sio.putc "abc"
sio.string  #=> "a"
#putsメソッドは引数に与えた文字列に改行を付加してバッファに書き込むメソッド。
#引数を省略すると改行のみをバッファに書き込む。
#複数の文字列が与えられたら、それぞれの文字列に対して改行を付加してバッファに書き込む。
sio = StringIO.new
sio.puts "abc"
sio.string   #=> "abc\n"

sio.string = ""
sio.puts "abc", "def", "ghi"
sio.string   #=> "abc\ndef\nghi\n"

#putsメソッドに配列を渡した場合は、配列それぞれの値がバッファに書き込まれる。
sio.string = ""
sio.puts ["abc", "def", "ghi"]
sio.string   #=> "abc\ndef\nghi\n"

#putsメソッドにnilを渡した場合は、改行のみがバッファに書き込まれる。
sio.string = ""
sio.puts nil
sio.string   #=> "\n"

#printメソッドはputsメソッドと異なり、末尾に改行を付加しない。
sio.string = ""
sio.print "abc", "def", "ghi"
sio.string   #=> "abcdefghi"

##バッファから読み込むメソッド

#readメソッドは、バッファ内のポインタが現在示している位置から引数に
#指定した文字数分、文字を取り出す。文字数分取り出す前に終端になった
#場合は終端までの文字列を取り出す。
#既にポインタが文字列の終端を示している場合はnilを返却。
sio = StringIO.new
sio.string = "Hello World"
p sio.read 5   #=> "Hello"
#引数のintegerを省略すると、ポインタが現在示している位置から終端
#までの文字を取り出す。
p sio.read     #=> " World" この時点でポインタは終端
#既にポインタが文字列の終端を示している場合はnilを返却。
p sio.read 1   #=> nil
#ポインタが文字列の終端を指しているときに引数を省略すると、nilではなく
#空文字列""が返る。
p sio.read     #=> ""
#第２引数に変数が指定されている場合は、その変数に文字列を格納する。
sio.pos = 0
output = ""
sio.read 5, output
p output   #=> "Hello"

#getcメソッドはバッファから１文字読み込み、Stringオブジェクトで返却する。
#ポインタが文字列の終端を指している場合はnilを返却。
sio = StringIO.new
sio.string = "Hello World"
p sio.getc     #=> "H"
#ポインタを終端に移動
sio.pos = sio.string.length
sio.getc       #=> nil
#readcharの場合はEOFErrorが発生する。
#sio.readchar   #=> end of file reached (EOFError)

#getsメソッド、readlineメソッドは１行単位で読み込み、文字列を返却する。
#ポインタが文字列の終端を指している場合getsメソッドはnilを返却し、
#readlineメソッドはEOFErrorが発生する。
sio = StringIO.new
sio.string = "Hello World"
sio.gets         #=> "Hello World"
#p sio.readline  #=> end of file reached (EOFError)

#ポインタを移動するメソッド
#pos=(n)
#seek
#pos=メソッドは、ポインタの指し示す場所を変更するメソッド。先頭を0とした
#絶対値を指定します。
#seekメソッドは、whenceで指定したオプションを基準とした相対値をoffsetに
#指定します。whenceを省略した場合は、IO::SEEK::SETが使用される。
#IO::SEEK_SET　ファイルの先頭から
#IO::SEEK_CUR　現在のファイルポインタから
#IO::SEEK_END　ファイルのから末尾から
sio = StringIO.new
sio.string = "ABCDEF"
sio.pos = 3
p sio.readline    #=> "DEF"

sio.seek -2, IO::SEEK_END  #ポインタは末尾から -2 文字目の場所を指す
p sio.readline    #=> "EF"
