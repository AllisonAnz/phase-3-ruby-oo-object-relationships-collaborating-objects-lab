#Song
#  initialize with a name: accepts a name for the song and makes it accessible through an attribute accessor 
#  name= :sets the song name 
#  artist= sets the artist object to belong to the song 
#  .all: returns all existing Song instances 
#  .new_by_filename
#    creates a new instance of a song from the file that's passed 
#    associates new song instance with the artist from the filename 
#  #artist_name=: accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(song_name)
        @name = song_name 
        save
    end

    def save 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    #  artist= sets the artist object to belong to the song 
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
     end
end
 