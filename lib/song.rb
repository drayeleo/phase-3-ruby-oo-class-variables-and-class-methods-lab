require "pry"

class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@artists = []
  @@genres = []

  def initialize name, artist, genre
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@artists << self.artist
    @@genres << self.genre
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    unique_genres = self.genres
    genre_counts = {}
    self.genres.each { |genre_of_interest|
      genre_counts[genre_of_interest] = @@genres.filter {|genre| genre == genre_of_interest}.length
    }
    genre_counts
  end

  def self.artist_count
    unique_artists = self.artists
    artist_counts = {}
    self.artists.each { |artist_of_interest|
      artist_counts[artist_of_interest] = @@artists.filter {|artist| artist == artist_of_interest}.length
    }
    artist_counts
  end
end

help = Song.new("Help!", "The Beatles", "Pop") 

puts "Song.genre_count: ", Song.genre_count