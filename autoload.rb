#!usr/bin/ruby

# Moduleクラス

#autoload
#autoload?
class A
    autoload(:B, "/home/orca/autoload_1.rb")
    p autoload?(:B)  #=>  "/home/orca/autoload_1.rb"（未ロードの為、パス名を返却）
    include B
    p autoload?(:B)  #=> nill （ロードされてるのでnillを返却）
end

a = A.new
a.method_b  #=> bbb
