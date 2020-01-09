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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(song_to_find)
    found = nil
    self.all.each do |song|
      if song.name == song_to_find
        found = song
      end
    end
    return found
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      return self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(file)
    arr = file.split("-")
    song_name = arr[-1].chomp(".mp3").strip
    artist_name = arr[0].strip
    new_obj = self.create_by_name(song_name)
    new_obj.artist_name = artist_name
    new_obj
  end

  def self.create_from_filename(file)
    song= self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
