class Member_details
  attr_accessor :f_name, :l_name, :party, :state, :affl

  def initialize(f_name, l_name, party, state, affl)
    @f_name = f_name
    @l_name = l_name
    @party = party
    @state = state
    @affl = affl
  end
end
