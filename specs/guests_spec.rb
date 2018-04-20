require ("minitest/autorun")
require ("minitest/rg")
require_relative("../songs.rb")
require_relative("../rooms.rb")
require_relative("../guests.rb")


class GuestTest < MiniTest::Test
  def setup
    @Guest = Guest.new("Juan", 100 ,"Fly me to the moon")
  end

  def test_remove_fee
    assert_equal()
  end
end
