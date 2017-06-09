require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@artists = []
  @@genres = []
  @@songs = {} #{'song' => {artist: 'artist_name', genre: 'genre_name'}

  def initialize(name, artist, genre)

    self.name = name
    self.artist = artist
    self.genre = genre

    @@count += 1
    @@artists << artist
    @@genres << genre
    @@songs[name] = {artist: artist, genre: genre}

  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.count
    @@count
  end

  def self.genre_count
    genre_count = {}
    @@songs.each do |song, artist_genre|
      if genre_count.keys.include? artist_genre[:genre]
        genre_count[artist_genre[:genre]] += 1
      else
        genre_count[artist_genre[:genre]] = 1
      end
    end
    genre_count
  end

  def self.artist_count
    artist_count = {}
    @@songs.each do |song, artist_genre|
      if artist_count.keys.include? artist_genre[:artist]
        artist_count[artist_genre[:artist]] += 1
      else
        artist_count[artist_genre[:artist]] = 1
      end
    end
    artist_count
  end

end
