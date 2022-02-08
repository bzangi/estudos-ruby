puts "digite um número de 1 a 5: "
var1 = gets.chomp.to_i

if var1 > 10 then
    puts "valor maior que 10"
elsif var1 >= 5
    puts "valor entre 5 e 10"
else
    puts "valor menor que 5"
end

unless var1 > 10
    puts "o número é menor ou igual a 10"
else
    puts "o número é maior que 10"
end

puts "digite um número de 1 a 5: "
var2 = gets.chomp.to_i

while var2 < 1 || var2 >5
    puts "valor inválido"
    puts "digite um número de 1 a 5: "
    var2 = gets.chomp.to_i
end

case var2
when 1
    puts "voce escolheu 1"
when 2
    puts "voce escolheu 2"
when 3
    puts "voce escolheu 3"
when 4
    puts "voce escolheu 4"
when 5
    puts "voce escolheu 5"
end