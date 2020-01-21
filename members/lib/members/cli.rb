class Members::CLI
  attr_accessor :st_sel, :pick, :spec2b, :g

  def call
    Mem_srch.loc_srch
     search_query
  end

  def list_members
    i = 1
    @g = Member_details.all.select do|m|m.spec1b
      if m.spec1b.downcase == @st_sel.downcase
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
      sts = []
      Member_details.all.each do|s|
        sts << s.spec1b.downcase
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
    puts "Select 0 to search again."
    puts "Select any key to exit"
    pick = gets.chomp.to_i
    if pick > 0
      x = @g.collect{|m|m}
      puts "*****************************************************************"
      puts "#{x[pick-1].affl} #{x[pick-1].f_name} #{x[pick-1].l_name.delete ","}"
      puts "#{x[pick-1].spec1a} #{x[pick-1].spec1b}"
      puts "#{x[pick-1].spec3a} #{x[pick-1].spec3b.split("                    ").join("     ")}"
      puts "#{x[pick-1].spec4a} #{x[pick-1].spec4b}"
      puts "#{x[pick-1].spec2a} #{x[pick-1].spec2b}"
      puts "*****************************************************************"
      next?
    elsif pick == 0
      search_query
    else
      goodbye
    end
  end

  def next?
    puts "Would you like to search again? Yes or No?"
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
