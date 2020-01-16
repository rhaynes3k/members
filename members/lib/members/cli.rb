class Members::CLI
  attr_accessor :st_sel

  def call
    #binding.pry
    Mem_srch.loc_srch

     search_query
    list_members
    next?
  end

  def list_members
    i = 1
    Member_details.all.each do|m|
      #binding.pry

      if m.state.downcase == @st_sel.downcase
        puts "#{i}. #{m.f_name} #{m.l_name} #{m.affl}"
        i+=1
      # else
      #   puts "invalid"
      end
      #binding.pry
    end
      #binding.pry
  end

  def search_query
    puts "Enter your state:"
    @st_sel = gets.chomp

    #puts "You live in #{state}?"
    #next?
  end

  def next?
    puts "Would you like to search again? 1 = Yes 2 = No"
    ans = gets.chomp
    case ans
      when "1"
        search_query
        list_members
        next?
      when "2"
        goodbye
    end
  end

  def goodbye
    puts "Thank you! Have a great day!"
  end
end
