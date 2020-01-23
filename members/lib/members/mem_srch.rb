class Mem_srch

  def self.loc_srch
    page = 1
    while page < 4
    rep = Nokogiri::HTML(open("https://www.congress.gov/members?q={%22congress%22:%22116%22}&searchResultViewType=expanded&KWICView=false&pageSize=250&page=#{page}"))
    congs = rep.css(".expanded").each do|cong|
        mem_info = cong.css(".result-heading a").text.split
        specs = cong.text.split("\n").map{|e|e.strip.gsub(":", "").downcase}.reject{|e|e.empty?}

        attributes = {
          :f_name =>  mem_info[2, 3].join(" "),
          :l_name => mem_info[1],
          :affl => mem_info[0],
          specs[3] => specs[4].capitalize,
          specs[5] => specs[6].capitalize,
          specs[7] => specs[8].capitalize,
          specs[9] => specs[10]
        }.compact

        Member_details.new(attributes)
      end
      page += 1
    end
  end

end
