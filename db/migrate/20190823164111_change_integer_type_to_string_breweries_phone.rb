class ChangeIntegerTypeToStringBreweriesPhone < ActiveRecord::Migration[5.0]
  def change
    change_column :breweries, :phone, :text
  end
end
