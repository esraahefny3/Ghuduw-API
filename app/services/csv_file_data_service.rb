
require 'csv'
class CsvFileDataService

  #load data from csv file and put it in SvgMapCountry table
  def self.loadCSVFileToSvgMapCountry
  #delete all data in SvgMapCountry table
    SvgMapCountry.destroy_all

    csv = getCSVFileParser;
    #iterate the file rows and create new SvgMapCountry object for every row
    csv.each do |row|
         # byebug
         if !row["id"].nil?
           SvgMapCountry.create!(row.to_hash)
         end
    end
   end

private
  #getCSV file parser
  def self.getCSVFileParser
    csv = CSV.parse(File.read("#{Rails.root}/public/SVGMapCountries-DATABASE.csv"), headers: true)
  end


end
