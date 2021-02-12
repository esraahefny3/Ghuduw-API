class ChangePrayerTimesDataTypes < ActiveRecord::Migration[6.0]
  def up
   change_column :svg_map_countries, :fajrTime, :string
   change_column :svg_map_countries, :duhrTime, :string
   change_column :svg_map_countries, :asrTime, :string
   change_column :svg_map_countries, :maghribTime, :string
   change_column :svg_map_countries, :ishaTime, :string
   change_column :svg_map_countries, :fajrTime, :string
  end

 def down
   change_column :svg_map_countries, :fajrTime, :time
   change_column :svg_map_countries, :duhrTime, :time
   change_column :svg_map_countries, :asrTime, :time
   change_column :svg_map_countries, :maghribTime, :time
   change_column :svg_map_countries, :ishaTime, :time
 end
end
