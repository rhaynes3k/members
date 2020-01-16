class Members::CLI
  attr_accessor :st_sel

  def call
    #binding.pry
    Mem_srch.loc_srch
     search_query
  end

  def list_members#(state)
    i = 1
    Member_details.all.select do|m|m.state
      #binding.pry
      if m.state.downcase == @st_sel.downcase
        puts "#{i}. #{m.f_name} #{m.l_name} #{m.affl}"
        i+=1
      end
    end
  end

  def search_query
    puts "Enter your state:"
    @st_sel = gets.chomp
      sts = []

      Member_details.all.each do|s|
        sts << s.state.downcase
        #binding.pry
      end
        #binding.pry
      if sts.include?(@st_sel.downcase)
        list_members#(@st_sel)
        #binding.pry
      else
        puts "No way!"
        next?
      end
    end

  def next?
    puts "Would you like to search again? Yes or No"
    ans = gets.chomp
    case ans
    when "Yes"
        search_query
        list_members
        next?
      when "No"
        goodbye
    end
  end

  def goodbye
    puts "Thank you! Have a great day!"
    abort
  end
end
