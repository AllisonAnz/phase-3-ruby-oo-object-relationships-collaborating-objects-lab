# Collaborating Objects 

# Sticking with our song/artist example 
# song class is responsible for handling songs 
# artist class is responsible for handling artists
# These have relation to one another 
# a song belongs to an artist 
# and an artist has many songs 
# these two classes have to collaborate 

# If we had a MP# importer that is responsible for taking in a bunch of MP3 files and making 
# a song for each unique filename 
# MP3 importer will have to have communication with the Song class 

# MP3 Importer collaborating with Songs 
# MP3 Importer takes in a list of mp3s and sends each mp3 filename to the Song class to make a song 
# It will receive a list of filenames like "Drake - Hotline Bling"
# MP3 Importer will then send each of those filenames to Song class to be created 
class Song 
    attr_accessor :title 

    def self.new_by_filename(filename)
        song = self.new
        song.title = filename.split(" - ")[1]
        song 
    end
end

class MP3Importer 
    def import(list_of_filenames)
        list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
    end
end 

# Within the MP#Importer class we are calling the Song class and a method within the Song class .new_by_filename
# When we hit this line of code, it will send us the SOng class to do whatever behavior we have defined in it 
# Then we will return to the MP3Importer class to continue executing the code. This is at the heart of collaborating objects.

# Songs collaborating with Artist 
# Since our song belongs to an artist 
# we will want to collaborate with the Artist class at some point 
class Song
  attr_accessor :artist

  # other methods

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end
end 

class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # other methods

end 

# The point of this code is that we want to be able to execute the following 
hotline_bling = Song.new('Hotline Bling')
hotline_bling.artist_name = "Drake"
hotline_bling.artist #=> Drake
# This should then return the new Artist object that was created by the #artist_name method
