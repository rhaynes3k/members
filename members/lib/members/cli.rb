class Members::CLI

  def call
    search_query
    list_members
    
  end
  
  def list_members
    puts "Members of Congress"
    puts <<-DOC
      1. Me
      2. Me again
    DOC
  end
  
  def search_query
    puts "Enter your state:"
    state = gets.chomp
    puts "You live in #{state}?"
    next?
  end
  
  def next?
    puts "Would you like to search again? 1 = Yes 2 = No"
    ans = gets.chomp
    case ans
      when "1"
        search_query
      when "2"
        goodbye
    end
  end
  
  def goodbye
    puts "Thank you! Have a great day!"
  end
end