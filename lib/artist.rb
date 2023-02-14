require 'pry'
require_relative './concerns/memorable'
require_relative './concerns/findable'
require_relative './concerns/paramable'


class Artist
  extend Memorable::ClassMethods
include Memorable::InstanceMethods
  extend Findable
  include Paramable
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end


end
# jayz= Artist.new
# jayz.name= "jayz"
# beyonce = Artist.new
# beyonce.name = "beyonce"
# # puts Artist.all
# # puts Artist.find_by_name('beyonce')
# puts beyonce.name