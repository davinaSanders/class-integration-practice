require ("minitest/autorun")
require ("minitest/rg")
require_relative("../songs.rb")
require_relative("../rooms.rb")
require_relative("../guests.rb")

class SongTest < MiniTest::Test
  def setup
    @song1 = Song.new("Hello", "Adele")
    @song2 = Song.new("Baby", "Justin Beiber")
    @song3 = Song.new("Imagine", "John Lennon")
  end
end
