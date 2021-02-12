
class HigriDatesController < ApplicationController

  #scrape data from islamicfinder website and update dates in db
  # def updateCountriesDate
  #   ScrappedDatesService.updateCountriesDates;
  # end
  #
  # def getData
  #
  #   #https://www.islamicfinder.org/prayer-widget/3041563/shafi/1/0/18.0/17.0
  #   # uri = URI('https://www.islamicfinder.org/prayer-widget/1138958/shafi/3/0/18.0/18.0')
  #   # res = Net::HTTP.get_response(uri)
  #   # html = Nokogiri::HTML::parse(res.body);
  #   # render plain: html.at_css("div#grey div").text;
  #
  #
  #
  #   uri = URI('https://www.facebook.com/marketplace/alexandria/search/?query=iphone%208')
  #   res = Net::HTTP.get_response(uri)
  #   html = Nokogiri::HTML::parse(res.body);
  # render plain: html.at_css("div").text;
  # end

  def displayDBTable
    data=DisplaySvgCountriesMapTableService.getAllTableData;
    render plain:data;
  end


  #load Data from file to db table using CSVFileDataService
  def loadData
   CsvFileDataService.loadCSVFileToSvgMapCountry;
  end
end
