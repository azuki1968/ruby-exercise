#!usr/bin/ruby

def bar(a:, b: 100, **z)
    p z       #{c:=>100, :d=>200, :e=>50}
    p z[:e]   #=> 50
    aaa = z[:e]
    m = a + b + aaa   
    p m
end

bar(a: 2,c: 100,d: 200,e: 50)  #=> 152
