include("./cardpile.jl")
using Dates

cp = CardPile(5)
start = now()

for i in 1:100000
    cp.shuffle()
    cp.refresh()
end

println(cp.print())
println((now()-start).value/1000)

println()