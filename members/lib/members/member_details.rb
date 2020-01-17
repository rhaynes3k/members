class Member_details

  attr_accessor :f_name, :l_name, :party, :state, :affl, :served

  @@all = []

  def initialize(f_name, l_name, party, state, affl, served)
    @f_name = f_name
    @l_name = l_name
    @party = party
    @state = state
    @affl = affl
    @served = served
    # @dist = dist
    # @pick = pick

    @@all << self
  end

  def self.all
    @@all
  end

  # def states
  #   self.all.collect do |s|
  #     puts s.state
  #     #binding.pry
  #   end
  # end

  # def mem_more(pick)
  #   self.all.collect do|m|
  #     m.party = pick
  #   end
  # end
end
