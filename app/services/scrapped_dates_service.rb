 require 'open-uri'
require 'nokogiri'
class ScrappedDatesService

  def self.updateCountriesDates
    arr=getAllCountriesIdsAndUrls;
    arr.each do |subArr|
        if  url_valid?(subArr[1])
          scrappedData= getScrappedDataField(subArr[1]);
          updateCountryScrappedDate(subArr[0],scrappedData);

        end
    end

  end

private
  def self.updateCountryScrappedDate(id,scrappedData)
    svgMapCountry=SvgMapCountry.find(id);
    svgMapCountry.update(scrapedDate:scrappedData);
  end

  def self.getScrappedDataField(url)
      html = Nokogiri::HTML (open(url));
      puts html.xpath("//div//p").collect(&:text)
      scrappedData= html.at_css("div#grey div").text;

  end

  def self.getAllCountriesIdsAndUrls
    SvgMapCountry.pluck(:id,:ajaxUrl);
  end
  # a URL may be technically well-formed but may
 # not actually be valid, so this checks for both.
 def self.url_valid?(url)
   url = URI.parse(url) rescue false
   url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
 end
end
