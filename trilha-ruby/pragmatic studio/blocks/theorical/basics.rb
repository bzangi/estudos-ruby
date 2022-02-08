# 1.upto(5) do |n|
#   puts "\n#{n} situp"
#   puts "#{n} pushup"
#   puts "#{n} chinup"
# end
#
# 3.times { |n| puts "#{n} Echo!" }
#
# 1.upto(3) { |n| puts "#{n} Echo!"}
#
# 1.step(9, 2) do |n|
#   puts "\n#{n} situp"
#   puts "#{n} pushup"
#   puts "#{n} chinup"
# end

name = 'Bruno'
number = 100
temp = Math::PI / 4

3.times do |number; temp |
  #depois do ';' as variáveis nao sao consideradas parametros do bloco,
  # elas têm apenas seus nomes protegidos para que possam ser utilizadas sem alterar seu valor fora do bloco
  name = 'Moe'
  temp = 34.5
  puts "#{number} Howdy, #{name} is #{temp} degrees"
end

puts name #variavel acessada dentro do bloco e alterada
puts number #parametros de blocos nao sao compartilhados com variáveis de mesmo nome num escopo maior
puts temp #variavel sendo utilizada localmente no bloco sem alterar seu valor global