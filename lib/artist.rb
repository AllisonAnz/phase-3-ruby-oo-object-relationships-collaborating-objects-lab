# Artist
#   #initialize with #name: accepts a name for the artist 
#   #name=: sets the artist name 
#   .all: returns all existing Artist instances 
#   #songs: lists all songs that belong to this artist 
#   #add_song: keeps track of an artist's songs 
#   .find_or_create_by_name
#     always returns an Artist instance 
#     finds or creates an artist by name maintaining uniqueness of objects by name property
#     Creates new instance of Artist if none exist 
#   #print_songs: lists all of the artist's songs 

class Artist 
    attr_accessor :name, :songs
    @@all = []

    def initialize(artist_name)
        @name = artist_name 
        save
    end

    def save 
        @@all << self
    end

    def self.all 
        @@all 
    end

    #songs: lists all songs that belong to this artist 
    def songs 
        Song.all.select {|song| song.artist == self}
    end

    #add_song: keepts track of artist's songs 
    def add_song(song)
        song.artist = self 
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    #print_songs list all of the artist's songs 
    def print_songs 
        songs.each {|song| puts song.name}
    end
end