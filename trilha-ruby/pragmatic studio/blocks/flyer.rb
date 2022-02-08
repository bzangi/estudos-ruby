class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []

# 1.upto(5) do |n|
#   flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
# end
#

flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

puts flyers

# flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles" }
#
# total = 0
# flyers.each do |flyer|
#   total += flyer.miles_flown
# end
#
# puts "Total miles flown: #{total}"
#
promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
# promotions.each do |airline, bonus|
#   puts "Earn #{bonus}x miles by flying #{airline}!"
# end
#

flyers.each do |flyer|
  puts
  puts "#{flyer.name} could earn:"
  promotions.each do |airline, bonus|
    puts "#{flyer.miles_flown * bonus} miles by flying #{airline}"
  end
end

frequent = flyers.select { |f| f.miles_flown >= 3000 }
puts frequent

leftover = flyers.reject { |f| f.miles_flown >= 3000 }
puts leftover

puts flyers.any? { |f| f.status == :platinum }

puts flyers.find_all { |f| f.status == :bronze }

puts '----------------'

platinum_flyers, other_flyers = flyers.partition { |f| f.status == :platinum}
puts 'platinum'
puts platinum_flyers
puts 'other'
puts other_flyers

name_tags = flyers.map { |f| "#{f.name} (#{f.status.upcase})" }
puts name_tags

lufthansa_data_km = flyers.map { |f| f.miles_flown * 1.6}
p lufthansa_data_km

total_miles = flyers.map { |f| f.miles_flown }.reduce(:+)
puts total_miles

total_miles_km = lufthansa_data_km.reduce(:+)
puts total_miles_km

total_bronze_kms_flown = flyers.select { |f| f.status == :bronze }.map { |b| b.miles_flown * 1.6 }.reduce(:+)
puts total_bronze_kms_flown

top_flyer = flyers.max_by { |f| f.miles_flown }
puts top_flyer