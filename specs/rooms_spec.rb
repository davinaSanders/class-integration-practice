require ("minitest/autorun")
require ("minitest/rg")
require_relative("../songs.rb")
require_relative("../rooms.rb")
require_relative("../guests.rb")


class RoomTest < MiniTest::Test
  def setup

    songs = []
    @Room = Room.new(songs, 20, 2)
    @Room1 = Room.new(songs, 30, 3)
    @Room2 = Room.new(songs, 40, 4)
    @song1 = Song.new("Hello", "Adele")
    @song2 = Song.new("Baby", "Justin Beiber")
    @song3 = Song.new("Imagine", "John Lennon")
    @Guest = Guest.new("Juan", 100 ,"Hello")
    @Guest1 = Guest.new("Rachel", 30 ,"Baby")
    @Guest2 = Guest.new("Hannah", 60, "Imagine")

  end

  def test_add_songs
    assert_equal(["Hello"], @Room.add_songs(@song1))
  end

  def test_add_multiple_songs
    @Room.add_songs(@song1)
    @Room.add_songs(@song2)
    @Room.add_songs(@song3)
    assert_equal(["Hello", "Baby", "Imagine"], @Room.songs())
  end

  def test_add_person
    @Room1.add_people_to_room(@Guest)
    @Room1.add_people_to_room(@Guest1)
    assert_equal(2, @Room1.people_in_room().count())
    assert_equal(["Juan", "Rachel"], @Room1.people_in_room())
  end

  def test_add_person__not_enough_money
    assert_equal("no sale", @Room2.add_people_to_room(@Guest1))
  end

  def test_add_person__does_have_enough
    @Room2.add_people_to_room(@Guest2)
    assert_equal(1, @Room2.people_in_room.count())
  end

  def test_add_person__full
    @Room.add_people_to_room(@Guest)
    @Room.add_people_to_room(@Guest1)
    assert_equal("full", @Room.add_people_to_room(@Guest2))
  end

  def test_remove_person
    @Room.add_people_to_room(@Guest)
    @Room.add_people_to_room(@Guest1)
    @Room.remove_people_from_room(@Guest)
    assert_equal(["Rachel"], @Room.people_in_room())
    assert_equal(1, @Room.people_in_room().count())
  end

  def test_remove_person_empty
    @Room.remove_people_from_room(@Guest)
    assert_equal("empty", @Room.remove_people_from_room(@Guest))
  end


  def test_favourite_song
    @Room.add_songs(@song3)
    assert_equal("Whoo!", @Room.favourite_song(@Guest2))
  end


  def test_favourite_song__different_song
    @Room.add_songs(@song2)
    assert_equal("Whoo!", @Room.favourite_song(@Guest1))
  end

  def test_favourite_song__No
    @Room.add_songs(@song2)
    assert_equal("No!", @Room.favourite_song(@Guest))
  end
end
