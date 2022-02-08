require_relative 'my_enumerable'
class Playlist
  # include Enumerable
  include MyEnumerable

  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |s| yield s }
  end

  def play_songs
    each {|s| s.play}
  end

  def each_by_artist(artist)
    my_select { |s| s.artist =~ artist }.each { |s| yield s }
  end
end

