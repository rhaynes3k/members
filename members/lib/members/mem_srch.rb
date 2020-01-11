class Members::Mem_srch
  
  def search
    
  end
  
  def loc_srch
    rep = Nokogiri::HTML(open("https://www.congress.gov/members?q={%22congress%22:116}&searchResultViewType=expanded&KWICView=false"))
    binding.pry
  end
  
end