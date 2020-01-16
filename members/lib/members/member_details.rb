class Member_details

  attr_accessor :f_name, :l_name, :party, :state, :affl

  @@all = []

  def initialize(f_name, l_name, party, state, affl)
    @f_name = f_name
    @l_name = l_name
    @party = party
    @state = state
    @affl = affl

    @@all << self
  end

  def self.all
    @@all
  end

  def states
    self.all.collect do |s|
      puts s.state
      #binding.pry
    end
  end
end
