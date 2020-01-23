class Member_details

  attr_accessor :f_name, :l_name, :affl, :state, :district, :party, :served
  @@all = []

  def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
    @f_name = f_name
    @l_name = l_name
    @affl = affl
    @State = state
    @District = district
    @Party = party
    @Served = served

    @@all << self
  end

  def self.all
    @@all
  end

end
