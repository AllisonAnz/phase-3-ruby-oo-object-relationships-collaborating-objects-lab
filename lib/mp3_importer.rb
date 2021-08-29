#MP3Importer
#  #initialize: accepts a file path to parse mp3 files from (FAILED - 10)
#  #files
#    loads all the mp3 files in the path directory (FAILED - 11)
#    normalizes the filename to just the mp3 filename with no path (FAILED - 12)
#  #import: imports the files into the library by creating songs from a filename (FAILED - 13)
class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end

# class MP3Importer 
#     def import(list_of_filenames)
#         list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
#     end
# end 
