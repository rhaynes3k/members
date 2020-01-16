class Mem_srch

  def search

  end

  def self.loc_srch
    rep = Nokogiri::HTML(open("https://www.congress.gov/members?q={%22congress%22:116}&searchResultViewType=expanded&KWICView=false"))
    congs = rep.css(".expanded").each do|cong|
        f_name = cong.css(".result-heading a").text.split[2]#rep.css(".expanded")[0].css(".result-heading a").text
        l_name = cong.css(".result-heading a").text.split[1]
        party = cong.css(".result-item span")[2].text
        state = cong.css(".result-item span")[0].text
        affl = cong.css(".result-heading a").text.split[0]
        Member_details.new(f_name, l_name, party, state, affl)
    binding.pry
    end
  end

end
