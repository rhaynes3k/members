class Mem_srch


  def self.loc_srch

    page = 1
    while page < 4
    rep = Nokogiri::HTML(open("https://www.congress.gov/members?q={%22congress%22:%22116%22}&searchResultViewType=expanded&KWICView=false&pageSize=250&page=#{page}"))
    congs = rep.css(".expanded").each do|cong|
        mem_info = cong.css(".result-heading a").text.split
        f_name = mem_info[2]#rep.css(".expanded")[0].css(".result-heading a").text
        l_name = mem_info[1]
        party = cong.css(".result-item span")[2].text
        state = cong.css(".result-item span")[0].text
        affl = mem_info[0]
        served = cong.css(".result-item li").text
        #binding.pry
        Member_details.new(f_name, l_name, party, state, affl, served)
        #binding.pry
      end
      page += 1
    end
  end

end
