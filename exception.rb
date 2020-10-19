#!usr/bin/ruby

#Exceptionクラスは全ての例外のスーパークラス

#例外クラスの自作
p class MyError < RuntimeError; end  #=> nill
begin
  raise MyError
rescue => ex
  p ex  #=> #<MyError: MyError>
end

#エラーメッセージを指定する
p class MyError < RuntimeError; end  #=> nill
begin
  raise MyError.exception('エラーが発生しました。')
rescue => ex
  p ex  #=> #<MyError: エラーが発生しました。>
  p ex.message  #=> "エラーが発生しました。"
  p ex.backtrace #=> ["exception.rb:16:in `<main>'"]  バックトレース情報が配列で返却
  ex.set_backtrace("This is new backtrace.")  #=> バックトレース情報にオリジナル情報を設定（上書き）
  p ex.backtrace #=> ["This is new backtrace."]
end
