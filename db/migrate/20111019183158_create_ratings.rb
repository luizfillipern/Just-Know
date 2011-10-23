class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.string :comment

      t.timestamps
    end
  end
end
