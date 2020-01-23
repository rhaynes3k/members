class Members::CLI
  attr_accessor :st_sel, :pick, :spec2b, :g

  def call
    Mem_srch.loc_srch
     search_query
  end

  def list_members
    i = 1
    @g = Member_details.all.select do|m|m.state
      if m.state.downcase == @st_sel.downcase
        puts "#{i}. #{m.f_name} #{m.l_name} #{m.affl}"
        puts "*****************************************************************"
        i+=1
      end
    end
  end

  def search_query
    puts "*****************************************************************"

    puts "               Welcome to Congre-search"

    puts "*****************************************************************"
    puts "    Enter state:"
    @st_sel = gets.chomp
    #@st_sel = states[1] if @st_sel == states[0] | states[1] | states[2] | states[3]
      sts = []
      Member_details.all.each do|s|
        sts << s.state.downcase
#binding.pry
      end
      if sts.include?(@st_sel.downcase)
        puts "The congressional line-up for the state of #{@st_sel.capitalize}"
        puts
        list_members
        puts
        more
      else
        puts "No way!"
        search_query
      end
    end

  def more
    puts "For more information on a congressperson select a number."
    puts
    puts "Enter 0 to search again. Enter 111 to exit"
    pick = gets.chomp.to_i
    if pick > 0 && pick < @g.length+1
      x = @g.collect{|m|m}
      puts "*****************************************************************"
      puts "#{x[pick-1].affl} #{x[pick-1].f_name} #{x[pick-1].l_name.delete ","}"
      puts "State: #{x[pick-1].state}"
      puts "Party: #{x[pick-1].party}"
      puts "District: #{x[pick-1].district}"
      puts "Served: #{x[pick-1].served.split("                    ").join("     ")}"
      puts "*****************************************************************"
      more
    elsif pick == 0
      next?
    elsif pick > 100
      goodbye
    end
  end

  def next?
    puts "Would you like to search a different state? Yes or No?"
    ans = gets.chomp.downcase
    case ans
      when "yes"
        search_query
        more
      when "no"
        goodbye
      else
        puts "I do not understand. Please try again. Yes or No?"
        next?
    end
  end

  def goodbye
    puts "Thank you! Have a great day!"
    exit
  end

end
