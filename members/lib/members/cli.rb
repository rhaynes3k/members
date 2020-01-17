class Members::CLI
  attr_accessor :st_sel, :pick, :party, :g

  def call
    #binding.pry
    Mem_srch.loc_srch
     search_query
  end

  def list_members#(state)
    i = 1
    @g = Member_details.all.select do|m|m.state
      #binding.pry
      if m.state.downcase == @st_sel.downcase
        #puts "*****************************************************************"

        puts "#{i}. #{m.f_name} #{m.l_name} #{m.affl}"

        puts "*****************************************************************"

        i+=1
      end
    end
  end

  def search_query
    puts "Enter state:"
    @st_sel = gets.chomp
      sts = []

      Member_details.all.each do|s|
        sts << s.state.downcase
        #binding.pry
      end
        #binding.pry
      if sts.include?(@st_sel.downcase)
        list_members#(@st_sel)
        more
        #binding.pry
      else
        puts "No way!"
        next?
      end
    end

  def more
    puts "For more information on a congressperson select a number."
    pick = gets.chomp.to_i
    x = g.collect{|m|m}
    mem_pick = x[pick-1].party
    puts "*****************************************************************"
    puts "#{x[pick-1].f_name} #{x[pick-1].l_name.delete ","}'s party is #{mem_pick}"
    puts "#{x[pick-1].f_name}'s served congress's #{x[pick-1].served}"
    puts "*****************************************************************"

    #mem_pick
       #binding.pry
  end

  def next?
    puts "Would you like to search again? Yes or No"
    ans = gets.chomp
    case ans

      when "Yes"||"yes"
        search_query
        list_members
        next?
      when "No"||"no"
        goodbye
    end
  end

  def goodbye
    puts "Thank you! Have a great day!"
    abort
  end
end
