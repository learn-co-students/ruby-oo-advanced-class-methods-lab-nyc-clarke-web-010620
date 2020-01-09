require 'pry'

class Song

  attr_accessor :name, :artist_name, :filename

  @@all = []

  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(new_name)
    new_song = self.new
    
    new_song.name = new_name
    new_song
    
  end

  def self.create_by_name(new_name)
    new_song = self.create

    new_song.name = new_name
    new_song

  end

  def self.find_by_name(search_value)

    @@all.find do |ele|
      ele.name == search_value
    end

  end

  def self.find_or_create_by_name(name_or_find)
    
    if self.find_by_name(name_or_find)
      self.find_by_name(name_or_find)
    else
      self.create_by_name(name_or_find)
    end
  end

  def self.alphabetical
    
    @@all.sort_by { |obj| obj.name }

  end

  def self.new_from_filename(file_name)
    new_song = self.create
    
    arr = file_name.split(/[-.]/)
    
    new_song.artist_name = arr[0].strip
    new_song.name = arr[1].strip
    new_song
  end

  
  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)

    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end

end
