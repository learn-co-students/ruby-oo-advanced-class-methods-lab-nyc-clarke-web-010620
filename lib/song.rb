require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create 
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.find{|object| object.name == name}
  end

  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      Song.all.each do|object|
        if object.name == name
          return object
        end
      end
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    Song.all.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(file)
    # string = file.
    name_strings = file.slice(0..file.length-5).split("-").map {|string| string.strip}
    song = self.new
    song.name = name_strings[1]
    song.artist_name = name_strings[0]
    @@all << song
    song
  end

  def self.create_from_filename(file)
    # string = file.
    name_strings = file.slice(0..file.length-5).split("-").map {|string| string.strip}
    song = self.new
    song.name = name_strings[1]
    song.artist_name = name_strings[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
