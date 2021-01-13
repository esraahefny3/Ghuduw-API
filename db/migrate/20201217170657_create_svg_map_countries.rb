class CreateSvgMapCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :svg_map_countries do |t|
      t.string :pathID
      t.text :pathD
      t.decimal :latitude
      t.decimal :longitude
      t.integer :geoId
      t.string :juristic
      t.integer :methodNumber
      t.integer :fajr
      t.integer :isha
      t.text :ajaxUrl
      t.string :scrapedDate
      t.string :country
      t.string :capital
      t.integer :hijriDay
      t.integer :hijriMonth
      t.integer :hijriYear
      t.datetime :lastUpdate
      t.integer :hijriNight
      t.time :fajrTime
      t.time :duhrTime
      t.time :asrTime
      t.time :maghribTime
      t.time :ishaTime

      t.timestamps
    end
  end
end
