class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :short_title
      t.text :long_description
      t.integer :rating

      t.timestamps
    end
  end
end
