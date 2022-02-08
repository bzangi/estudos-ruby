require_relative 'playlist'
class Songs
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_file_name
    basename = "#{name}-#{artist}".gsub(" ", "-").downcase
    extensions = %w[.mp3 .wav .aac]
    extensions.each { |ext| yield basename + ext }
  end

  def to_s
    "#{name} - #{artist}"
  end
end

song1 = Songs.new('Roct Pot 02', 'Gordão do PC', 1.75)
song2 = Songs.new('Trazendo lucro pro chefe', 'MC Saci', 3)
song3 = Songs.new('Me sinto abençoado', 'MC Poze do Rodo', 3.5)
song4 = Songs.new('Vida Louca', 'MC Poze do Rodo', 3)

playlist = Playlist.new('Elegância')
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)
playlist.add_song(song4)
playlist.play_songs

poze_songs = playlist.my_reject { |s| s.artist =~ /Poze/ }
puts poze_songs

puts poze_songs.map { |s| s.duration }.reduce(:+)

puts playlist.my_detect {|s| s.artist.upcase == 'Gordão do PC'.upcase}

puts

playlist.each{|s| puts s}

playlist.each_by_artist(/Poze/) {|s| s.play}

playlist.each { |song| song.each_file_name { |filename| puts filename }}