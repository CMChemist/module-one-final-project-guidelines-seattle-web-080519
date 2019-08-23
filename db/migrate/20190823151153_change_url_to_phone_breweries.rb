class ChangeUrlToPhoneBreweries < ActiveRecord::Migration[5.0]
  def change
    change_column :breweries, :url, :integer
    rename_column :breweries, :url, :phone
  end
end
