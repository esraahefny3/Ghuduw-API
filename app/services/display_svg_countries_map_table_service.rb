class DisplaySvgCountriesMapTableService

  def self.getAllTableData
    s=''
    i=1;
   SvgMapCountry.all.each do |row|
     s="#{s}\n#{i}-#{row.attributes}\n=========\n";
     i=i+1;
   end
    s;
  end


end
