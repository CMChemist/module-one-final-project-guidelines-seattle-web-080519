class CreateTableReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.integer :rating
      t.text :content
    end
  end
end
