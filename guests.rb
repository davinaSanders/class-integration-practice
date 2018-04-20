class Guest
  attr_reader :name, :wallet, :song
  def initialize(name, wallet, song)
    @name = name
    @wallet = wallet
    @song = song
  end

  def remove_fee(room)
    @wallet -= room.fee()
  end
end
