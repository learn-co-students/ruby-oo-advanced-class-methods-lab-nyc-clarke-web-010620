require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
    # binding.pry

  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
      # song.name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    part_name = filename.split(" - ")
    artist_name = part_name[0]
    song_name = part_name[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    # song.save
    song
  end

  def self.create_from_filename(filename)
    file_part = filename.split(" - ")
    artist_name = file_part[0]
    song_name = file_part[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end


# best_song_ever = Song.create

Song.create_from_filename("Rufus du Sol - No Place.mp3")
Song.create_from_filename("Odesza - All we need.mp3")
# puts Song.find_by_name("No Place")
puts Song.all
# Song.create_from_file("Lil Boosie - Set it off.mp3")
# puts Song.all
# Song.destroy_all
# puts Song.all
