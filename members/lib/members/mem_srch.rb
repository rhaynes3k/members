class Mem_srch

  def self.loc_srch
    page = 1
    while page < 4
    rep = Nokogiri::HTML(open("https://www.congress.gov/members?q={%22congress%22:%22116%22}&searchResultViewType=expanded&KWICView=false&pageSize=250&page=#{page}"))
    congs = rep.css(".expanded").each do|cong|
        mem_info = cong.css(".result-heading a").text.split
        f_name = mem_info[2, 3].join(" ")
        l_name = mem_info[1]
        affl = mem_info[0]
        specs = cong.text.split("\n").map{|e|e.strip}.reject{|e|e.empty?}
        spec1a = specs[3]
        spec1b = specs[4]
        spec2a = specs[5]
        spec2b = specs[6]
        spec3a = specs[7]
        spec3b = specs[8]
        spec4a = specs[9]
        spec4b = specs[10]
        spec5a= specs[5]
        spec5b = specs[6]
        Member_details.new(f_name, l_name, affl, spec1a, spec1b, spec2a, spec2b, spec3a, spec3b, spec4a, spec4b, spec5a, spec5b)
#binding.pry
      end
      page += 1
    end
  end

end
