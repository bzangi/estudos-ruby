v1 = 34
v2 = 56
v3 = 2
v4 = 7

if (v1 > v2) && (v3 < v4) # && and
    puts "Condição atendida nos dois casos"    
elsif  (v1 < v2) || (v3 < v4) # || or
    puts "Condição atendida em um dos casos"
else
    puts "condição nunca atendida"
end

if !(v3 > v4) # ! not
    puts "Negação atendida"
else
    puts "Negação não atendida"
end