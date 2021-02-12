class AddSunriseTimeToSvgMapCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :svg_map_countries, :sunriseTime, :string
  end
end
