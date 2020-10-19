#!usr/bin/ruby

#正規表現オブジェクトの生成
#２つ目の引数にオプション指定可能
#Regexp::IGNORECASE 大文字小文字の違いを無視
#Regexp::MULTILINE  正規表現の「.」が改行にマッチするようになる
#Regexp::EXTENDED   バックスラッシュでエスケープされていない空白と#から改行までを無視する
#３つ目の引数にもオプション指定可能
Regexp.new("ABCdef")  #=> /ABCdef/
Regexp.new("ABCdef", Regexp::IGNORECASE) #=> /ABCdef/i

#正規表現オブジェクトのマッチング
reg = Regexp.new("aaabbb")  #=> reg == /aaabbb/
if reg.match("aaabbb")
    p "match ok"
else
    p "match err"
end

#正規表現オブジェクトのマッチング（２）
reg = Regexp.new("aaabbb")  #=> reg == /aaabbb/
reg =~ "aaabbb"   #=> 0（マッチした位置のインデックスが返る）
reg =~ "aabbb"    #=> nill（マッチしない場合nillが返る）

#正規表現オブジェクトのマッチング（３）
reg = Regexp.new("aaabbb")  #=> reg == /aaabbb/
reg === "aaabbb"   #=> true（マッチした場合true）
reg === "aabbb"    #=> false（マッチしない場合false）

#正規表現オブジェクトのマッチング（４）
$_ = "aaabbb" 
reg = Regexp.new("aaabbb")  #=> reg == /aaabbb/
~ reg  #=> 0（マッチした0 アンマッチは1が返る）

#正規表現の特殊文字をエスケープ
Regexp.escape("aaa.bbb(ccc)")  #=> "aaa\\.bbb\\(ccc\\)"

#マッチした結果を取得（ 特殊変数 $~ でも取得可能）
/aaabbb/ =~ "aaabbb"  #=> 0
Regexp.last_match #=> #<MatchData "aaabbb">
$~  #=> #<MatchData "aaabbb">

#マッチした結果を取得
#整数値0を与えると該当のマッチ文字列返却
#それ以降の整数ではカッコにマッチした部分文字列返却
/(abc)d(efg)/ =~ "abcdefg"  #=> 0
Regexp.last_match(0) #=> "abcdefg"
Regexp.last_match(1) #=> "abc"
Regexp.last_match(2) #=> "efg"

#正規表現の論理和を求める
a = Regexp.new("abc")
b = Regexp.new("ABC")
c = Regexp.union(a,b)  #=> /(?-mix:abc)|(?-mix:ABC)/

#正規表現オブジェクトの属性取得
#設定されているRegexp::IGNORECASE Regexp::EXTENDED Regexp::MULTILINEの論理和を返却
a = Regexp.new("ABCdef", Regexp::IGNORECASE) #=> /ABCdef/i
a.options  #=> 1
a = Regexp.new("ABCdef", Regexp::EXTENDED) #=> /ABCdef/x
a.options  #=> 2
a = Regexp.new("ABCdef", Regexp::MULTILINE) #=> /ABCdef/m
a.options  #=> 4
a = Regexp.new("ABCdef", Regexp::MULTILINE | Regexp::IGNORECASE) #=> /ABCdef/mi
a.options  #=> 5
a.options & Regexp::EXTENDED  # => 0

#正規表現オブジェクトの属性取得（２）Regexp::IGNORECASEが設定されているか返却
a = Regexp.new("ABC")
a.casefold?  #=> false
a = Regexp.new("ABCdef", Regexp::IGNORECASE)
a.casefold?  #=> true

#正規表現オブジェクトの属性取得（３） Encodingオブジェクトを返却
a = Regexp.new("ルビー")
a.encoding  #=> #<Encoding:UTF-8>
a = Regexp.new("ルビー".encode("EUC-JP"))
a.encoding  #=> #<Encoding:EUC-JP>

#正規表現オブジェクトの属性取得（３） 正規表現の元となった文字列を返却
a = Regexp.new("ABCdef", Regexp::IGNORECASE)  #=> /ABCdef/i
a.source  #=> "ABCdef"
