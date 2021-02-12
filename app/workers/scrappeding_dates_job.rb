
require 'open-uri'
require 'nokogiri'

class ScrappedingDatesJob include Sidekiq::Worker



  FAJR_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Fajr']/p[3])";
  SUNRISE_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Sunrise']/p[3])";
  DUHR_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Duhr']/p[3])";
  ASR_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Asr']/p[3])";
  MAGHRIB_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Maghrib']/p[3])";
  ISHA_TIME_XPATH="string(//div[translate(normalize-space(p), ' ', '')='Isha']/p[3])";
  HIGRI_DATE_XPATH="div#grey div";
  def perform()
     arr=getAllCountriesIdsAndUrls;
    arr.each do |subArr|
      # subArr[0]=>id
      # subArr[1]=>url
        if  url_valid?(subArr[1])
          docHtml= Nokogiri::HTML (open(subArr[1]));
          svgMapCountryRow=SvgMapCountry.find(subArr[0]);

          #KDA FADL a at3 l higri date ll hijriDay,hijriMonth,hijriYear
          #,hijriNight, w aset lastUpdate
          #w fadl l automatic call l method de l sa3a 12 kol yom w a3ml serviec get ll info de bl country code
          updateCountryScrappedDate(svgMapCountryRow,docHtml);
          updateFajrTime(svgMapCountryRow,docHtml);
          updateSunriseTime(svgMapCountryRow,docHtml);
          updateDuhrTime(svgMapCountryRow,docHtml);
          updateAsrTime(svgMapCountryRow,docHtml);
          updateMaghribTime(svgMapCountryRow,docHtml);
          updateIshaTime(svgMapCountryRow,docHtml);


        end
    end

  end

 private
 #UPDATE SCRAPPED HIGRI DATE
  def  updateCountryScrappedDate(svgMapCountryRow,docHtml)
    scrappedData=docHtml.at_css(HIGRI_DATE_XPATH).text;
    svgMapCountryRow.update(scrapedDate:scrappedData);
    updateHigriTimeFields(svgMapCountryRow,scrappedData);
  end

  def updateHigriTimeFields(svgMapCountryRow,scrappedData)
      scrappedDataArr = scrappedData.split(' ');
      # set higri day
      higriDay=scrappedDataArr[0][0..-3];
      svgMapCountryRow.update(hijriDay:higriDay);
      # set higri night
      if higriDay<29
      svgMapCountryRow.update(hijriNight:higriDay.to_i+1);
      # else
      end
        # set higri month
      i=1;
      higriMonth='';
      while i<scrappedDataArr.length()-1 do
        higriMonth=higriMonth+scrappedDataArr[i];
        i=i+1;
      end
      svgMapCountryRow.update(hijriMonth:higriMonth[0..-2]);
      svgMapCountryRow.update(hijriYear:scrappedDataArr[-1]);
  end

  def  updateFajrTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(FAJR_TIME_XPATH);
  svgMapCountryRow.update(fajrTime:scrappedData);
  end

  def  updateSunriseTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(SUNRISE_TIME_XPATH);
  svgMapCountryRow.update(sunriseTime:scrappedData);
  end

  def  updateDuhrTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(DUHR_TIME_XPATH);
  svgMapCountryRow.update(duhrTime:scrappedData);
  end

  def updateAsrTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(ASR_TIME_XPATH);
  svgMapCountryRow.update(asrTime:scrappedData);
  end

  def  updateMaghribTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(MAGHRIB_TIME_XPATH);
  svgMapCountryRow.update(maghribTime:scrappedData);
  end

  def  updateIshaTime(svgMapCountryRow,docHtml)
  scrappedData=docHtml.xpath(ISHA_TIME_XPATH);
  svgMapCountryRow.update(ishaTime:scrappedData);
  end


  def  getAllCountriesIdsAndUrls
    SvgMapCountry.pluck(:id,:ajaxUrl);
  end
  # a URL may be technically well-formed but may
 # not actually be valid, so this checks for both.
 def  url_valid?(url)
   url = URI.parse(url) rescue false
   url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
 end
end
