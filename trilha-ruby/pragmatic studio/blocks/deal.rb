def deal(n=0)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  if block_given?
    n.times do
      random_face = faces.sample
      random_suit = suits.sample
      result = yield(random_face, random_suit) #captura o retorno do block
      puts "You scored a #{result}!"
    end
  else
    puts "No deal"
  end
end

deal(3) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

deal