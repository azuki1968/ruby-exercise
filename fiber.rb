#!usr/bin/ruby

#Fiberクラス
#軽量スレッドであるファイバーを提供するクラス（他の言語ではコルーチンやサブコルーチンと呼ぶ）
#明示的に切り替えない限りコンテキストが切り替わらない
#親子関係をもつ

#実行例
fiber = Fiber.new do #Fiberインスタンスの作成。
    p 'Hello' 
    Fiber.yield #=> （２）処理を停止し親ファイバーに戻る。
    p 'Hello2'
 end
  
fiber.resume   #=> "Hello"  #（１）ブロック内のFiber.yieldまでを実行
p 'Hello3'     #=> "Hello3" #（３）ブロック内の処理がFiber.yieldによって停止されたのでメインの処理を継続して実行。
fiber.resume   #=> "Hello2" #（４）再びFiber#resumeが実行されたので前回処理を停止した位置から処理を再開する。
fiber.resume   #=> fiber.rb:18:in `resume': dead fiber called (FiberError)

#（１）ファイバーの持つブロックの実行。（子ファイバー）
#（２）処理を停止し親ファイバーに戻る。（子ファイバーから親ファイバーに切り替え）
#（３）ブロック内の処理がFiber.yieldによって停止されたのでメインの処理を継続して実行。（親ファイバー）
#（４）再びFiber#resumeが実行されたので前回処理を停止した位置から処理を再開する。（子ファイバー）
#（５）fiberをresumeできるのは「yieldの数+1回」であり、さらにresumeしようとするとFiberErrorが発生する。