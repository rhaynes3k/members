class Member_details

  attr_accessor :f_name, :l_name, :affl, :spec1a, :spec1b, :spec2a, :spec2b, :spec3a, :spec3b, :spec4a, :spec4b, :spec5a, :spec5b

  @@all = []

  def initialize(f_name, l_name, affl, spec1a, spec1b, spec2a = nil, spec2b = nil, spec3a = nil, spec3b = nil, spec4a = nil, spec4b = nil, spec5a = nil, spec5b = nil)
    @f_name = f_name
    @l_name = l_name
    @affl = affl
    @spec1a = spec1a
    @spec2a = spec2a
    @spec3a = spec3a
    @spec4a = spec4a
    @spec5a = spec5a
    @spec1b = spec1b
    @spec2b = spec2b
    @spec3b = spec3b
    @spec4b = spec4b
    @spec5b = spec5b
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
