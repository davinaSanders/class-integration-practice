

class Room
  attr_reader :songs, :fee, :capacity, :people_in_room

  def initialize (songs, fee, capacity, people_in_room = [])
    @songs = songs
    @fee = fee
    @capacity = capacity
    @people_in_room = people_in_room
  end

  def add_songs(songs)
    @songs.push(songs.name())
  end

  def favourite_song(guest)
    if @songs.include?(guest.song())
      return "Whoo!"
    else
      return "No!"
    end
  end

  def add_people_to_room(guest)
    return "no sale" if guest.wallet() < @fee
    return "full" if @people_in_room.count() == @capacity
    @people_in_room.push(guest.name()) if guest.name() != nil
  end

  def remove_people_from_room(guest)
    return "empty" if @people_in_room == []
    @people_in_room.delete(guest.name()) if guest.name() != nil
  end



end
